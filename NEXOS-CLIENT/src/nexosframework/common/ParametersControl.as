package nexosframework.common {
  
  /**
   * <p>ParametersControl</p>
   * <p>Description: 화면 이동 중 파라미터 컨트롤 Class</p>
   * <p>Copyright: Copyright(c) 2009</p>
   * <p>Company: ASETEC</p>
   * @author Lee Jung-Hoon
   * @version 1.0<br/>
   * -------------------------------------------------------------------------------------------------<br/>
   *  Ver         Date        Author            Description<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   *  1.0         2012-02-01  Lee Jung-Hoon     신규작성<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   */
  public class ParametersControl {
    
    public static var parameters:Object;
    
    public static function setParameters(value:Object):void {
      if(parameters==null)
        parameters = new Object();
      
      parameters = value;
      
    }
    
    /**
     * parameters 삭제하기
     */
    public static function destroy():void {
      parameters = null;
    }
  }
}