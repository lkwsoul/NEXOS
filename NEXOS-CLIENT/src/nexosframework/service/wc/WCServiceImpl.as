package nexosframework.service.wc {
  import nexosframework.common.service.Service;
  import nexosframework.common.service.ServiceImpl;
  
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
  public class WCServiceImpl extends ServiceImpl {
    
    /**
    * Destination name
    */
    public static const DESTINATION:String = "wc";
    
    /**
    * Method Name 중 login
    */
    public static const GET_LOGIN:String = "getLogin";
    
    /**
     * Method Name 중 logout
     */
    public static const GET_LOGOUT:String = "getLogout";
    
    /**
     * Method Name 중 menu가져오기
     */
    public static const GET_MENU:String   = "getMenu";
    
    /**
    * 생성자
    */
    public function WCServiceImpl(){
      super();
      
      makeRemoteObject();
    }
    
    /**
    * 리모트 오브젝트를 정의해서 생성한다
    */
    override public function makeRemoteObject():void{
      super.makeRemoteObject();
      remoteObject.destination = WCServiceImpl.DESTINATION;
    }
    
    //--------------------------------------------------------------------------
    //기타 오픈되어 있는 원격지 메소드를 여기에 선언해서 사용할수 있습니다.
    //--------------------------------------------------------------------------
  }
}