package nexosframework.common {
  
  import mx.formatters.Formatter;
  import mx.formatters.DateFormatter;
  import mx.formatters.NumberFormatter;
  import mx.formatters.NumberBaseRoundType;
  
  /**
 * <p>FormatterFactory</p>
 * <p>Description: 데이터 Type에 따른 Formatter를 생성하고 값을 변환을 하는 Class.</p>
 * <p>Copyright: Copyright(c) 2010</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br/>
 * -------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 *  1.0         2008-02-20  Lee Kyung-woo     신규작성<br/>
 *  1.1         2008-06-02  Lee Kyung-woo     dateTime 관련된 Fomatter추가.<br/>
 *                                            Number Formatter에 useNegativeSign=true로 설정<br/>
 *  1.2         2009-03-24  Lee Kyung-woo     소숫점 처리를 위한 Number Formatter 추가.<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 * 
 */
  public class FormatterFactory{
    /**
    * 적용된 formatter
    */
    public static var applyFormatter:Formatter;
    
    private static var dateFormatter:DateFormatter;
    private static var dateTimeFormatter:DateFormatter;
    //소숫점미처리
    private static var numberFormatter:NumberFormatter;
    //소숫점처리.
    private static var doubleFormatter:NumberFormatter;
    
    /**
    * formatter를 적용한 String을 구합니다.
    * @param data * : formatter를 적용할 값.
    */
    public static function getValue(data:*):String{
      
      var label:String = "";
      if(data is String){
        FormatterFactory.applyFormatter=null;
        label = data;
      }else if(data is Date){
        if((data as Date).seconds==0 && (data as Date).minutes==0 && (data as Date).hours==0){
          FormatterFactory.getDateFormatter();
          FormatterFactory.applyFormatter = dateFormatter;
          label = dateFormatter.format(data);
        }else{
          FormatterFactory.getDateTimeFormatter();
          FormatterFactory.applyFormatter = dateTimeFormatter;
          label = dateTimeFormatter.format(data);
        }
      }else if(data is int || data is Number){
        FormatterFactory.getNumberFormatter();
        FormatterFactory.applyFormatter = numberFormatter;
        label = numberFormatter.format(data);
      }else{
        FormatterFactory.applyFormatter=null;
        label = data;
      }
      
      return label;
    }
    
    /**
    * 현재 설정된 날짜 형식의 Formatter(Date)를 되돌려 줍니다.
    * @return DateFormatter
    */
    public static function getDateFormatter():DateFormatter{
      if(dateFormatter)
        return dateFormatter;
        
      dateFormatter  = new DateFormatter();
      dateFormatter.formatString=ConstClass.DATE_FORMAT;
      return dateFormatter;
    }
    
    /**
    * 일시정보의 Formatter(DateTime)를 되돌려 줍니다.
    * @return DateFormatter
    */
    public static function getDateTimeFormatter():DateFormatter{
      if(dateTimeFormatter)
        return dateTimeFormatter;
        
      dateTimeFormatter  = new DateFormatter();
      dateTimeFormatter.formatString=ConstClass.DATETIME_FORMAT;
      return dateTimeFormatter;
    }
    
    /**
    * 숫자 Formatter(NumberFormatter)를 되돌려 줍니다.
    * @return NumberFormatter
    */
    public static function getNumberFormatter():NumberFormatter{
      if(numberFormatter)
        return numberFormatter;
        
      numberFormatter  = new NumberFormatter();
      numberFormatter.useThousandsSeparator = true;
      numberFormatter.useNegativeSign = true;
      numberFormatter.rounding = NumberBaseRoundType.NEAREST;
      numberFormatter.precision= 0;
      
      return numberFormatter;
    }
    
    /**
    * 숫자 Formatter(NumberFormatter)를 되돌려 줍니다.
    * 소숫점이 포함된 Formatter.
    * @return NumberFormatter
    */
    public static function getDoubleFormatter():NumberFormatter{
      if(doubleFormatter)
        return doubleFormatter;
        
      doubleFormatter  = new NumberFormatter();
      doubleFormatter.useThousandsSeparator = true;
      doubleFormatter.useNegativeSign = true;
      doubleFormatter.rounding  = NumberBaseRoundType.UP;
      doubleFormatter.precision = 2;
      
      return doubleFormatter;
    }

  }
}