package nexosframework.common {
  import mx.collections.ArrayCollection;
  import mx.core.FlexGlobals;

/**
 * <p>Session</p>
 * <p>Description: System의 Session정보를 가지고 있을 Class</p>
 * <p>Copyright: Copyright(c) 2012</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br/>
 * -------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 *  1.0         2012-12-20  Lee Kyung-woo     신규작성<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 */
  public class Session{
    
    //Session 변수.
    public static var G_USER_ID   : String;
    public static var G_USER_PWD  : String;
    public static var G_USER_NM   : String;
    public static var G_CENTER_CD : String;
    public static var G_CENTER_NM : String;
    public static var G_CUST_CD   : String;
    public static var G_CUST_NM   : String;
    public static var G_DEPT_CD   : String;
    public static var G_DEPT_NM   : String;
    public static var G_FACT_CD   : String;
    public static var G_FACT_NM   : String;
    public static var G_BRAND_CD  : String;
    public static var G_BRAND_NM  : String;
    public static var G_EXE_LEVEL1  : String
    public static var G_EXE_LEVEL2  : String
    public static var G_EXE_LEVEL3  : String
    public static var G_EXE_LEVEL4  : String
    public static var G_PROGRAM_ID  : String;
    public static var G_EXIST_NOTICE  : String;
    public static var SESSION_TYPE  : String;
    public static var SYS_LANG      : String;
    
    public static var CLIENT_IP     : String;
    
    public static var G_CERTIFY_DIV : String;
    public static var G_REF_CUST_CD : String;
    public static var G_REF_CUST_NM : String;
    
    public static var G_PRINT_LABEL_IN:String;
    public static var G_PRINT_BILL_IN:String;
    public static var G_PRINT_LABEL_OUT:String;
    public static var G_PRINT_BILL_OUT:String;
    
    //입고스캔 상품별 라벨(임시적으로 추가됨)
    public static var G_PRINT_LABEL_IN_IN:String;
    
    /**
    * 최종적으로 조회한 BRAND의 DISPLAY_DIV(CODE_GRP='CUST09')
    * 1:일반, 2:의류.
    */
    public static var G_BRAND_DISPLAY_DIV   : String;
    
    /**
    *  sessionAC로 부터 갓을 가져옵니다.
    */
    public static function setValues(acValue:ArrayCollection):void{
      if(acValue==null || acValue.length==0)
        return;
      
      var objRow:Object           = acValue.getItemAt(0);
      
      Session.G_USER_ID           = objRow["G_USER_ID"];
      Session.G_USER_PWD          = objRow["G_USER_PWD"]
      Session.G_USER_NM           = objRow["G_USER_NM"];
      Session.G_CENTER_CD         = objRow["G_CENTER_CD"];
      Session.G_CENTER_NM         = objRow["G_CENTER_NM"];
      Session.G_CUST_CD           = objRow["G_CUST_CD"];
      Session.G_CUST_NM           = objRow["G_CUST_NM"];
      Session.G_DEPT_CD           = objRow["G_DEPT_CD"];
      Session.G_DEPT_NM           = objRow["G_DEPT_NM"];
      Session.G_FACT_CD           = objRow["G_FACT_CD"];
      Session.G_FACT_NM           = objRow["G_FACT_NM"];
      Session.G_BRAND_CD          = objRow["G_BRAND_CD"];
      Session.G_BRAND_NM          = objRow["G_BRAND_NM"];
      Session.G_EXE_LEVEL1        = objRow["G_EXE_LEVEL1"];
      Session.G_EXE_LEVEL2        = objRow["G_EXE_LEVEL2"];
      Session.G_EXE_LEVEL3        = objRow["G_EXE_LEVEL3"];
      Session.G_EXE_LEVEL4        = objRow["G_EXE_LEVEL4"];
      Session.G_EXIST_NOTICE      = objRow["G_EXIST_NOTICE"];
      Session.SESSION_TYPE        = objRow["SESSION_TYPE"];
      Session.SYS_LANG            = objRow["SYS_LANG"];
      Session.G_BRAND_DISPLAY_DIV = objRow["G_BRAND_DISPLAY_DIV"];
      
      Session.G_CERTIFY_DIV       = objRow["G_CERTIFY_DIV"];
      Session.G_REF_CUST_CD       = objRow["G_REF_CUST_CD"];
      Session.G_REF_CUST_NM       = objRow["G_REF_CUST_NM"];
      
      Session.G_PRINT_LABEL_IN    = objRow["G_PRINT_LABEL_IN"];
      Session.G_PRINT_BILL_IN     = objRow["G_PRINT_BILL_IN"];
      Session.G_PRINT_LABEL_OUT   = objRow["G_PRINT_LABEL_OUT"];
      Session.G_PRINT_BILL_OUT    = objRow["G_PRINT_BILL_OUT"];
      
      mx.core.FlexGlobals.topLevelApplication.txtLoginUserNm.text = Session.G_USER_NM;
    }
    
    /**
    * Session 값을 초기화 합니다.
    */
    public static function clearValues():void{
      Session.G_USER_ID     = null;
      Session.G_USER_PWD    = null;
      Session.G_USER_NM     = null;
      Session.G_CENTER_CD   = null;
      Session.G_CENTER_NM   = null;
      Session.G_CUST_CD     = null;
      Session.G_CUST_NM     = null;
      Session.G_DEPT_CD     = null;
      Session.G_DEPT_NM     = null;
      Session.G_FACT_CD     = null;
      Session.G_FACT_NM     = null;
      Session.G_BRAND_CD    = null;
      Session.G_BRAND_NM    = null;
      Session.G_EXE_LEVEL1  = null;
      Session.G_EXE_LEVEL2  = null;
      Session.G_EXE_LEVEL3  = null;
      Session.G_EXE_LEVEL4  = null;
      Session.G_EXIST_NOTICE= null;
      Session.SESSION_TYPE  = null;
      Session.SYS_LANG      = null;
      Session.G_BRAND_DISPLAY_DIV = null;
      
      Session.G_CERTIFY_DIV = null;
      Session.G_REF_CUST_CD = null;
      Session.G_REF_CUST_NM = null;
      
      Session.G_PRINT_LABEL_IN    = null;
      Session.G_PRINT_BILL_IN     = null;
      Session.G_PRINT_LABEL_OUT   = null;
      Session.G_PRINT_BILL_OUT    = null;
      
      Session.CLIENT_IP     = null;
      
      mx.core.FlexGlobals.topLevelApplication.txtLoginUserNm.text = "";
    }
  }
}