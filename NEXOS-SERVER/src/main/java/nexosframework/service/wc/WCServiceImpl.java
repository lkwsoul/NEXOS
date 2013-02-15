package nexosframework.service.wc;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import nexosframework.common.SessionNames;
import nexosframework.common.service.CommonServiceCallBoolean;
import nexosframework.common.service.CommonServiceCallList;
import nexosframework.common.service.CommonServiceCallString;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import flex.messaging.FlexContext;

/**
 * <p>WCService</p>
 * <p>Description: WMS Common 서비스를 담당하는 Class</p>
 * <p>Copyright: Copyright (c) 2012</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br>
 * ---------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 *  1.0         2012-11-10  이경우            신규작성<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 */
@Service("wc")                            //Destination명을 서비스명으로 등록한다
@RemotingDestination(channels={"my-amf"}) //기본 사용 채널
@Secured("ROLE_ANONYMOUS")                // 보안정책상 로그인전 접근가능하도록 처리
public class WCServiceImpl implements CommonServiceCallList
                                    , CommonServiceCallBoolean
                                    , CommonServiceCallString { //implements에서 사용할 메소드가 있는 Interface를 넣도록 한다
                                                                //implemsnts할수 있는 대상은 되돌려 주는 데이터형에 따라서 아래와 같다
                                                                //1. CommonServiceCallBoolean   - 리턴 데이터형 Boolean
                                                                //2. CommonServiceCallInt       - 리턴 데이터형 int
                                                                //3. CommonServiceCallList      - 리턴 데이터형 List
                                                                //4. CommonServiceCallMap       - 리턴 데이터형 Map
                                                                //5. CommonServiceCallObject    - 리턴 데이터형 Object
                                                                //6. CommonServiceCallString    - 리턴 데이터형 String
  
  //private final Logger logger = LoggerFactory.getLogger(WCServiceImpl.class);
  
  /**
   * DAO 주입처리하기 
   */
  @Resource
  private WCDAO wcdao;
  
  /**
   * Session 관련(로그인/아웃) 주입처리하기
   */
  @Resource
  private WCSession wcsession;
  
  /**
   * Menu 관련 Bean주입 처리하기
   */
  @Resource
  private WCMenu wcmenu;
  
  @Autowired
  private ApplicationContext appContext;
  
  /**
   * List형태(조회데이터들)의 값을 되돌려 주는 호출 처리
   * @param methodName 메소드명
   * @param map        조회조건
   */
  @SuppressWarnings("rawtypes")
  @RemotingInclude                        // RPC가 가능하도록 설정
  @Secured("ROLE_ANONYMOUS")              // 보안정책상 로그인전 접근가능하도록 처리 
  public List callList(String methodName, Map<Object,Object> map) {
    List listResult = null;
    
    //##########################################################################
    // 로그인하기
    if("getLogin".equals(methodName)){
      //1. 로그인 데이터 조회하기
      listResult = wcdao.getLogin(map);
      //2. 스프링 보안 처리
      wcsession.authenticatePrincipal(appContext, (String)map.get("P_USER_ID"), (String)map.get("P_USER_PWD"));
      //3. 세션변수 세팅 및 로그인 기록 처리하기
      try{
        listResult = wcsession.mappingSession(wcdao, listResult);
      }catch(Exception e){
        //에러발생시 기존 보안처리를 해지하도록 한다
        wcsession.unAuthenticatePrincipal();
        throw new RuntimeException("로그인 세션처리중 오류가 발생하였습니다.");
      }
    }
    
    return listResult;
  }

  /**
   * boolean 형태의 값을 되돌려 주는 호출 처리
   * @param methodName 메소드명
   * @param map        조회조건
   */
  @RemotingInclude                        // RPC가 가능하도록 설정
  @Override
  public boolean callBoolean(String methodName, Map<Object, Object> map) {
    //##########################################################################
    // 로그아웃하기
    if("getLogout".equals(methodName)){
      HttpServletRequest request     = FlexContext.getHttpRequest();
      //1. 세션 삭제
      SessionNames.removeFlexSession();
      SessionNames.removeSession(request);
      //2. 스프링 보안해지
      wcsession.unAuthenticatePrincipal();
    }
    return true;
  }
  
  
  /**
   * String 형태의 값을 되돌려 주는 호출 처리
   * @param methodName 메소드명
   * @param map        조회조건
   */
  @SuppressWarnings("rawtypes")
  @RemotingInclude
  @Override
  public String callString(String methodName, Map<Object, Object> map) {
    //##########################################################################
    // 메뉴정보 가져오기 XML형태의 String을 넘겨 받는다
    if("getMenu".equals(methodName)){
      List listResult = wcdao.getMenu(map);
      return wcmenu.makeMenuXMLString(listResult, false);
    }
    return null;
  }
  
  
}