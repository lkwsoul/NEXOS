package nexosframework.common {
  
  import mx.collections.ArrayCollection;
  import mx.utils.ObjectUtil;
  import mx.utils.ArrayUtil;
  
  /**
   * <p>Util</p>
   * <p>Description: 공통적으로 사용하는 ArrayCollection 관련 Utility Class</p>
   * <p>Copyright: Copyright(c) 2010</p>
   * <p>Company: ASETEC</p>
   * @author Lee Kyung-woo
   * @version 1.0<br/>
   * -------------------------------------------------------------------------------------------------<br/>
   *  Ver         Date        Author            Description<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   *  1.0         2008-05-21  Lee Kyung-woo     신규작성<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   * @flowerModelElementId _zDVc0AkCEeKc96JIyzsocQ
   */ 
  public class AcUtil{
    
    /**
    * Constructor.
    */
    public function AcUtil(){
    }
    
    //#####################################################################################
    // 1.1 사용자 정의 변수.
    //#####################################################################################
    private static var _columnCode:String;
    private static var _columnNm:String;
    private static var _name:String;
    private static var _value:*;
    private static var _addTitle:String = "TITLE";
    
    private static var _fromName:String;
    private static var _toName:String;
    //-------------------------------------------------------------------------------------
    
    /**
    * TITLE COLUMN을 추가하기.
    * @param value ArrayCollection : 적용할 ArrayCollection
    * @param columnCode String : CODE에 해당하는 COLUMN 명.
    * @param columnName String : NAME에 해당하는 COLUMN 명.
    */
    public static function addTitle(value:ArrayCollection, columnCode:String, columnName:String, addTitle:String="TITLE"):ArrayCollection{
      if(!value)
        return value;
        
      if(addTitle==null || addTitle=="")
        _addTitle = "TITLE";
      else
        _addTitle = addTitle;
        
      _columnCode = columnCode;
      _columnNm = columnName;
      value.source.map(execAddTitle);
      return value;
    }
    
    /**
    * 특정 값으로 모두 변경하기.
    * @param value ArrayCollection : 적용할 ArrayCollection.
    * @param columnName String : 변경할 column명.
    * @param columnValue * : 변경할 column 값.
    */
    public static function updateAll(value:ArrayCollection, columnName:String, columnValue:*):ArrayCollection{
      if(!value)
        return value;
        
      _name = columnName;
      _value = columnValue;
      value.source.map(execUpdateAll);
      return value;
    }
    
    /**
    * 특정 값으로 모두 변경하기.(Filter로 보이는 데이터만 수정함)
    * @param value ArrayCollection : 적용할 ArrayCollection.
    * @param columnName String : 변경할 column명.
    * @param columnValue * : 변경할 column 값.
    */
    public static function updateAllOnfilter(value:ArrayCollection, columnName:String, columnValue:*):ArrayCollection{
      if(!value)
        return value;
        
      _name = columnName;
      _value = columnValue;
      value.toArray().map(execUpdateAll);
      return value;
    }
    
    /**
    * 특정 column값을 복사하기.
    */
    public static function copyColumn(value:ArrayCollection, fromColumnName:String, toColumnName:String):ArrayCollection{
      if(!value)
        return value;
        
      _fromName = fromColumnName;
      _toName   = toColumnName;
      value.source.map(execCopy);
      return value;
    }
    
    /**
    * 특정 column의 최대값을 가져옵니다.(source를 비교합니다.)
    * @param value ArrayCollection : 적용할 ArrayCollection.
    * @param columnName String : 최대값을 구할 column명.
    */
    public static function maxValue(value:ArrayCollection, columnName:String):Object{
      if(!value)
        return null;
      
      var objReturn:Object;
        
      var arr:Array       = ArrayUtil.toArray(ObjectUtil.copy(value.source));
      
      if(!arr || arr.length<=0)
        return null;
        
      try{
        //sorting합니다.
        arr.sortOn(columnName, Array.NUMERIC | Array.DESCENDING);
        objReturn = arr[0][columnName];
      }catch(e:Error){
        trace("[AcUtil.maxValue Error]"+e.message);
      }
      return objReturn;
    }
    
    /**
     * 특정 column의 최대값을 가져옵니다.(filter가 source가 아닌 현재 보여지는 데이터내에서 Max값)
     * @param value ArrayCollection : 적용할 ArrayCollection.
     * @param columnName String : 최대값을 구할 column명.
     */
    public static function maxValueNoneSource(value:ArrayCollection, columnName:String):Object{
      if(!value)
        return null;
      
      var objReturn:Object;
      
      var arr:Array       = ArrayUtil.toArray(ObjectUtil.copy(value.toArray()));
      
      if(!arr || arr.length<=0)
        return null;
      
      try{
        //sorting합니다.
        arr.sortOn(columnName, Array.NUMERIC | Array.DESCENDING);
        objReturn = arr[0][columnName];
      }catch(e:Error){
        trace("[AcUtil.maxValue Error]"+e.message);
      }
      return objReturn;
    }
    
    /**
    * 특정 column의 최소값을 가져옵니다.(source를 비교합니다.)
    * @param value ArrayCollection : 적용할 ArrayCollection.
    * @param columnName String : 최대값을 구할 column명.
    */
    public static function minValue(value:ArrayCollection, columnName:String):Object{
      if(!value)
        return null;
      
      var objReturn:Object;
        
      var arr:Array       = ArrayUtil.toArray(ObjectUtil.copy(value.source));
      
      if(!arr || arr.length<=0)
        return null;
        
      try{
        //sorting합니다.
        arr.sortOn(columnName);
        objReturn = arr[0][columnName];
      }catch(e:Error){
        trace("[AcUtil.minValue Error]"+e.message);
      }
      return objReturn;
    }
    
    /**
     * 특정 column의 최소값을 가져옵니다.(filter가 source가 아닌 현재 보여지는 데이터내에서 Min값)
     * @param value ArrayCollection : 적용할 ArrayCollection.
     * @param columnName String : 최대값을 구할 column명.
     */
    public static function minValueNoneSource(value:ArrayCollection, columnName:String):Object{
      if(!value)
        return null;
      
      var objReturn:Object;
      
      var arr:Array       = ArrayUtil.toArray(ObjectUtil.copy(value.toArray()));
      
      if(!arr || arr.length<=0)
        return null;
      
      try{
        //sorting합니다.
        arr.sortOn(columnName);
        objReturn = arr[0][columnName];
      }catch(e:Error){
        trace("[AcUtil.minValue Error]"+e.message);
      }
      return objReturn;
    }
    
    /**
    * 특정 조건(하나의 조건)에 맞는 데이터를 가져오도록 합니다.
    * @param value ArrayCollection : 적용할 ArrayCollection.
    * @param columnName String : 검색할 column명.
    * @param columnValue String : 검색 값.
    */
    public static function findValue(value:ArrayCollection, columnName:String, columnValue:*):Object{
      if(!value)
        return null;
        
      var tempArray:Array = new Array();
      var arr:Array       = ArrayUtil.toArray(ObjectUtil.copy(value.source));
      var objItem:Object;
      arr.forEach(  
        function(item:*, index:uint, array:Array):void{
          if(objItem)
            return;
          if ((item[columnName]!=null && item[columnName]==columnValue)) {  
            objItem = item;
            return;
          }
        }
      );
      return objItem;
    }
    
    /**
    * 특정 조건(하나의 조건)에 맞는 Index를 가져오는 Function.
    * @param value ArrayCollection : 적용할 ArrayCollection.
    * @param columnName String : 검색할 column명.
    * @param columnValue String : 검색 값.
    */
    public static function findIndex(value:ArrayCollection, columnName:String, columnValue:*):int{
      if(!value)
        return -1;
        
      var tempArray:Array = new Array();
      var arr:Array       = ArrayUtil.toArray(ObjectUtil.copy(value.source));
      var intReturn:int   = -1;
      arr.forEach(  
        function(item:*, index:uint, array:Array):void{
          if(intReturn>-1)
            return;

          //null일경우 문자열 ""도 포함합니다.
          if(columnValue==null) {
            if (item[columnName]==columnValue || item[columnName]=="") {  
              intReturn = index;
              return;
            }
          }else{
            if (item[columnName]==columnValue) {  
              intReturn = index;
              return;
            }
          }
        }
      );
      return intReturn;
    }
    
    /**
     * 특정 조건(하나의 조건)에 맞는 Index를 가져오는 Function.(ArrayCollection의 source를 대상으로 하지 않습니다.)
     * @param value ArrayCollection : 적용할 ArrayCollection.
     * @param columnName String : 검색할 column명.
     * @param columnValue String : 검색 값.
     */
    public static function findIndexNoneSource(value:ArrayCollection, columnName:String, columnValue:*):int{
      if(!value)
        return -1;
      
      var tempArray:Array = new Array();
      var arr:Array       = ArrayUtil.toArray(ObjectUtil.copy(value.toArray()));
      var intReturn:int   = -1;
      arr.forEach(  
        function(item:*, index:uint, array:Array):void{
          if(intReturn>-1)
            return;
          
          //null일경우 문자열 ""도 포함합니다.
          if(columnValue==null) {
            if (item[columnName]==columnValue || item[columnName]=="") {  
              intReturn = index;
              return;
            }
          }else{
            if (item[columnName]==columnValue) {  
              intReturn = index;
              return;
            }
          }
        }
      );
      return intReturn;
    }
    
    /**
     * 특정 조건(숫자를 체크)에 맞는 Index를 가져오는 Function.(ArrayCollection의 source를 대상으로 하지 않습니다.)
     * @param value ArrayCollection : 적용할 ArrayCollection.
     * @param columnName String : 검색할 column명.
     * @param columnValue String : 검색 값.
     */
    public static function findIndexByChkIntValue(value:ArrayCollection, columnName:String, columnValue:*):int{
      if(!value)
        return -1;
      
      var tempArray:Array = new Array();
      var arr:Array       = ArrayUtil.toArray(ObjectUtil.copy(value.toArray()));
      var intReturn:int   = -1;
      var intItemColumnValue:int;
      arr.forEach(  
        function(item:*, index:uint, array:Array):void{
          if(intReturn>-1)
            return;
          
          //null일경우 문자열 ""도 포함합니다.
          var intItemColumnValue:int = -1;
          
          if(item[columnName] == "" || item[columnName] == null){
            intReturn = index;
            return;
          }
          
          intItemColumnValue = int(item[columnName]);
          if (intItemColumnValue <= columnValue) {  
            intReturn = index;
            return;
          }
          
        }
      );
      return intReturn;
    }
    
    /**
    * 특정 Column명에 대한 합계를 구할 때 사용합니다.
    * @param value ArrayCollection : 적용할 ArrayCollection.
    * @param columnName String : 합을 구할 column명.
    */
    public static function sumValues(value:ArrayCollection, columnName:String):int{
      var intReturnValue:int = 0;
      if(!value)
        return intReturnValue;

      if(value.length==0)
        return intReturnValue;
        
      if(!value[0].columnName is Number && !value[0].columnName is int)
        return intReturnValue; 
        
      for(var i:int=0;i<value.length;i++){
        intReturnValue = intReturnValue + int(value[i][columnName]);
      }
      return intReturnValue;  
    }
    
    /**
     * 특정 Column명에 대한 합계를 구할 때 사용합니다.(Number 소수점 두자리 형태)
     * @param value ArrayCollection : 적용할 ArrayCollection.
     * @param columnName String : 합을 구할 column명.
     */
    public static function sumValuesNumber(value:ArrayCollection, columnName:String):Number{
      var intReturnValue:Number = 0.00;
      if(!value)
        return intReturnValue;
      
      if(value.length==0)
        return intReturnValue;
      
      if(!value[0].columnName is Number && !value[0].columnName is int)
        return intReturnValue; 
      
      for(var i:int=0;i<value.length;i++){
        intReturnValue = intReturnValue + Number(value[i][columnName]);
      }
      return intReturnValue;  
    }
    
    /**
    * 계산 COLUMN.
    */
    private static function execAddTitle(element:*, index:int, arr:Array):String{
      //return String(element).toUpperCase();
      element[_addTitle] = element[_columnCode] + " - " + element[_columnNm];
      return String(element);
    }
    
    /**
    * 특정값으로 Update하는 function
    */
    private static function execUpdateAll(element:*, index:int, arr:Array):*{
      element[_name] = _value;
      return element;
    }
    
    /**
    * column복사하기.
    */
    private static function execCopy(element:*, index:int, arr:Array):String{
      element[_toName] = element[_fromName];
      return String(element)
    }
  }
}