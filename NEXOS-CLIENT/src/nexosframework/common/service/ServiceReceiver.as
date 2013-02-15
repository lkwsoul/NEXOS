package nexosframework.common.service {
  /**
   * <p>ServiceReceiver</p>
   * <p>Description: RPC 통신이후에 데이터를 받는 인터페이스</p>
   * <p>Copyright: Copyright(c) 2012</p>
   * <p>Company: ASETEC</p>
   * @author Lee Kyung-woo
   * @version 1.0<br/>
   * ---------------------------------------------------------------------------<br/>
   *  Ver         Date        Author            Description<br/>
   * ---------    ----------  ---------------   --------------------------------<br/>
   *  1.0         2012-11-15  Lee Kyung-woo     신규작성<br/>
   * ---------    ----------  ---------------   --------------------------------<br/>
   */ 
  public interface ServiceReceiver{
    
    /**
     * RPC통신 이후 실패했을때, 처리
     * @param 실패결과
    */
    function serviceFaultHandler(fault:ServiceFault):void;
    
    /**
     * RPC통신 이후 성공했을때, 처리
     * @param ServiceResult 처리 결과를  resultArrayCollection, resultMap,
     *                      resultString...등으로 결과를 받을 수 있습니다.
     */
    function serviceResultHandler(result:ServiceResult):void;
    
  }
}