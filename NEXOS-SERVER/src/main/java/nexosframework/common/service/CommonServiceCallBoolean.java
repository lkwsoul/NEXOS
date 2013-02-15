package nexosframework.common.service;

import java.util.Map;

/**
 * <p>CommonServiceCallBoolean</p>
 * <p>Description: 서비스에 대한 Interface Class - 리턴값이 Boolean형에 대한 정의</p>
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
public interface CommonServiceCallBoolean {
    
  /**
   * 공통 호출 - boolean 형태의 리턴값을 받기 위한 호출
   * @param methodName
   * @param map
   * @return
   * @throws Exception
   */
  public boolean callBoolean(String methodName, Map<Object,Object> map) throws Exception;
  
}