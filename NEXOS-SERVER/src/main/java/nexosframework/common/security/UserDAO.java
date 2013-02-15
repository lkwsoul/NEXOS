package nexosframework.common.security;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.access.annotation.Secured;

import com.ibatis.sqlmap.client.SqlMapClient;

/**
 * <p>UserDAO</p>
 * <p>Description: 스프링 보안 처리시 사용하는 DAO (Data Access Object) - 데이터처리를 담당하는 Class(트랜잭션처리 담당)</p>
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
public class UserDAO {
  
  /**
   * 사용되는 SqlMapClient
   */
  private SqlMapClient sqlMapClient;
  
  /**
   * SqlMapClient Setting 
   * @param sqlMapClient
   */
  public void setSqlMapClient(SqlMapClient sqlMapClient){
    this.sqlMapClient = sqlMapClient;
  }
  
  /**
   * 특정 사용자 정보를 조회한다
   * @param userId    사용자 ID
   * @return
   * @throws Exception
   */
  @SuppressWarnings("rawtypes")
  @Secured("ROLE_ANONYMOUS")              // 보안정책상 로그인전 접근가능하도록 처리
  public List getUser(String userId) throws Exception {
    Map<Object, Object> map = new HashMap<Object, Object>();
    map.put("P_USER_ID"     ,userId);
    
    return sqlMapClient.queryForList("WC.GET_LOGIN",map);
  }
}
