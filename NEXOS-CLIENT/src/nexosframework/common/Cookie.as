package nexosframework.common {
  import flash.net.SharedObject;
  
/**
 * <p>Cookie</p>
 * <p>Description: 쿠키와 같은 역활을 하는 Class</p>
 * <p>Copyright: Copyright(c) 2009</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br/>
 * -------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 *  1.0         2009-07-29  Lee Kyung-woo     신규작성<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 */
  public class Cookie {
    
    /**
    * SharedObject File Name
    */
    private static const soFileName:String = "WMS_COOKIE";
    
    /**
    * 쿠키항목 저장하기
    * @param name  항목명
    * @param value 항목값.
    */
    public static function setCookie(name:String, value:Object):void {
      var so:SharedObject = SharedObject.getLocal(soFileName);
      so.data[name] = value;
      so.flush();
    }
    
    /**
    * 쿠키항목 가져오기.
    * @param name  항목명
    */
    public static function getCookie(name:String):Object {
      var so:SharedObject = SharedObject.getLocal(soFileName);
      return so.data[name];
    }
  }
}