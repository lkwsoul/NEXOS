package nexosframework.common{
/**
 * <p>Date</p>
 * <p>Description: 날자관련 Class</p>
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
  public class DateUtil{
    
    public static const millisecondsPerMinute:int = 1000 * 60;
    public static const millisecondsPerHour:int   = 1000 * 60 * 60;
    public static const millisecondsPerDay:int    = 1000 * 60 * 60 * 24;

    private static var _date:Date;
    
    /**
    * Constructor
    */
    public function DateUtil(){
    }
    
    /**
    * 새로운 날짜를 생성합니다.
    */
    public static function createDate():Date{
      return _date = new Date();
    }
    
    /**
    * 날짜를 세팅합도록 하빈다.
    */
    public static function setDate(value:Date):void{
      _date = value;
    }
    
    /**
    * 현재 생성한 날짜를 return합니다.
    */
    public static function getDate():Date{
      if(!_date)
        DateUtil.createDate();
        
      return _date;
    }
    
    /**
    * 현재 생성된 날짜를 String 형태로 return합니다.
    */
    public static function getDateString():String{
      if(_date)
        DateUtil.createDate();
        
      return Util.dateToString(_date);
    }
    
    /**
    * 특정일수 만큼의 Date를 구합니다.
    * @param value Date : 기준 Date
    * @param intDay int : 구할 일수값. 
    */
    public static function moveDay(value:Date,intDay:int):Date{
      var dateReturn:Date = new Date();
      dateReturn.setTime( value.getTime() + (millisecondsPerDay*intDay) );
      return dateReturn;
    }
    
    /**
    * 특정시간 만큼의 Date를 구합니다.
    * @param value Date : 기준 Date
    * @param intDay int : 구할 시간값. 
    */
    public static function moveHour(value:Date, intHour:int):Date{
      var dateReturn:Date = new Date();
      dateReturn.setTime( value.getTime() +  (millisecondsPerHour*intHour) );
      return dateReturn;
    }
    
    /**
    * 특정분 만큼의 날짜를 구합니다.
    * @param value Date : 기준 Date
    * @param intDay int : 구할 분값. 
    */
    public static function moveMinute(value:Date, intMinute:int):Date{
      var dateReturn:Date = new Date();
      dateReturn.setTime( value.getTime() +  (millisecondsPerMinute*intMinute) );
      return dateReturn;
    }
    
    /**
    * 특정 달수 만큼의 Date를 구합니다.
    * @param value Date : 날짜를 구할 기준 Date
    * @param intDay int : 구할 달수. 
    */
    public static function moveMonth(value:Date, intMonth:int):Date{
      var intCurrentMonth:int = value.getMonth();
      var intCurrentYear:int = value.getFullYear();
      
      var intInputYear:int = intMonth/12;
      var intInputMonth:int = intMonth%12
      
      var intResultMonth:int = intCurrentMonth+intInputMonth;
      intCurrentYear  = intCurrentYear + intInputYear;
      
      var dateReturn:Date = new Date();
      
      if(intResultMonth<0){
        intCurrentYear--;
        //intResultMonth  = 11 + intResultMonth;
        intResultMonth  = 12 + intResultMonth;
        dateReturn.setFullYear(intCurrentYear);
        dateReturn.setMonth(intResultMonth);
      }else if(intResultMonth>11){
        intCurrentYear++;
        intResultMonth  = intResultMonth - 12;
        dateReturn.setFullYear(intCurrentYear);
        dateReturn.setMonth(intResultMonth);
      }else{
        dateReturn.setFullYear(intCurrentYear);
        dateReturn.setMonth(intResultMonth);
      }
      
     return dateReturn;
    }
    
    /**
    * 특정년수 만큼의 날짜를 구합니다.
    * @param value Date : 날짜를 구할 기준 Date
    * @param intDay int : 구할 년수. 
    */
    public static function moveYear(value:Date, intYear:int):Date{
      var dateReturn:Date = new Date();
      var intCurrentYear:int = value.getFullYear();
      intCurrentYear = intCurrentYear + intYear;
      dateReturn.setFullYear(intCurrentYear);
      return dateReturn;
    }
    
    /**
    * 월의 마지막 날짜를 구합니다.
    */
    public static function moveLastDay(value:Date=null):Date {
      if(value==null)
        value = DateUtil.getDate();
      
      var dateReturn:Date = new Date(value);
      dateReturn.setMonth(dateReturn.getMonth()+1,0);
      
      return dateReturn;
    }
    
    /**
    * 월의 첫번째일의 날짜를 구합니다.
    */
    public static function moveFistDay(value:Date=null):Date {
      if(value==null)
        value = DateUtil.getDate();
      
      var dateReturn:Date = new Date(value);
      dateReturn.setMonth(dateReturn.getMonth(),1);
      
      return dateReturn;
    }
  }
}