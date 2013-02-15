package nexosframework.service.wc;

import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import nexosframework.common.NexosDAO;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>WCDAOImpl</p>
 * <p>Description: WMS Common DAO (Data Access Object) - 데이터처리를 담당하는 Class(트랜잭션처리 담당)</p>
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
@Repository("wcdao")    // 주입되는 Bean id 역활을 합니다. 구현 클라스에 따라서 이 부분을 주석처리합니다.
public class WCDAOImpl implements WCDAO {
  
  @Resource
  private NexosDAO nexosDAO;
  
  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCDAO#getLogin(java.util.Map)
   */
  @Override
  @SuppressWarnings({ "rawtypes", "unchecked" })
  public List getLogin(Map<Object,Object> map) {
    //1. 데이터 list형태로 데이터 조회하기
    List listResult = nexosDAO.list("WC.GET_LOGIN" ,map);
    
    if(listResult.size()==0){
      throw new RuntimeException("등록된 사용자 정보가 없습니다.");
    }
    
    //2. 암호비교.
    Map<String,String> mapRow = (Map<String, String>) listResult.get(0);
    String        strUser_pwd =  (String)map.get("P_USER_PWD");
    if(strUser_pwd==null) {
      throw new RuntimeException("암호를 입력해주세요.");
    }
    if(!strUser_pwd.equals( (String)mapRow.get("USER_PWD") )) {
      throw new RuntimeException("입력한 암호가 틀립니다. 확인해주세요.");
    }
    
    //3.조회결과를 return한다
    return listResult;
  }

  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCDAO#getCSUserSysInfo(java.lang.String, java.lang.String)
   */
  @Override
  @SuppressWarnings({ "rawtypes" })
  public List getCSUserSysInfo(String userId, String clientIP) {
    Map<Object,Object> map = new Hashtable<Object, Object>();
    map.put("P_USER_ID"   , userId  );
    map.put("P_CLIENT_IP" , clientIP);
    return nexosDAO.list("WC.GET_CSUSERSYSINFO", map);
  }
  
  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCDAO#updateLoginInfo(java.lang.String, java.lang.String, java.lang.String)
   */
  @Override
  @Transactional
  public void updateLoginInfo(String userId, String clientIP, String regUserId) {
    //List list = getCSUserSysInfo(regUserId, clientIP);
    Map<Object,Object> map = new Hashtable<Object, Object>();
    map.put("P_USER_ID"     , userId  );
    map.put("P_CLIENT_IP"   , clientIP);
    map.put("P_REG_USER_ID" , regUserId);
    
    int intUpdate = nexosDAO.update("WC.UPDATE_CSUSERSYSINFO_LOGIN", map);
    //로그인기록 수정하기
    if(intUpdate==0){
      nexosDAO.insert("WC.INSERT_CSUSERSYSINFO", map);
    }
  }
  
  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCDAO#getMenu(java.util.Map)
   */
  @Override
  @SuppressWarnings("rawtypes")
  public List getMenu(Map<Object,Object> map) {
    return nexosDAO.list("WC.GET_MENU", map);
  }
}
