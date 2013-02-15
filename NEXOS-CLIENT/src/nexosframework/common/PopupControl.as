package nexosframework.common {
  
  /**
   * <p>PopupControl</p>
   * <p>Description: Popup에 대한 호출여부 컨트롤 Class</p>
   * <p>Copyright: Copyright(c) 2009</p>
   * <p>Company: ASETEC</p>
   * @author Lee Jung-Hoon
   * @version 1.0<br/>
   * -------------------------------------------------------------------------------------------------<br/>
   *  Ver         Date        Author            Description<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   *  1.0         2012-04-13  Lee Kyung-woo     신규작성<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   */
  public class PopupControl {
    
    /**
    * Popup호출여부
    */
    public static var isPopup:Boolean = false;
    
    
    /**
     * 초기화하기
     */
    public static function destroy():void {
      isPopup = false;
    }
  }
}