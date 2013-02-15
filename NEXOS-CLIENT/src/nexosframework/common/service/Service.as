package nexosframework.common.service {
  
  import mx.collections.ArrayCollection;
  import mx.rpc.events.FaultEvent;
  import mx.rpc.events.InvokeEvent;
  import mx.rpc.events.ResultEvent;
  import mx.rpc.remoting.RemoteObject;
  
  /**
   * <p>IService</p>
   * <p>Description: RPC Service 공통 Interface - 실제 원격지에 호출하는 메소드와 같게 구성</p>
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
  public interface Service {
    
    /**
    * 호출타입
    */
    function get callType():String;
    function set callType(value:String):void;
    
    /**
     * RemoteObject
     */
    function set remoteObject(ro:RemoteObject):void;
    function get remoteObject():RemoteObject;
    
    
    /**
     * 서비스 호출 이후 처리할 Row Index
     */
    function get rowIndex():int;
    function set rowIndex(value:int):void;
    
    /**
     * 호출 메소드명
     */
    function get methodName():String;
    function set methodName(value:String):void;
    
    /**
     * 호출 인자정보
     */
    function get map():Object;
    function set map(value:Object):void;
    
    /**
     * 호출한 View
     */
    function get view():ServiceReceiver;
    function set view(value:ServiceReceiver):void;
    
    /**
     * 부가적인 값
     */
    function get addObject():Object;
    function set addObject(value:Object):void;
    
    /**
    * 리모트 오브젝트를 만듭니다.
    */
    function makeRemoteObject():void;
   
    /**
    * 원격지 메소드 호출한다
    * @param 호출 처리 형태
    * @param 처리를 위한 조건값
    */
    function call():void
    
    /**
    * 실패시 처리 한다.
    * @param FaultEvent
    */
    function faultHandler(event:FaultEvent):void;
    
    /**
    * 성공시 처리한다
    * @param ResultEvent
    */
    function resultHandler(event:ResultEvent):void;
    
    /**
    * 처리시 처리한다
    * @param InvokeEvent
    */
    function invokeHandler(event:InvokeEvent):void;
  }
}