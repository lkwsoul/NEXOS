package nexosframework.common.component {
  import mx.controls.ProgressBar;
  import spark.components.Group;

  /**
   * <p>PopupProgressBar</p>
   * <p>Description: Poup형태의 ProgressBar 기본 Component</p>
   * <p>Copyright: Copyright(c) 2010</p>
   * <p>Company: ASETEC</p>
   * @author Lee Kyung-woo
   * @version 1.0<br/>
   * -------------------------------------------------------------------------------------------------<br/>
   *  Ver         Date        Author            Description<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   *  1.0         2010-12-22  Lee Kyung-woo     신규작성<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   */
  public class PopupProgressBar extends Group {
    
    /**
    * Progress Bar
    */
    public var pb:ProgressBar;
    
    /**
    * Constructor
    */
    public function PopupProgressBar() {
      super();
      
      pb = new ProgressBar();
      pb.percentWidth = 100;
      addElement(pb);
    }
  }
}