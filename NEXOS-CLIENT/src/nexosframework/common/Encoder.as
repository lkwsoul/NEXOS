package nexosframework.common {
  import flash.utils.ByteArray;
  
  /**
   * <p>Encoder</p>
   * <p>Description: 문자열 Encoding처리하는 Class</p>
   * <p>Copyright: Copyright(c) 2010</p>
   * <p>Company: ASETEC</p>
   * @author Lee Kyung-woo
   * @version 1.0<br/>
   * -------------------------------------------------------------------------------------------------<br/>
   *  Ver         Date        Author            Description<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   *  1.0         2008-02-20  Lee Kyung-woo     신규작성<br/>
   *  1.1         2009-01-14  Lee Kyung-woo     return새로운 Date Object를 만들어서 되돌려 주도록 수정<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   */
  public class Encoder {
    public function Encoder() {
    }
    
    public static function readMultiEncodingText(bytes:ByteArray):String {
      //UTF-8 with BOM
      if(bytes[0] == 0xEF)if(bytes[1] == 0xBB)if(bytes[2] == 0xBF) return bytes.toString();
      
      //UTF-16 Big Endian
      if(bytes[0] == 0xFE)if(bytes[1] == 0xFF) return bytes.toString();
      
      //UTF-16 Little Endian
      if(bytes[0] == 0xFF)if(bytes[1] == 0xFE) return bytes.toString();
      
      //UTF-32 Big Endian
      if(bytes[0] == 0x0)if(bytes[1] == 0x0)if(bytes[2] == 0xFE)if(bytes[3] == 0xFF) return bytes.toString();
      
      //UTF-32 Little Endian
      if(bytes[0] == 0xFF)if(bytes[1] == 0xFE)if(bytes[2] == 0x0)if(bytes[3] == 0x0) return bytes.toString();
      
      //기타
      var ansiStr:String = bytes.readMultiByte(bytes.bytesAvailable, "ANSI");
      var unicodeStr:String = bytes.toString();
      
      if(ansiStr.length < unicodeStr.length) return ansiStr;
      
      return unicodeStr;
    }
    
  }
}