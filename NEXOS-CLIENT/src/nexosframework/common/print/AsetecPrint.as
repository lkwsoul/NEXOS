package nexosframework.common.print {
  
  import flash.display.DisplayObject;
  import flash.external.ExternalInterface;
  import flash.net.URLRequest;
  import flash.net.URLRequestMethod;
  import flash.net.URLVariables;
  import flash.net.navigateToURL;
  
  import mx.controls.Alert;
  import mx.core.FlexGlobals;
  import mx.managers.PopUpManager;
  
  import nexosframework.common.ConstClass;
  import nexosframework.common.Cookie;
  import nexosframework.common.component.IFramePopUp;
  
  /**
   * <p>AsetecPrint</p>
   * <p>Description: 출력관련 Class</p>
   * <p>Copyright: Copyright(c) 2010</p>
   * <p>Company: ASETEC</p>
   * @author Lee Kyung-woo
   * @version 1.0<br/>
   * -------------------------------------------------------------------------------------------------<br/>
   *  Ver         Date        Author            Description<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   *  0.1         2008-05-02  Lee Kyung-woo     신규작성<br/>
   *  1.0         2008-07-24  Lee Kyung-woo     PDF 형식으로 변경으로 인한, 수정<br/>
   *  1.1         2011-04-17  Lee Kyung-woo     정렬을 위한 POPUP창추가<<br/>
   * ---------    ----------  ---------------   ------------------------------------------------------<br/>
   */
  public class AsetecPrint{
    
    private var _parameters:FlexMap;
    private var _query:String;
    private var _reportDoc:String;
    private var _title:String;
    private var _isPost:String;
    private var _isSilentPrint:String;
    private var _printerName:String;
    private var _printName:String;
    
    private var _isOwnQuery:String = "N";
    
    private var _isLabel:Boolean = false;
    
    /**
     * 라벨프린트 별도의 servelt로 처리 여부
     */
    [Inspectable(defaultValue="false", enumeration="false, true")]
    public function get isLabel():Boolean{
      return _isLabel;
    }
    public function set isLabel(value:Boolean):void{
      _isLabel = value;
    }
    
    /**
     * 리포트에 포함된 쿼리 사용여부
     */
    [Inspectable(defaultValue="N", enumeration="Y,N")]
    public function get isOwnQuery():String{
      return _isOwnQuery;
    }
    public function set isOwnQuery(value:String):void{
      _isOwnQuery = value;
    }
    
    private var _usedSetupedPrint:Boolean = false;
    
    //출력매수
    private var _printCount:int = 1;
    
    //선택한 값으로 통해서 입력할 경우.
    private var _checkedValues:Array = null; 
    
    /**
     * Constructor
     */
    public function AsetecPrint(isPost:Boolean=true,isSilentPrint:Boolean=false){
      if(isPost)
        _isPost = "Y";
      else
        _isPost = "N";
      
      if(isSilentPrint)
        _isSilentPrint = "Y";
      else
        _isSilentPrint = "N";
      
      _parameters = new FlexHashMap();
      //초기 Parameter정보를 초기화합니다.
      if(isPost)
        ExternalInterface.call("removeParameters",_isPost);
    }
    
    /**
     * Parameter정보를 설정합니다.(FlexHashMap이용)
     * @see com.asetec.vo.FlexHashMap
     */
    public function set parameters(value:FlexMap):void{
      _parameters = value;
    }
    public function get parameters():FlexMap{
      return _parameters;
    }
    
    /**
     * 전달방식 Post여부.
     */
    [Inspectable(defaultValue="Y", enumeration="Y,N")]
    public function set isPost(value:String):void{
      _isPost = value;
    }
    public function get isPost():String{
      return _isPost;
    }
    
    /**
     * 출력을 Preview없이 silent Print 여부.
     */
    [Inspectable(defaultValue="Y", enumeration="Y,N")]
    public function set isSilentPrint(value:String):void{
      _isSilentPrint = value;
    }
    public function get isSilentPrint():String{
      return _isSilentPrint;
    }
    
    private var _SilentPrintName:String;
    /**
     * Slient출력시 사용할 프린트명
     * 쿠키방식으로 호출시 사용하는 값.
     */
    public function get silentPrintName():String{
      return _SilentPrintName;
    }
    
    public function set silentPrintName(value:String):void{
      _SilentPrintName = value;
    }
    
    /**
     * 실행할 Query 설정.(Report파일에 fill할 Query)
     */
    public function set query(value:String):void{
      _query = value;
    }
    public function get query():String{
      return _query;
    }
    
    /**
     * 출력할 Report파일 설정.
     */
    public function set reportDoc(value:String):void{
      _reportDoc = value;
    }
    public function get reportDoc():String{
      return _reportDoc;
    }
    
    /**
     * 출력창의 제목.
     */
    public function set title(value:String):void{
      _title = value;
    }
    public function get title():String{
      return _title;
    }
    
    /**
     * 사용할 프린트명.
     */
    [Inspectable(defaultValue="", enumeration="PRINT_LABEL_IN, PRINT_BILL_IN, PRINT_LABEL_OUT, PRINT_BILL_OUT")]
    public function set printerName(value:String):void{
      _printerName = value;
    }
    public function get printerName():String{
      return _printerName;
    }
    
    public function set printName(value:String):void{
      _printName = value;
    }
    public function get printName():String{
      return _printName;
    }
    
    /**
     * 사용자별 설정된 프린트를 사용할지 여부. 
     */
    [Inspectable(defaultValue="false", enumeration="false, true")]
    public function set usedSetupedPrint(value:Boolean):void{
      _usedSetupedPrint = value;
    }
    public function get usedSetupedPrint():Boolean{
      return _usedSetupedPrint;
    }
    
    /**
     * 출력매수
     */
    public function set printCount(value:int):void{
      _printCount = value;
    }
    public function get printCount():int{
      return _printCount;
    }
    
    /**
     * 선택한 값을 출력하기 위한 선택값.
     */
    public function set checkedValues(value:Array):void{
      _checkedValues = value;
      if(value!=null)
        isPost=ConstClass.CONST_Y;
    }
    public function get checkedValues():Array{
      return _checkedValues;
    }
    
    /**
     * Parameter정보를 입력합니다.(일반적인 Parameter)
     * @param key * : Key정보.
     * @param value * : Value정보.
     */
    public function put(key:*, value:*):void{
      _parameters.put(key,value);
      //Javascript의 setValue를 호출합니다.
      if(isPost=="Y")
        ExternalInterface.call("setValue", key,value);
    }
    
    /**
     * Query에 대한 Parameter정보를 입력하도록 합니다.(Query에 대한 Parameter)
     * @param key * : Key정보.
     * @param value * : Value정보.
     */
    public function putQueryParameter(key:String, value:*):void{
      //QueryParameter정보구분을 위한 Header를 붙이도록 합니다.
      key = ConstClass.PRINT_PARAMETER+key;
      _parameters.put(key,value);
      
      //Javascript의 setValue를 호출합니다.
      if(isPost=="Y")
        ExternalInterface.call("setValue", key,value);
    }
    
    /**
     * Query에 대한 Parameter정보를 입력하도록 합니다.(Query에 대한 Parameter 중에서 repalce 적용할 Parameter.)
     * @param key * : Key정보.
     * @param value * : Value정보.
     */
    public function putQueryParameterRepalce(key:String, value:*):void{
      //QueryParameter정보구분을 위한 Header를 붙이도록 합니다.
      key = ConstClass.PRINT_PARAMETER_REPLACE+key;
      _parameters.put(key,value);
      
      //Javascript의 setValue를 호출합니다.
      if(isPost=="Y")
        ExternalInterface.call("setValue", key,value);
    }
    
    /**
     * Parameter정보를 가져옵니다.
     * @param key * : 가져올 key값.
     */
    public function getValue(key:*):*{
      return _parameters.getValue(key);
    }
    
    /**
     * 프린트 문서를 호출합니다.
     * @param strDoc String : 호출할 문서(확정자를 제외한 문자열 ex:cs/CS01010R)
     * @param strQuery String : 호출시 실행할 Query(ex:cm/CM01010E_S01.SQL)
     */
    public function callPrint(strDoc:String=null,strQuery:String=null):void {
      _callPrint(strDoc, strQuery);
    }

    /**
     * 프린트 문서를 호출합니다.
     * @param strDoc String : 호출할 문서(확정자를 제외한 문자열 ex:cs/CS01010R)
     * @param strQuery String : 호출시 실행할 Query(ex:cm/CM01010E_S01.SQL)
     */
    private function _callPrint(strDoc:String=null,strQuery:String=null):void{
      if( (strDoc==null || strDoc=="") && (reportDoc==null || reportDoc=="") ){
        Alert.show("출력할 리포트파일명을 입력해주세요");
        /*
        * 2012-10-05
        * 이경우
        * 소스 정리(다국어 미처리)로 주석처리
        Alert.show(ResourceData.source["AsetecPrint.ZM0001"]);
        */
        return;
      }
      
      if(strDoc==null || strDoc==""){
        strDoc = reportDoc;
      }
      
      if( (strQuery==null || strQuery=="") && (query!=null && query!="") ){
        strQuery = query;
      }
      
      var strURL:String = ConstClass.PRINT_URL;
      
      ExternalInterface.call("setPrintName", "PRINT_LABEL_IN"             ,Cookie.getCookie("PRINT_LABEL_IN"));
      ExternalInterface.call("setPrintName", "PRINT_LABEL_OUT"            ,Cookie.getCookie("PRINT_LABEL_OUT"));
      ExternalInterface.call("setPrintName", "PRINT_BILL_IN"              ,Cookie.getCookie("PRINT_BILL_IN"));
      ExternalInterface.call("setPrintName", "PRINT_BILL_OUT"             ,Cookie.getCookie("PRINT_BILL_OUT"));
      ExternalInterface.call("setPrintName", "PRINT_LABEL_IN_IN"          ,Cookie.getCookie("PRINT_LABEL_IN_IN"));
      
      //Javascript의 setValue를 호출합니다.(리포트파일)
      if(isPost=="Y"){
        if(usedSetupedPrint) {
          //Post 변수를 초기화 합니다.
          //Silent출력이 아닐경우 초기화하지 않도록 한다
          ExternalInterface.call("setValuePrintType" ,printerName);
          
          ExternalInterface.call("setValuePrintType", ConstClass.PRINT_FILE            ,strDoc                             ,printerName);
          if( strQuery!=null && strQuery!=""){
            //Javascript의 setValue를 호출합니다.(리포트파일)
            ExternalInterface.call("setValuePrintType", ConstClass.PRINT_QUERY         ,strQuery                           ,printerName);
          }
          //Slient Print여부 추가.
          ExternalInterface.call("setValuePrintType", ConstClass.PRINT_SILENT_PRINT    ,isSilentPrint                      ,printerName);
          
          //Slient 출력시 사용할 프린트명
          //해당 변수값을 프린터형태별로 다르게 부여되도록 한다.
          ExternalInterface.call("setValuePrintType", ConstClass.PRINT_SILENT_PRINT_NAME + printerName  ,silentPrintName   ,printerName);
          
          //프린터명(형태) 추가.
          ExternalInterface.call("setValuePrintType", ConstClass.PRINT_PRINTER_NAME    ,printerName                        ,printerName);
          
          //출력매수
          ExternalInterface.call("setValuePrintType", ConstClass.PRINT_COUNT           ,printCount                         ,printerName);
          //리포트 내부쿼리 사용여부
          ExternalInterface.call("setValuePrintType", ConstClass.PRINT_OWN_QUIERY      ,isOwnQuery                         ,printerName);
          
          //출력 선택한 값.
          if(checkedValues!=null)
            ExternalInterface.call("setValuePrintType", ConstClass.PRINT_CHECKED_VALUE   ,checkedValues.toString()         ,printerName);
          
        }else{
          //Post 변수를 초기화 합니다.
          //Silent출력이 아닐경우 초기화하지 않도록 한다
          ExternalInterface.call("clearValues");
          
          ExternalInterface.call("setValue", ConstClass.PRINT_FILE            ,strDoc);
          if( strQuery!=null && strQuery!=""){
            //Javascript의 setValue를 호출합니다.(리포트파일)
            ExternalInterface.call("setValue", ConstClass.PRINT_QUERY         ,strQuery);
          }
          //Slient Print여부 추가.
          ExternalInterface.call("setValue", ConstClass.PRINT_SILENT_PRINT    ,isSilentPrint);
          
          //Slient 출력시 사용할 프린트명
          //해당 변수값을 프린터형태별로 다르게 부여되도록 한다.
          ExternalInterface.call("setValue", ConstClass.PRINT_SILENT_PRINT_NAME + printerName  ,silentPrintName);
          
          //프린터명(형태) 추가.
          //ExternalInterface.call("setValue", ConstClass.PRINT_PRINTER_NAME    ,printerName);
          //TYPE을 넘기도록 합니다.
          //type은 post방식으로 넘김니다
          strURL = strURL + "?" + ConstClass.PRINT_PRINTER_NAME +"="+printerName;
          //출력매수
          ExternalInterface.call("setValue", ConstClass.PRINT_COUNT           ,printCount);
          //리포트 내부쿼리 사용여부
          ExternalInterface.call("setValue", ConstClass.PRINT_OWN_QUIERY      ,isOwnQuery);
          
          //출력 선택한 값.
          if(checkedValues!=null)
            ExternalInterface.call("setValue", ConstClass.PRINT_CHECKED_VALUE   ,checkedValues.toString());
          
        }
        
        //출력물 Parameter세팅.
        getParametersForPost();
      }else{
        
        strURL = strURL + "?"+ConstClass.PRINT_FILE+"="+strDoc;
        if( strQuery!=null && strQuery!="")
          strURL = strURL + "&" + ConstClass.PRINT_QUERY +"="+strQuery;
        //Slient Print여부 추가.
        strURL = strURL + "&" + ConstClass.PRINT_SILENT_PRINT +"="+isSilentPrint;
        //Slient Print Name 추가
        //해당 변수값을 프린터형태별로 다르게 부여되도록 한다.
        strURL = strURL + "&" + ConstClass.PRINT_SILENT_PRINT_NAME+printerName +"="+ silentPrintName;
        //TYPE을 넘기도록 합니다.
        strURL = strURL + "&" + ConstClass.PRINT_PRINTER_NAME +"="+printerName;
        //출력매수
        strURL = strURL + "&" + ConstClass.PRINT_COUNT +"="+printCount;
        //리포트 내부쿼리 사용여부
        strURL = strURL + "&" + ConstClass.PRINT_OWN_QUIERY +"="+isOwnQuery;
        
        //출력 선택한 값.
        if(checkedValues!=null)
          strURL = strURL + "&" + ConstClass.PRINT_CHECKED_VALUE +"="+checkedValues.toString();
        
        strURL = strURL + getParameters();
      }
      
      if(isSilentPrint==ConstClass.CONST_N){
        openAsetecPrintPopup(strURL,title,1000,600);
      }else{
        //사용자별 설정한 프린트정보로 출력할지 여부.
        if(printerName==null || printerName=="")
          ExternalInterface.call("loadHiddenIFrame",strURL);
        else
          ExternalInterface.call("loadHiddenPrint" ,strURL  ,printerName);
      }
    }
    
    /**
     * 브라우저 새로운 창으로 뛰우는 function
     */
    private function openWeb(url:String, name:String, width:Number, height:Number):void {
      navigateToURL(new URLRequest('javascript:(function(){window.open("'+ url
        + '", "' + name + '", "toolbar=no,location=no,status=no,'
        + 'menubar=no,scrollbars=no,resizable=no,width=' + width
        + ',height=' + height + '");})()'), '_blank');
      
    }
    
    /**
     * 브라우저 새로운 창으로 뛰우는 function
     */
    private function openWebUseURLVariables(url:String, uv:URLVariables):void {
      var request:URLRequest = new URLRequest(url);
      request.data = uv;
      request.method = URLRequestMethod.POST;
      navigateToURL(request,"_blank");
    }
    
    /**
     * Iframe을 이용한 Popup창 뛰우기.
     */
    private function openAsetecPrintPopup(url:String, name:String, width:Number, height:Number):void {
      //var popUpWindow:AsetecPopup = AsetecPopup(PopUpManager.createPopUp(DisplayObject(mx.core.FlexGlobals.topLevelApplication),AsetecPopup,true));
      var popUpWindow:IFramePopUp = new IFramePopUp();
      PopUpManager.addPopUp(popUpWindow   ,DisplayObject(mx.core.FlexGlobals.topLevelApplication) ,true);
      popUpWindow.width    = width;
      popUpWindow.height   = height;
      popUpWindow.title    = name;
      popUpWindow.isPost   = isPost;
      //Source를 가장 마지막에 해줍니다.
      popUpWindow.source   = url;
      //움직이지 않도록 처리합니다.
      popUpWindow.isPopUp  = false;
      PopUpManager.centerPopUp(popUpWindow);
    }
    
    /**
     * Parameter정보를 URL형태 String으로 변환합니다.
     */
    private function getParameters():String{
      var strReturn:String = "";
      
      var intSize:int = _parameters.size();
      if(intSize==0){
        return strReturn;
      }
      
      strReturn = "&";
      var arrKeys:Array   = _parameters.getKeys();
      var arrValues:Array = _parameters.getValues();
      for(var i:int=0;i<intSize;i++){
        strReturn = strReturn + arrKeys[i]+"="+encodeURI(arrValues[i]);
        
        if(i!=(arrValues.length-1))
          strReturn = strReturn + "&";
      }
      
      return strReturn;
    }
    
    /**
     * Parameter정보를 URL형태 String으로 변환합니다.(Post형태로 값을 처리합니다.)
     */
    private function getParametersForPost():void{
      var intSize:int = _parameters.size();
      if(intSize==0){
        return;
      }
      var arrKeys:Array   = _parameters.getKeys();
      var arrValues:Array = _parameters.getValues();
      //사용자정의 프린터로 출력시 특정 form에 값이 쌓이도록 처리한다
      if(usedSetupedPrint) {
        for(var i1:int=0;i1<intSize;i1++){
          ExternalInterface.call("setValuePrintType", arrKeys[i1]           ,arrValues[i1],  printerName);
        }
      }else{
        for(var i2:int=0;i2<intSize;i2++){
          ExternalInterface.call("setValue", arrKeys[i2]           ,arrValues[i2]);
        }
      }
    }
    
    /**
     * URLVariables형태로 Parameter를 입력하도록 합니다.
     */
    private function getURLRequest(uv:URLVariables):URLVariables{
      if(uv==null)
        uv = new URLVariables();
      
      var intSize:int = _parameters.size();
      if(intSize==0){
        return uv;
      }
      
      var arrKeys:Array   = _parameters.getKeys();
      var arrValues:Array = _parameters.getValues();
      for(var i:int=0;i<intSize;i++){
        uv[arrKeys[i]] = arrValues[i];
      }
      
      return uv;
    }
  }
}