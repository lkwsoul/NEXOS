package nexosframework.common.service {
  import flash.display.Stage;
  
  import mx.core.FlexGlobals;

  /**
   * <p>ServiceRunner</p>
   * <p>Description: RPC서비스를 호출하는 Class</p>
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
  public class ServiceRunner {
    
    /**
    * 서비스호출 상태 - 호출중 상태
    */
    public static const STATE_RUNNING:String = "RUNNING";
    
    /**
    * 서비스호출 상태 - 중지상태
    */
    public static const STATE_STOP:String    = "STOP";
    
    /**
    * 서비스호출 상태 - 준비상태
    */
    public static const STATE_READY:String   = "READY";
    
    
    private static var _state:String = ServiceRunner.STATE_STOP;
    /**
     * 현재 서비스호출상태 - 기본은 중지상태
     */
    public static function get state():String{
      return _state;
    }
    public static function set state(value:String):void{
      _state = value;
      var stage:Stage;
      trace("[ServiceRunner]_state="+_state);
      
      if(_state==ServiceRunner.STATE_RUNNING){
        stage = mx.core.FlexGlobals.topLevelApplication.stage;
        if(stage){
          stage.mouseChildren = false;
        }
      }
      
      if(_state==ServiceRunner.STATE_STOP){
        stage = mx.core.FlexGlobals.topLevelApplication.stage;
        if(stage){
          stage.mouseChildren = true;
        }
      }
      
    }

    private static var _service:Service;
    /**
     *  호출할 서비스 등록 - 현재 처리할 Service
     */
    public static function set service(service:Service):void {
      //STOP상태가 아닐때는 버퍼에 저장하여 이전 서비스가 종료된
      //이후에 버퍼에 저장된 순으로 호출하도록 한다
      if(ServiceRunner.state!=ServiceRunner.STATE_STOP) {
        ServiceRunner.setBufferService = service;
        return;
      }
      
      ServiceRunner._service = service;
      //준비상태로 변경
      ServiceRunner.state = ServiceRunner.STATE_READY;
    }
    public static function get service():Service{
      return ServiceRunner._service;
    }
    
    /**
    * 서비스 호출
    */
    public static function call():void{
      trace("[ServiceRunner] ServiceRunner.call()");
      if(ServiceRunner.state!=ServiceRunner.STATE_READY) {
        trace("[ServiceRunner] ServiceRunner.state=" + ServiceRunner.state);
        trace("[ServiceRunner] None execute call()");
        return;
      }
      if(ServiceRunner.service==null){
        trace("[ServiceRunner] Service is null");
        trace("[ServiceRunner] None execute call()");
        return;
      }
      //원격서비스 호출
      ServiceRunner.service.call();
      //상태값 변경
      ServiceRunner.state = ServiceRunner.STATE_RUNNING;
    }
    
    /**
    * 서비스 완료처리
    */
    public static function onStop():void{
      if(ServiceRunner.state!=ServiceRunner.STATE_RUNNING) {
        return;
      }
      ServiceRunner.state = ServiceRunner.STATE_STOP;
      ServiceRunner.service = null;
      ServiceRunner.state = ServiceRunner.STATE_STOP;
      
      //버퍼에 저장된 서비스가 존재시 순차적으로 실행하도록 한다
      ServiceRunner.callBufferServices();
    }
    
    //--------------------------------------------------------------------------
    // Runner에 buffer기능 부여
    //--------------------------------------------------------------------------
    private static var _bufferServices:Array;
    
    /**
    * 버퍼에 서비스를 등록한다
    */
    private static function set setBufferService(service:Service):void {
      //1.최초 등록건일 경우
      if(_bufferServices==null){
        _bufferServices = new Array(service);
        return;
      }
      
      //2. 기존 등록된 서비스일경우
      var intOldIndex:int = _bufferServices.indexOf(service);
      if(intOldIndex>-1) {
        trace("[BufferService-ERROR] 이미 서비스런너의 버퍼에 저장된 서비스입니다.");
        return;
      }
      
      //3. 신규 서비스일경우 버퍼에 등록합니다.
      _bufferServices.push(service);
      trace("[BufferService-ENTRY] LENGTH = " + _bufferServices.length);
    }
    
    /**
    * 버퍼에 저장된 서비스를 가져온다
    * 해당 서비스는 버퍼에서 등록이 해지되면 되돌려 준다
    */ 
    private static function get getBufferService():Service {
      try{
        return _bufferServices.shift();
      }finally{
        trace("[BufferService-GET] LENGTH = " + _bufferServices.length);
      }
      return null;
    }
    
    /**
    * 버퍼에 저장된 서비스를 순차적으로 호출한다
    */
    private static function callBufferServices():void {
      if(_bufferServices==null)
        return;
      
      if(_bufferServices.length==0) {
        _bufferServices = null;
        return;
      }
      
      //잔여 버퍼 서비스가 존재할경우만 호출한다
      if( (ServiceRunner.service=ServiceRunner.getBufferService)!=null ){
        trace("[BufferService-RECALL] SERVICE = " + ServiceRunner.service);
        ServiceRunner.call();
      }
    }
  }
}