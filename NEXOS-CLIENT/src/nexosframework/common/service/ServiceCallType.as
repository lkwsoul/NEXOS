package nexosframework.common.service {
  
  /**
   * <p>ServiceCallType</p>
   * <p>Description: 호출 타입을 관리하는 Class</p>
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
  public class ServiceCallType {
    /**
    * RPC데이터 호출이후 되돌려 받을 값을 ArrayCollection(FLEX), List(JAVA)형태로 받는 형테
    */
    public static const ARRAYCOLLECITON:String        = "AC";
    
    /**
     * RPC데이터 호출이후 되돌려 받을 값을 Object(FLEX), Map(JAVA)형태로 받는 형테
     */
    public static const MAP:String                    = "MAP";
    
    /**
     * RPC데이터 호출이후 되돌려 받을 값을 String(FLEX), String(JAVA)형태로 받는 형테
     */
    public static const STRING:String                 = "STRING";
    
    /**
     * RPC데이터 호출이후 되돌려 받을 값을 int(FLEX), int(JAVA)형태로 받는 형테
     */
    public static const INT:String                    = "INT";
    
    /**
     * RPC데이터 호출이후 되돌려 받을 값을 Boolean(FLEX), boolean(JAVA)형태로 받는 형테
     */
    public static const BOOLEAN:String                = "BOOLEAN";
    
    /**
    * RPC데이터 호출이후 되돌려 받을 값을 Object(FLEX), Map(JAVA)
    *                                                 , String(JAVA)
    *                                                 , Boolean(JAVA)
    *                                                 , Integer(JAVA)   형태로 받는 형태
    */
    public static const OBJECT:String                 = "OBJECT";
    
    
  }
}