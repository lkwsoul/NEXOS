package nexosframework.services;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.junit.Assert.assertThat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import nexosframework.service.wc.WCServiceImpl;
import nexosframework.NexosTest;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * <p>LoginOutServiceTest</p>
 * <p>Description: 로그인아웃 테스트 Class</p>
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
@RunWith(SpringJUnit4ClassRunner.class)       // Spring JUnit테스트를 위한 어노테이션 선언
//@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
//@Transactional
public class WCServiceTest extends NexosTest {
  
  @Resource
  private WCServiceImpl wc;
  
  @Before
  public void setUp() {
    //승인 과정없이 처리하므로 주석처리하여 승인하지 않도록 한다 
    //super.setUp();
  }
  
  /**
   * 로그인 테스트를 위한 메소드
   * @throws Exception
   */
  @SuppressWarnings({ "rawtypes", "unchecked" })
  @Test                                       // JUnit 테스트 항목 추가
  public void login() throws Exception {
    //1. 테스트를 위한 조회값 세팅
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("P_USER_ID"     ,"WMS");
    map.put("P_USER_PWD"    ,"?1");
    
    //2. 테스트 호출
    List<Object> list = callListTest(wc, "getLogin", map);
    
    //3. 조회결과에 대한 검증작업
    Map<String,String> mapRow = (Map)list.get(0);
    assertThat(mapRow.get("G_USER_ID"), is("WMS"));
  }
  
  /**
   * 로그아웃 테스트위한 메소드
   * @throws Exception
   */
  @Test
  public void logout() throws Exception {
    boolean bRetrun = callBooleanTest(wc, "getLogout", null);
    
    assertThat(bRetrun , is(true));
  }
  
  @Test
  public void menu() throws Exception {
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("P_USER_ID"     ,"WMS");
    String strReturn = callStringTest(wc, "getMenu", map);
    
    assertThat(strReturn, notNullValue());
    assertThat(strReturn, is("<node></node>"));
  }
}
