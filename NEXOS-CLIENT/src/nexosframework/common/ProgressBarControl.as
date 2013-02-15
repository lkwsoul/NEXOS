package nexosframework.common {
  
  import nexosframework.components.PopupProgressBar;
  /**
   * <p>ProgressBarControl</p>
   * <p>Description: 시스템 전체적으로 ProgressBar를 핸들링하는 Class</p>
   * <p>Copyright: Copyright(c) 2009</p>
   * <p>Company: ASETEC</p>
   * @author Lee Kyung-woo
   * @version 1.0<br/>
   * -------------------------------------------------------------------------------------------------<br/>
   *  Ver         Date        Author            Description<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   *  1.0         2009-09-03  Lee Kyung-woo     신규작성<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   */
  public class ProgressBarControl {
    
    /**
    * 시스템에서 표시할 Progress Bar
    */
    public static var pbInstance:PopupProgressBar;
    
    /**
    * Progress Bar 생성하기
    */
    public static function make(indeterminate:Boolean=false, label:String=null):void {
      if(pbInstance==null) {
        pbInstance = new PopupProgressBar();
        
        
        pbInstance.width = 500;
        pbInstance.pb.setStyle("trackHeight", "30");
        pbInstance.pb.labelPlacement = "center";
        pbInstance.pb.styleName = "pbProgramStyle";
      }
      
      if(indeterminate)
        pbInstance.pb.mode="event";
      else
        pbInstance.pb.mode="manual";
      
      pbInstance.pb.indeterminate = indeterminate;
      pbInstance.pb.label = label;
      
      _isDestory = false;
    }
    
    private static var _isDestory:Boolean = true;
    /**
    * Progress Bar 삭제하기
    */
    public static function destroy():void {
      //pbInstance = null;
      _isDestory = true;
    }
    
    /**
    * Progress Bar 생성중 여부
    */
    public static function get isProgressing():Boolean {
      return !_isDestory;
    }
  }
}