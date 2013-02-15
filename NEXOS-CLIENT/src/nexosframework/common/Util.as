package nexosframework.common {
  import mx.formatters.Formatter;
  import flash.net.LocalConnection;
  
  
/**
 * <p>Util</p>
 * <p>Description: 공통적으로 사용하는 Utility Class</p>
 * <p>Copyright: Copyright(c) 2010</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br/>
 * -------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 *  1.0         2008-02-20  Lee Kyung-woo     신규작성<br/>
 *  1.1         2008-06-03  Lee Kyung-woo     getNull 기능개선<br/>
 *                                            String, int, Number 기타 Object 모두 대응하도록 수정<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 */ 
  public class Util{
    
    import mx.controls.Alert;
    
    /**
    * Constructor.
    */
    public function Util(){
    }
    
    /**
    * Null값을 처리하는 function
    * @example <listing version="3.0">
    * var strTestValue:String;
    * var strReturnValue:String = Util.getNull(strTextValue,"nullReplaceString");
    * trace(strReturnValue); // return "nullReplaceString"
    * strReturnValue = Util.getNull(strTextValue);
    * trace(strReturnValue); // return ""
    * strTextValue = "aaa";
    * strReturnValue = Util.getNull(strTextValue);
    * trace(strReturnValue); // return "aaa"
    * </listing>
    * 
    * @param obj Object : 처리할 Object.
    * @param repalceObj Object : Null일 경우 대체될 Object.
    * 
    * @return Object
    */
    public static function getNull(obj:Object,repalceObj:Object=null):Object{
      if(obj is String){
        //0.문자열.
        if((obj==null || obj=="null" || obj=="") && repalceObj!=null)
          return repalceObj;
          
        if(obj==null)
        return "";
        
        if(obj=="null")
          return "";
      }else if(obj is int || obj is Number){
        //1.숫자일경우.
        if((obj==null || obj==0) && repalceObj!=null)
          return repalceObj;
          
        if(obj==null)
          return 0;
          
      }else if(obj==null){
        //2.기타 Object일경우.
        if(obj==null && repalceObj!=null)
          return repalceObj;
        if(obj is int || obj is Date){
          return null;
        }else{
          return "";
        }
      }
      return obj;
    }
    
    /**
    * Singledo(단따음표)를 문자열에 붙여서 되돌려 줍니다.
    * 
    * @example <listing version="3.0">
    * var strTestValue:String = "aaa";
    * var strReturnValue:String = Util.strAddSingledot(strTextValue);
    * trace(strReturnValue); // return "'aaa'"
    * </listing>
    * 
    * @param strSource String : 처리할 문자열
    * 
    * @return String
    */
    public static function strAddSingledot(strSource:String):String{
      return "'"+strSource+"'";
    }
    
    /**
    * 날짜를 문자열로 변환합니다.
    * @param value Object : date Object
    * 
    * @return String formatter로 변환한 값을 되돌려 줍니다.
    */
    public static function dateToString(value:Object, formatter:Formatter=null):String{
      if(!formatter)
        formatter = FormatterFactory.getDateFormatter();
      return formatter.format(value);
    }
    
    /**
    * 문자열(YYYY-MM-DD)을 Date형식으로 변환합니다. 
    * @param value Object : date Object
    * 
    * @return String formatter로 변환한 값을 되돌려 줍니다.
    */
    public static function StringToDate(value:String):Date{
      if(!Date)
        return null;
        
      var dateReturn:Date;
      try{
        var intYear:int   = int(value.substr(0,4));
        var intMonth:int  = int(value.substr(5,2));
        var intDay:int    = int(value.substr(8,2));
        
        intMonth--;
        
        dateReturn        = new Date(intYear,intMonth,intDay);
      }catch(e:Error){
        Alert.show("Date로 변한이 불가능한 문자형식입니다.");
        /*
        * 2012-10-05
        * 이경우
        * 소스 정리(다국어 미처리)로 주석처리
        Alert.show(ResourceData.source["Util.ZM0001"]);
        */
      }
      return dateReturn;
    }
    
    /**
    * Object에 Length를 구합니다.
    * @param value Object : Length를 구하기 위한 Object
    * 
    * @return int Object의 Length
    */
    public static function getObjectLenth(value:Object):int{
      var intReturn:int = 0;
      for(var prop:* in value)  intReturn++;
      //value.length = intReturn;
      return intReturn;
    }
    
    /**
    * Flash Player버그를 통해서 강제적으로 GC(Garbage Collector)를 실행하도록 합니다.
    */
    public static function gc():void{
      try{
        new LocalConnection().connect("GC");
        new LocalConnection().connect("GC");
      }catch(e:Error){
      }
    }
  }
}