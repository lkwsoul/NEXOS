package nexosframework;

import java.util.List;
import java.util.Map;

import nexosframework.common.service.CommonServiceCallBoolean;
import nexosframework.common.service.CommonServiceCallInt;
import nexosframework.common.service.CommonServiceCallList;
import nexosframework.common.service.CommonServiceCallMap;
import nexosframework.common.service.CommonServiceCallObject;
import nexosframework.common.service.CommonServiceCallString;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ContextConfiguration;

/**
 * <p>ServiceTest</p>
 * <p>Description: 스프링 Application context 내 테스트Class</p>
 * <p>Copyright: Copyright (c) 2012</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br>
 * ---------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 *  1.0         2012-11-10  이경우     신규작성<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 */
@ContextConfiguration(locations={"classpath:nexosframework/spring/context-common.xml"
                                ,"classpath:nexosframework/spring/context-datasource.xml"
                                ,"classpath:nexosframework/spring/context-sqlMap.xml"
                                ,"classpath:nexosframework/spring/context-transaction.xml"
                                ,"classpath:nexosframework/spring/test-security.xml"
                                ,"file:src/main/webapp/WEB-INF/spring/dispatcher-servlet.xml"
                                ,"file:src/main/webapp/WEB-INF/spring/flex-servlet-test.xml"})
public class NexosTest {
  
  /**
   * Context를 바로 접근해서 테스트를 할 케이스를 대비한 변수 선언
   */
  @Autowired
  protected ApplicationContext context;
  
  /**
   * 생성자
   */
  public NexosTest(){
  }
  
  public void setUp() {
    //초기화 후 지정
    //SecurityContextHolder.clearContext();
    AuthenticationManager manager = (AuthenticationManager)context.getBean("authenticationManager");
    UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken("user","user");
    Authentication authentication                                           = manager.authenticate(usernamePasswordAuthenticationToken);
    SecurityContextHolder.getContext().setAuthentication(authentication);
  }
  
  /**
   * 서비스 공통 메소드인 callList를 테스트 호출하기 위한 메소드
   * @param service    사용할 서비스
   * @param methodName 메소드명
   * @param map        처리조건
   * @return
   * @throws Exception
   */
  @SuppressWarnings("rawtypes")
  protected List callListTest(CommonServiceCallList service, String methodName, Map<Object,Object> map) throws Exception {
    return service.callList(methodName, map);
  }
  
  /**
   * 서비스 공통 메소드인 callMap를 테스트 호출하기 위한 메소드
   * @param service    사용할 서비스
   * @param methodName 메소드명
   * @param map        처리조건
   * @return
   * @throws Exception
   */
  @SuppressWarnings("rawtypes")
  protected Map callMapTest(CommonServiceCallMap service, String methodName, Map<Object,Object> map) throws Exception {
    return service.callMap(methodName, map);
  }
  
  /**
   * 서비스 공통 메소드인 callString를 테스트 호출하기 위한 메소드
   * @param service    사용할 서비스
   * @param methodName 메소드명
   * @param map        처리조건
   * @return
   * @throws Exception
   */
  protected String callStringTest(CommonServiceCallString service, String methodName, Map<Object,Object> map) throws Exception {
    return service.callString(methodName, map);
  }
  
  /**
   * 서비스 공통 메소드인 callInt를 테스트 호출하기 위한 메소드
   * @param service    사용할 서비스
   * @param methodName 메소드명
   * @param map        처리조건
   * @return
   * @throws Exception
   */
  protected int callIntTest(CommonServiceCallInt service, String methodName, Map<Object,Object> map) throws Exception {
    return service.callInt(methodName, map);
  }
  
  /**
   * 서비스 공통 메소드인 callObject를 테스트 호출하기 위한 메소드
   * @param service    사용할 서비스
   * @param methodName 메소드명
   * @param map        처리조건
   * @return
   * @throws Exception
   */
  protected Object callObjectTest(CommonServiceCallObject service, String methodName, Map<Object,Object> map) throws Exception {
    return service.callObject(methodName, map);
  }

  /**
   * 서비스 공통 메소드인 callBoolean를 테스트 호출하기 위한 메소드
   * @param service     사용할 서비스
   * @param methodName  메소드명
   * @param map         처리조건
   * @return
   * @throws Exception
   */
  protected boolean callBooleanTest(CommonServiceCallBoolean service, String methodName, Map<Object,Object> map) throws Exception {
    return service.callBoolean(methodName, map);
  }
}