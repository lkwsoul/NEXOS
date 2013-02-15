package nexosframework.common.service {
  
  /**
   * <p>ServiceFault</p>
   * <p>Description: RPC 통신이후 에러결과를 보관할 Class</p>
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
  public class ServiceFault {
    
    private var _message:String;

    /**
    * 메시지
    */
    public function get message():String {
      return _message;
    }
    public function set message(value:String):void {
      _message = value;
    }

    
    private var _destination:String;
    /**
    * Destination
    */
    public function get destination():String {
      return _destination;
    }
    public function set destination(value:String):void {
      _destination = value;
    }

    
    private var _methodName:String;
    /**
    * 메소드명
    */
    public function get methodName():String{
      return _methodName;
    }
    public function set methodName(value:String):void {
      _methodName = value;
    }

    
    private var _rowIndex:int;
    /**
    * Index - 처리시 기준값을 입력하는 부분
    */
    public function get rowIndex():int {
      return _rowIndex;
    }
    public function set rowIndex(value:int):void {
      _rowIndex = value;
    }

    
    private var _addObject:Object;
    /**
    * 부가적인 Object
    */
    public function get addObject():Object {
      return _addObject;
    }
    public function set addObject(value:Object):void {
      _addObject = value;
    }
  }
}