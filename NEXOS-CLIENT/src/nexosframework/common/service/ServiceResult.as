package nexosframework.common.service {
  import mx.collections.ArrayCollection;
  
  /**
   * <p>ServiceResult</p>
   * <p>Description: RPC통신이후 처리결과를 보관할 Class</p>
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
  public class ServiceResult {
    
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
    
    
    private var _resultArrayCollection:ArrayCollection;
    
    /**
     * RPC처리결과 - ArrayCollection형태
     */
    public function get resultArrayCollection():ArrayCollection{
      return _resultArrayCollection;
    }
    public function set resultArrayCollection(value:ArrayCollection):void{
      _resultArrayCollection = value;
    }
    
    private var _resultMap:Object;
    /**
     * RPC처리결과 - Map(Object)형태
     */
    public function get resultMap():Object{
      return _resultMap;
    }
    public function set resultMap(value:Object):void{
      _resultMap = value;
    }
    
    private var _resultString:String;
    /**
     * RPC처리결과 - String형태
     */
    public function get resultString():String{
      return _resultString;
    }
    public function set resultString(value:String):void{
      _resultString = value;
    }
    
    private var _resultInt:int;
    /**
     * RPC처리결과 - int형태
     */
    public function get resultInt():int{
      return _resultInt;
    }
    public function set resultInt(value:int):void{
      _resultInt = value;
    }
    
    private var _resultBoolean:Boolean;
    /**
     * RPC처리결과 - Boolean형태
     */
    public function get resultBoolean():Boolean{
      return _resultBoolean;
    }
    public function set resultBoolean(value:Boolean):void{
      _resultBoolean = value;
    }
    
    private var _resultObject:Object;
    /**
     * RPC처리결과 - Object형태
     */
    public function get resultObject():Object{
      return _resultObject;
    }
    public function set resultObject(value:Object):void{
      _resultObject = value;
    }
  }
}