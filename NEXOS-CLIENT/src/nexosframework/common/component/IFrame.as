package nexosframework.common.component {
  /*
  * 2012-10-05
  * 이경우
  * 소스 정리(다국어 미처리)로 주석처리
  import com.asetec.common.ResourceData;
  */
  
  import flash.events.Event;
  import flash.external.ExternalInterface;
  import flash.geom.Point;
  import flash.net.navigateToURL;
  
  import mx.events.MoveEvent;
  import mx.events.ResizeEvent;
  
  import nexosframework.common.ConstClass;
  
  import spark.components.Group;

  /**
   * <p>AsetecBaseModule</p>
   * <p>Description: 기본 Module Class
       Iframe형식으로 특정 URL을 호출 할때 사용합니다.
       WMSMain.html script 수정이 있어야 합니다.
       
       1. 상단에 아래와 같은 script추가.
       
       function moveIFrame(x,y,w,h) {
            var frameRef=document.getElementById("myFrame");
            frameRef.style.left=x;
            frameRef.style.top=y;
            var iFrameRef=document.getElementById("myIFrame"); 
         iFrameRef.width=w;
         iFrameRef.height=h;
        }
        
        function setIFrame() {
          myFrame.focus();
        }
        
        function hideIFrame(){
            document.getElementById("myFrame").style.visibility="hidden";
        }
         
        function showIFrame(){
            document.getElementById("myFrame").style.visibility="visible";
        }
        
        function loadIFrame(url){
         document.getElementById("myFrame").innerHTML = "iframe id='myIFrame' src='" + url + "'frameborder='0'>&lt;/iframe>";
        }
        
        function unloadIFrame(){
         document.getElementById("myFrame").innerHTML = "";
        }
      
        2. 하단 body 바로이전에 추가.
        
        &lt;div id="myFrame" style="position:absolute;background-color:transparent;border:0px;visibility:hidden;">&lt;/div>
     </p>
   * <p>Copyright: Copyright(c) 2010</p>
   * <p>Company: ASETEC</p>
   * @author Lee Kyung-woo
   * @version 1.0<br/>
   * -------------------------------------------------------------------------------------------------<br/>
   *  Ver         Date        Author            Description<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   *  1.0         2008-04-01  Lee Kyung-woo     신규작성<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   */
  public class IFrame extends Group {
    public function IFrame() {
      super();
      addEventListener(ResizeEvent.RESIZE, resizeFrame );
      addEventListener(MoveEvent.MOVE,     moveIFrame  );
      addEventListener(Event.REMOVED,      _removed    );
      
      this.visible = true;
      resizeFrame();
    }
    
    private var __source: String;
    
    private var _isPost:String = ConstClass.CONST_Y;
    private var _positionChanged:Boolean = false;
    private var _sizeChanged:Boolean = false;
    
    /**
     * Post여부
     */
    public function get isPost():String
    {
      return _isPost;
    }
    public function set isPost(value:String):void
    {
      _isPost = value;
    }
    
    /**
     * 위치변경여부
     */
    public function get positionChanged():Boolean
    {
      return _positionChanged;
    }
    public function set positionChanged(value:Boolean):void
    {
      _positionChanged = value;
    }
    
    /**
     * 크기변경여부
     */
    public function get sizeChanged():Boolean
    {
      return _sizeChanged;
    }
    public function set sizeChanged(value:Boolean):void
    {
      _sizeChanged = value;
    }
    
    private var localPt:Point = new Point(0, 0);
    private var globalPt:Point;
    /**
     * Move iframe through ExternalInterface.  The location is determined using localToGlobal()
     * on a Point in the Canvas.
     **/
    private function moveIFrame(event:Event=null): void{
      globalPt = localToGlobal(localPt);
      flash.external.ExternalInterface.call("moveIFrame", globalPt.x, globalPt.y);
    }
    
    private function resizeFrame(event:Event=null):void {
      ExternalInterface.call("resizeIFrame", this.width, this.height);
    }
    
    /**
     * Move iframe through ExternalInterface.  The location is determined using localToGlobal()
     * on a Point in the Canvas.
     **/
    public function moveIFrameFromContainer(xValue:int,yValue:int): void{
      flash.external.ExternalInterface.call("moveIFrame", xValue, yValue);
    }
    
    private function _creationComplete():void{
      this.visible = true;
      
      resizeFrame();
    }
    
    private function _removed(event:Event=null):void{
      visible = false;
      flash.external.ExternalInterface.call("unloadIFrame",isPost);
      
      removeEventListener(ResizeEvent.RESIZE, resizeFrame );
      removeEventListener(MoveEvent.MOVE,     moveIFrame  );
      removeEventListener(Event.REMOVED,      _removed    );
    }
    
    /**
     * The source URL for the IFrame.  When set, the URL is loaded through ExternalInterface.
     **/
    public function set source(source: String): void{
      if (source){
        if (! flash.external.ExternalInterface.available){
          throw new Error("ExternalInterface is not available in this container. Internet Explorer ActiveX, Firefox, Mozilla 1.7.5 and greater, or other browsers that support NPRuntime are required.");
        }
        __source = source;
        flash.external.ExternalInterface.call("loadIFrame", source,isPost);
        moveIFrame();
      }
    }
    
    public function get source(): String
    {
      return __source;
    }
    
    /**
     * Whether the IFrame is visible.  
     **/
    override public function set visible(visible: Boolean): void
    {
      super.visible=visible;
      
      if (visible)
      {
        flash.external.ExternalInterface.call("showIFrame");
      }
      else 
      {
        flash.external.ExternalInterface.call("hideIFrame");
      }
    }
  }
}