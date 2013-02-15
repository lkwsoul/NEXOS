package nexosframework.common.base {
  import nexosframework.common.ConstClass;
  import nexosframework.common.Session;
  
  import flash.display.DisplayObject;
  import flash.events.Event;
  import flash.events.KeyboardEvent;
  import flash.net.LocalConnection;
  import flash.ui.Keyboard;
  
  import spark.components.TitleWindow;
  import mx.controls.Alert;
  import mx.core.ContainerCreationPolicy;
  import mx.events.CloseEvent;
  import mx.events.FlexEvent;
  import mx.events.ValidationResultEvent;
  import mx.managers.IFocusManagerComponent;
  import mx.managers.PopUpManager;
  import mx.utils.ObjectUtil;
  import mx.validators.Validator;

  /**
   * <p>AsetecPopUp</p>
   * <p>Description: Popup에서 사용할 공통 Component.</p>
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
  public class AsetecPopUp extends TitleWindow {
    public function AsetecPopUp() {
      super();
      
      addEventListener(FlexEvent.CREATION_COMPLETE  ,_initApp);
      addEventListener(CloseEvent.CLOSE             ,closePopup);
      
      if(ConstClass!=null && ConstClass.IS_USED_LOCALE==ConstClass.CONST_Y)
        creationPolicy = ContainerCreationPolicy.ALL;
      
      //넓이 재지정
      width = ConstClass.AsetecPopUp.width;
      height = ConstClass.AsetecPopUp.height;
      
      styleName = "PopupPanel";
    }
    
    //#####################################################################################
    // 공통으로 사용하는 변수
    //#####################################################################################
    public    var _program_id:String;
    public    var _sessionCheck:Boolean  = false;
    private   var _popupState:String    = ConstClass.STATE_NONE;
    
    protected var strDeal_div1:String = "1";
    protected var strDeal_div2:String = "1";
    protected var strDeal_div3:String = "1";
    
    public var intRecordCount:int;
    
    //Validation 여부.(false라면 validation 체크 실패, true라면 성공)
    [Inspectable(category="Valid")] 
    [Bindable]
    protected var formIsValid:Boolean = false;
    
    //Validation의 empty여부.
    [Inspectable(category="Valid")] 
    [Bindable]
    protected var formIsEmpty:Boolean = true;
    
    //EmptyID
    [Inspectable(category="Valid")] 
    protected var formError_id:String = null;
    protected var formError_message:String = null;
    
    [Inspectable(category="Valid")] 
    protected var focussedFormControl:DisplayObject; 
    
    [Inspectable(category="Common", enumeration="None,Insert,Update,Delete")]
    [Bindable]
    public function set popupState(value:String):void{
      _popupState = value;
    }
    public function get popupState():String{
      return _popupState;
    }
    
    private var _isResourceUsed:Boolean = true;
    [Inspectable(category="Common", enumeration="true,false")]
    [Bindable]
    public function set isResourceUsed(value:Boolean):void{
      _isResourceUsed = value;
    }
    public function get isResourceUsed():Boolean{
      return _isResourceUsed;
    }      
    
    //#####################################################################################
    // 공통 버튼
    //#####################################################################################
    /**
     * 조회하기.
     */
    public function _inquiry():void{
    }
    
    /**
     * 신규버튼
     */
    public function _new():void{
    }
    
    /**
     * 저장버튼
     */
    public function _save():void{
    }
    
    /**
     * 취소버튼
     */
    public function _cancel():void{
      _inquiry();
    }
    
    /**
     * 삭제버튼
     */
    public function _delete():void{
    }
    
    /**
    * 초기화function
    */
    public function _initApp(event:*=null):void{
      //Close 버튼 기본적으로 보이게 한다.
      closeButton.visible = true;
      
      visible             = false;
    }
    
    /**
     * Close Event처리
     */      
    public function closePopup(event:CloseEvent=null):void{
      removeEventListener(FlexEvent.CREATION_COMPLETE                           ,_initApp);
      removeEventListener(CloseEvent.CLOSE                                      ,closePopup);
      PopUpManager.removePopUp(this);
      
      //--------------강제적으로 GC발생.
      var lc1:LocalConnection;
      var lc2:LocalConnection;
      try{
        lc1 = new LocalConnection();
        lc2 = new LocalConnection();
        lc1.connect("gcConnection");
        lc2.connect("gcConnection");
      }catch(error:ArgumentError) {
      }finally{
        lc1 = null;
        lc2 = null;
      }
      //--------------강제적으로 GC발생.
    }
    
    //#####################################################################################
    // Grid 처리 Function
    //#####################################################################################
    
    /**
     * Changing Event Calling.
     */
    protected function _callChangeEvent(uiObject:*):void{
      var chnageEvent:Event = new Event(Event.CHANGE);
      uiObject.dispatchEvent(chnageEvent);
    }
    
    /**
     * 해당 validator에 대한 validation체크하기.
     */ 
    protected function _validate(validator:Validator):Boolean{                
      var validatorSource:DisplayObject = validator.source as DisplayObject;
      var suppressEvents:Boolean = (validatorSource != focussedFormControl);
      var event:ValidationResultEvent = validator.validate(null, suppressEvents); 
      
      var currentControlIsValid:Boolean = (event.type == ValidationResultEvent.VALID);
      
      // validation 체크여부
      formIsValid = formIsValid && currentControlIsValid;
      
      if(!formIsValid && formError_id==null){
        formError_id = Object(validator.source).id;
        formError_message = event.message;
      }
      return currentControlIsValid;
    }
    
    //#####################################################################################
    // Key Event 처리 Funciton.
    //#####################################################################################
    /**
     * ESC 키로 close하도록 합니다.
     */
    private function titleWindowKeyDown(event:KeyboardEvent):void {
      if (event.charCode == Keyboard.ESCAPE) {
        closePopup();
      }
    }
    //-------------------------------------------------------------------------------------
    
    //#####################################################################################
    // 리소스처리.
    //#####################################################################################
    /**
     * 프로그램 ID취득
     */
    private function getProgramID():String {
      var strTemp:String = this.toString();
      return strTemp.substring(0,8); 
    }

    //-------------------------------------------------------------------------------------
    
    protected var objFocus:IFocusManagerComponent;
    /**
     * Alert처리 이후 포커스 처리하는 function
     * 반드시 objFocus에 값을 활당해야 합니다.
     */
    protected function setFocusAlertBefore(event:CloseEvent):void{
      if(objFocus==null)
        return;
      
      focusManager.setFocus(objFocus);
      objFocus = null;
    }
  }
}