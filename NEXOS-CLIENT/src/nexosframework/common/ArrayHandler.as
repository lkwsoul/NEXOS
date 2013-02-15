package nexosframework.common {
/**
 * <p>ArrayHandler</p>
 * <p>Description: Array에서 특정한 데이터를 추려내기 위한 Class.</p>
 * <p>Copyright: Copyright(c) 2009</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br/>
 * -------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 *  1.0         2009-09-28  Lee Kyung-woo     신규작성<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 */ 
  public class ArrayHandler {
    
    /**
    * Array에서 실제 수정된 데이터(Insert, Update, Delete)모두를 가져옵니다.
    * @param arr Array.
    */
    public static function getData(arr:Array):Array{  
      var tempArray:Array = new Array();
      arr.forEach(  
        function(item:*, index:uint, array:Array):void{  
        if ((item[ConstClass.GRID_JOBTYPE]!=null && item[ConstClass.GRID_JOBTYPE]!="")) {  
          tempArray.push(item);  
          }  
        }  
      );  
      return tempArray;  
    }
    
    /**
    * Array에서 입력(Insert)된 데이터만 가져옵니다.
    * @param arr Array.
    */
    public static function getDataInsert(arr:Array):Array{  
      var tempArray:Array = new Array();
      arr.forEach(  
        function(item:*, index:uint, array:Array):void{  
        if ((item[ConstClass.GRID_JOBTYPE]!=null && item[ConstClass.GRID_JOBTYPE]==ConstClass.GRID_INSERT)) {  
          tempArray.push(item);  
          }  
        }  
      );  
      return tempArray;  
    }
    
    /**
    * Array에서 수정(Update)된 데이터만 가져옵니다.
    * @param arr Array.
    */
    public static function getDataUpdated(arr:Array):Array{  
      var tempArray:Array = new Array();
      arr.forEach(  
        function(item:*, index:uint, array:Array):void{  
        if ((item[ConstClass.GRID_JOBTYPE]!=null && item[ConstClass.GRID_JOBTYPE]==ConstClass.GRID_UPDATE)) {  
          tempArray.push(item);  
          }  
        }  
      );  
      return tempArray;  
    }
    
    /**
    * Array에서 수정(Delete)된 데이터만 가져옵니다.
    * @param arr Array.
    */
    public static function getDataDeleted(arr:Array):Array{  
      var tempArray:Array = new Array();
      arr.forEach(  
        function(item:*, index:uint, array:Array):void{  
        if ((item[ConstClass.GRID_JOBTYPE]!=null && item[ConstClass.GRID_JOBTYPE]==ConstClass.GRID_DELETE)) {  
          tempArray.push(item);  
          }  
        }  
      );  
      return tempArray;  
    }
  }
}