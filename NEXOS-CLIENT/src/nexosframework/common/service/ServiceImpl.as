package nexosframework.common.service
{
  import mx.collections.ArrayCollection;
  import mx.rpc.events.FaultEvent;
  import mx.rpc.events.InvokeEvent;
  import mx.rpc.events.ResultEvent;
  import mx.rpc.remoting.RemoteObject;
  
  /**
   * <p>LoginService</p>
   * <p>Description: 로그인 RPC 호출을 위한 Class - RPC Service와 쌍으로 이루어짐</p>
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
  public class ServiceImpl implements Service  {
    
    /**
    * 생성자
    */
    public function ServiceImpl() {
    }
    
    
    private var _callType:String = ServiceCallType.ARRAYCOLLECITON;
    /**
    * 호출형태를 지정한다(타입은 되돌려 데이터형을 기준으로 합니다.)
    * ServiceCallType에 정의 된 타입값을 가지도록 한다
    */
    public function get callType():String{
      return _callType;
    }
    public function set callType(value:String):void{
      _callType = value; 
    }
    
    private var _rowIndex:int;

    /**
    * 서비스 호출 이후 처리할 Row Index
    */
    public function get rowIndex():int{
      return _rowIndex;
    }

    public function set rowIndex(value:int):void{
      _rowIndex = value;
    }
    
    
    private var _remoteObject:RemoteObject;
    /**
    * RemoteObject
    */
    public function set remoteObject(ro:RemoteObject):void {
      _remoteObject = ro;
    }
    public function get remoteObject():RemoteObject{
      return _remoteObject;
    }
    
    private var _methodName:String;
    /**
    * 호출 Type
    */
    public function get methodName():String{
      return _methodName;
    }
    public function set methodName(value:String):void{
      _methodName = value;
    }
    
    private var _map:Object;
    /**
    * 호출 인자정보
    */
    public function get map():Object{
      return _map;
    }
    public function set map(value:Object):void{
      _map = value;
    }
 
    private var _view:ServiceReceiver;
    /**
    * 호출한 View
    */
    public function get view():ServiceReceiver{
      return _view;
    }

    public function set view(value:ServiceReceiver):void{
      _view = value;
    }
    
    private var _addObject:Object;

    /**
    * 부가적인 값
    */
    public function get addObject():Object{
      return _addObject;
    }

    public function set addObject(value:Object):void{
      _addObject = value;
    }

    
    /**
     * 리모트 오브젝트를 정의해서 생성한다
     */
    public function makeRemoteObject():void{
      remoteObject = new RemoteObject();
      remoteObject.addEventListener(FaultEvent.FAULT    ,faultHandler   );
      remoteObject.addEventListener(ResultEvent.RESULT  ,resultHandler  );
      remoteObject.addEventListener(InvokeEvent.INVOKE  ,invokeHandler  );
    }
    
    /**
     * 원격지매소드 호출 구현 부분
     */
    public function call():void{
      switch(callType){
        //List형태 호출 이면, callList를 호출합니다.
        case ServiceCallType.ARRAYCOLLECITON:
          remoteObject.callList(methodName, map);  
          break;
        
        //Map형태 호출 이면, callMap를 호출합니다.
        case ServiceCallType.MAP:
          remoteObject.callMap(methodName, map);  
          break;
        
        //String형태 호출 이면, callString를 호출합니다.
        case ServiceCallType.STRING:
          remoteObject.callString(methodName, map);  
          break;
        
        //int형태 호출 이면, callInt를 호출합니다.
        case ServiceCallType.INT:
          remoteObject.callList(methodName, map);  
          break;
        
        //boolean형태 호출 이면, callBoolean를 호출합니다.
        case ServiceCallType.BOOLEAN:
          remoteObject.callBoolean(methodName, map);  
          break;
        
        //Object는 callObject를 호출합니다.
        case ServiceCallType.OBJECT:
          remoteObject.callObject(methodName, map);  
          break;
        
      }
    }
    
    /**
     * 실패시 처리 한다.
     * @param FaultEvent
     */
    public function faultHandler(event:FaultEvent):void{
      ServiceRunner.onStop();
      //Event, Destination Name, methodName, rowIndex 순으로 이벤트 호출함
      var fault:ServiceFault = new ServiceFault();
      
      //에러 문자열 처리
      var strFaultString:String = event.fault.faultString;
      strFaultString = strFaultString.replace("java.lang.Exception :","");
      strFaultString = strFaultString.replace("java.lang.RuntimeException :","");
      
      fault.message     = strFaultString;
      fault.destination = remoteObject.destination;
      fault.methodName  = methodName;
      fault.rowIndex    = rowIndex;
      fault.addObject   = addObject;
      
      view.serviceFaultHandler(fault);
    }
    
    /**
     * 성공시 처리한다
     * @param ResultEvent
     */
    public function resultHandler(event:ResultEvent):void{
      ServiceRunner.onStop();
      
      var result:ServiceResult = new ServiceResult();
      
      //Type별로 형변환해서 처리합니다.
      switch(callType){
        //List형태 호출 이면, callList를 호출한다.
        case ServiceCallType.ARRAYCOLLECITON:
          result.resultArrayCollection = ArrayCollection(event.result);
          break;
        
        //Map형태
        case ServiceCallType.MAP:
          result.resultMap     = event.result;
          break;
        
        //String형태
        case ServiceCallType.STRING:
          result.resultString  = String(event.result);
          break;
        
        //int형태
        case ServiceCallType.INT:
          result.resultInt     = int(event.result);
          break;
        
        //boolean형태
        case ServiceCallType.BOOLEAN:
          result.resultBoolean = Boolean(event.result);
          break;
        
        //Object형태
        case ServiceCallType.OBJECT:
          result.resultObject  = event.result;
          break;
        
      }
      
      result.destination = remoteObject.destination;
      result.methodName  = methodName;
      result.rowIndex    = rowIndex;
      result.addObject   = addObject;
      //Event, Destination Name, methodName, rowIndex 순으로 이벤트 호출함
      view.serviceResultHandler(result);
    }
    
    /**
     * 처리시 처리한다 - 추후 추가할 로직이 있다면 추가하도록 한다
     * @param InvokeEvent
     */
    public function invokeHandler(event:InvokeEvent):void{
      
    }
  }
}