package nexosframework.common;

import java.util.List;
import java.util.Map;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

/**
 * <p>NexosDAO</p>
 * <p>Description: 모든 DAO (Data Access Object) - 데이터처리를 담당하는 최상위 클라스</p>
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
public class NexosDAO {
  
  //IBatis의 sqlMapClient를 사용하지 않고
  //spring의 SqlMapClientTemplate를 사용하도록 합니다.
  //@Resource
  //protected SqlMapClient sqlMapClient;
  
  private SqlMapClientTemplate sqlMapClientTemplate;
  
  /**
   * SqlMapClientTemplate 를 가져옵니다.
   * @return
   */
  public SqlMapClientTemplate getSqlMapClientTemplate() {
    return sqlMapClientTemplate;
  }

  /**
   * SqlMapClientTemplate 를 주입합니다.
   * @param sqlMapClientTemplate
   */
  public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
    this.sqlMapClientTemplate = sqlMapClientTemplate;
  }

  /**
   * 리스트 형태로 데이터 조회하기
   * @param queryID    조회할 쿼리아이디
   * @param map        조회 조건
   * @return           조회 결과
   * @throws Exception
   */
  @SuppressWarnings("rawtypes")
  public List list(String queryID, Map<Object, Object> map) {
   return sqlMapClientTemplate.queryForList(queryID,map);
  }
  
  /**
   * 입력 처리하기
   * @param queryID   입력처리할 쿼리아이디
   * @param map       입력처리할 데이터
   * @return The primary key of the newly inserted row.  This might be automatically
   *         generated by the RDBMS, or selected from a sequence table or other source.
   * @throws Exception
   */
  public Object insert(String queryID, Map<Object, Object> map) {
    return sqlMapClientTemplate.insert(queryID,map);
   }
  
  /**
   * 수정 처리하기
   * @param queryID    업데이트할 쿼리아이디
   * @param map        업데이트할 데이터
   * @return           처리 갯수
   * @throws Exception
   */
  public int update(String queryID, Map<Object, Object> map) {
    return sqlMapClientTemplate.update(queryID, map);
  }
  
  /**
   * 삭제처리 하기
   * @param queryID
   * @param map
   * @return
   * @throws Exception
   */
  public int delete(String queryID, Map<Object, Object> map) {
    return sqlMapClientTemplate.update(queryID, map);
  }
}
