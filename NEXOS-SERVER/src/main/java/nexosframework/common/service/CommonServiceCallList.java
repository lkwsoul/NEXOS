package nexosframework.common.service;

import java.util.List;
import java.util.Map;

/**
 * <p>IService</p>
 * <p>Description: 서비스에 대한 Interface Class</p>
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
public interface CommonServiceCallList {
  
  /**
   * 공통 호출 - List형태의 리턴값을 받기 위한 호출 
   * @param methodName
   * @param map
   * @return
   * @throws Exception
   */
  @SuppressWarnings("rawtypes")
  public List callList(String methodName, Map<Object,Object> map) throws Exception;
  
}