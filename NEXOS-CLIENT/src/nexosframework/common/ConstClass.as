package nexosframework.common {
  import mx.collections.ArrayCollection;
  import mx.core.FlexGlobals;
  
  [RemoteClass(alias="com.asetec.flex.ConstClass")]

/**
 * <p>ConstClass</p>
 * <p>Description: 기본상수관련 Class</p>
 * <p>Copyright: Copyright(c) 2010</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br/>
 * -------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 *  1.0         2008-02-20  Lee Kyung-woo     신규작성<br/>
 *  1.1         2008-05-28  Lee Kyung-woo     column type중에 input속성 추가(input은 key와같은 색깔을 가지도록 합니다.)<br/>
 *  1.2         2009-06-26  Lee Kyung-woo     PRINT_STOP_PRINT 속성 추가.<br/>
 *  1.3         2011-02-11  Cui Hua           부서코드 DEFAULT값('0000')추가<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 */
  public class ConstClass {
    
    public static var RESOURCE:ArrayCollection = new ArrayCollection();
    
    public static var DEFAULT_LOCALE:String            = "ko_KR";
    public static var IS_USED_LOCALE:String            = "N";
    
    //############################################################
    //0.날짜관련.
    public static var DATE_FORMAT:String      = "YYYY/MM/DD";
    public static var DATETIME_FORMAT:String  = "YYYY/MM/DD A LL:NN:SS";
    public static var DATE_BETWEEN_GAP:int    = 2;    //기간 BETWEEN FROM에 마이너스 (2010-05-12 Lee Jung Hoon)
    
    //0.1. 공통변수
    [Bindable]
    public static var CONST_Y:String      = "Y";
    [Bindable]
    public static var CONST_N:String      = "N";
    public static var CONST_OK:String     = "OK";
    
    //0.2. 경로정보
    public static var URL_VIEW_ROOT:String    = "/com/asetec/view/";
    public static var URL_UPLOAD:String       = "/uploadFile";
    public static var URL_UPLOAD_ROOT:String  = "/upload/";
    /*
    * 2012-10-05
    * 이경우
    * 소스 정리차원에서 주석처리
    public static var URL_EDI_UPLOAD:String   = "/EDIUploadFile";
    */
    public static var UPLOAD_MESSAGE:String   = "Uploading...";
    
    public static var DOWNLOAD_MESSAGE:String   = "Downloading...";
    
    //0.3. 프로그램 구분변수.
    [Bindable]
    public static var PROGRAM_DIV_MENU:String       = "M";
    [Bindable]
    public static var PROGRAM_DIV_ENTRY:String      = "E";
    [Bindable]
    public static var PROGRAM_DIV_PRINT:String      = "R";
    [Bindable]
    public static var PROGRAM_DIV_INQUIRY:String    = "Q";
    [Bindable]
    public static var PROGRAM_DIV_WEB:String        = "W";
    
    public static var ICON_DEFAULT:String           = "_LeafIcon";
    public static var ICON_SELECT:String            = "_ProgramDivSIcon";
    public static var ICON_ENTRY:String             = "_ProgramDivEIcon";
    public static var ICON_REPORT:String            = "_ProgramDivRIcon";
     
    //############################################################
    //1.Application관련.
    [Bindable]
    public static var STATE_INSERT:String = "Insert";
    [Bindable]
    public static var STATE_UPDATE:String = "Update";
    [Bindable]
    public static var STATE_DELETE:String = "Delete";
    [Bindable]
    public static var STATE_NONE:String= "None";
    
    //############################################################
    //2.AsetecDataGrid.
    public static var GRID_INSERT:String                      = "I";
    public static var GRID_UPDATE:String                      = "U";
    public static var GRID_DELETE:String                      = "D";
    public static var GRID_JOBTYPE:String                     = "_JobType";
    public static var GRID_SUMCOLUMN:String                   = "_Sum";
    public static var GRID_SUMCOLUMN_VALUE:String             = "[T]";
    
    public static var GRID_FLAGUPDATE_VIEW:String             = "view";       //조회모드
    public static var GRID_FLAGUPDATE_EDIT:String             = "edit";       //수정모드(실제로 값을 cell에 넣어서 수정)
    public static var GRID_FLAGUPDATE_UPDATE:String           = "update";     //변경모드(cell에 값을 넣어서 수정하지 않고 단지 저장을 하기 위한 Grid.)
    public static var GRID_FLAGUPDATE_REFERENCE:String        = "reference";  //참조모드
    
    public static var GRID_ROWS:String                        = "Rows";
    public static var GRID_DEFAULT_ROW_HEIGHT:int             = 22;
    
    //2.1. AsetecDataGridColumn
    public static var COLUMN_KEY:String                       = "key";
    public static var COLUMN_REF:String                       = "reference";
    public static var COLUMN_NOR:String                       = "normal";
    public static var COLUMN_IN:String                        = "input";
    
    //############################################################
    //3. 색상.
    [Bindable]
    public static var COLOR_KEY:uint      = 0xF0E795;
    [Bindable]
    public static var COLOR_REF:uint      = 0xE3E3E3;
    [Bindable]
    public static var COLOR_NORMAL:uint   = 0xFFFFFF;
    [Bindable]
    public static var COLOR_RED:uint      = 0xFF0000;
    [Bindable]
    public static var COLOR_BLUE:uint     = 0x0000FF; 
    [Bindable]
    public static var COLOR_BLACK:uint    = 0x000000;
    
    //############################################################
    //4. URL정보
    public static var PRINT_URL:String              = "/report";
    //public static var PRINT_URL:String              = "/appServlet/report";
    public static var PRINT_PARAMETER:String        = "__P_";
    public static var PRINT_PARAMETER_REPLACE:String= "_R";
    public static var PRINT_SILENT_PRINT:String     = "_SP";
    public static var PRINT_SILENT_PRINT_NAME:String= "_SN";
    public static var PRINT_STOP_PRINT:String       = "_ST";
    /**
    * 사용할 프린트명.(CSUSER_SYSINFO 프린트정보)
    * PRINT_LABEL_IN      : 입고 라벨 프린트
    * PRINT_BILL_IN       : 입고 전표 프린트
    * PRINT_LABEL_OUT     : 출고 라벨 프린트
    * PRINT_BILL_OUT      : 출고 전표 프린트
    */
    public static var PRINT_PRINTER_NAME:String     = "_PN";
    /**
    * 출력매수
    */
    public static var PRINT_COUNT:String            = "_PC";
    /**
    * 출력을 위한 선택한 값
    */
    public static var PRINT_CHECKED_VALUE:String    = "_CH";
    
    /**
    * 리포트 내부쿼리 사용여부
    */
    public static var PRINT_OWN_QUIERY:String       = "_OW";
    
    public static var PRINT_FILE:String   = "reportFileName";
    public static var PRINT_QUERY:String  = "_QUERY";
    public static var PRINT_MESSAGE_NONE_EXIST:String = "출력물 미존재";
    public static var PRINT_MESSAGE_EXIST:String="출력물선택";
    
    public static var PRINT_LABEL_IN:String   = "PRINT_LABEL_IN";
    public static var PRINT_BILL_IN:String    = "PRINT_BILL_IN";
    public static var PRINT_LABEL_OUT:String  = "PRINT_LABEL_OUT";
    public static var PRINT_BILL_OUT:String   = "PRINT_BILL_OUT";
    
    /*
    * 2012-10-05
    * 이경우
    * 미사용으로 주석처리
    //public static var CSVEXP_URL:String       = "/CSVExporter";
    */

    //############################################################
    //5.입출고 기본값.
    //5.1 정상입출고.
    public static var INBOUND_ITEM_STATE:String    = "A";     //제품 상태
    public static var INBOUND_ITEM_LOT:String      = "00";    //제품 LOT
    public static var INBOUND_INOUT_CD:String      = "E10";   //입고구분 기본값.
    public static var OUTBOUND_ITEM_STATE:String   = "A";     //제품상태
    public static var OUTBOUND_ITEM_LOT:String     = "";    //제품 LOT
    public static var OUTBOUND_INOUT_CD:String     = "D10";   //출고구분 기본값.
    
    //5.2 반품
    public static var RETURN_IN_ITEM_STATE:String      = "X";
    public static var RETURN_IN_ITEM_LOT:String        = "00";
    public static var RETURN_IN_INOUT_CD:String        = "E30";   //입고구분 기본값.
    public static var RETURN_IN_OUTBOUND_STATE:String  = "40";    //지시상태 기본값.
    public static var RETURN_OUT_ITEM_STATE:String     = "A";
    public static var RETURN_OUT_ITEM_LOT:String       = "00";
    public static var RETURN_OUT_INOUT_CD:String       = "D30";   //입고구분 기본값.
    public static var RETURN_OUT_OUTBOUND_STATE:String = "30";    //지시상태 기본값.
    public static var RETURN_OUT_OUTBOUND_STATE10_NM:String = "반출예정"; 
    public static var RETURN_OUT_OUTBOUND_STATE20_NM:String = "반출등록"; 
    
    //5.3 기타입출고
    public static var ETC_IN_ITEM_STATE:String    = "A";
    public static var ETC_IN_ITEM_LOT:String      = "00";
    public static var ETC_OUT_ITEM_STATE:String   = "A";
    public static var ETC_OUT_ITEM_LOT:String     = "00"; 
    
    //############################################################
    //6. 프로세스 그룹코드 및 입출고 프로세스정보
    public static var PROCESS_GRP_IN:String        = "LI";
    public static var PROCESS_GRP_OUT:String       = "LO";
    public static var PROCESS_GRP_RIN:String       = "RI";
    public static var PROCESS_GRP_ROUT:String      = "RO";
    public static var PROCESS_CONFIRM:String       = "FW";    //프로세스처리시 순방향 코드
    public static var PROCESS_CANCEL:String        = "BW";    //프로세스처리시 역방향 코드
    
    //############################################################
    //7. 기타 DataSet.
    public static var AM:Object  = {label:"오전", data:"AM"};
    public static var PM:Object  = {label:"오후", data:"PM"};
    [Bindable]
    public static var AMPM:Array = new Array(AM, PM);
    /*
    public static var MIN_DATE:String = "1900-01-01";         //최소날짜.
    public static var MAX_DATE:String = "9999-01-01";         //최대날짜.
    */
    public static var MIN_DATE:String = "1900/01/01";         //최소날짜.
    public static var MAX_DATE:String = "9999/01/01";         //최대날짜.
    
    //7.1 사업부별 화면유형.
    [Bindable]
    public static var DISPLAY_DIV_1:String         = "1";     //공산품
    [Bindable]
    public static var DISPLAY_DIV_2:String         = "2";     //의류
    
    //8. 색상정보
    public static var COLOR1:uint                  = 0xFFFF99;    //확정시 row색상.
	
    //############################################################
    //9. Error Code
    public static var ERRO_SESSION_END:String     = "__SESSION_END__";
    public static var ERROR_HEADER:String         = "에러발생";
    public static var ERROR_ZM0001:String         = "세션이 종료되었거나, 호출한 Service가 존재하지 않습니다.\n로그인후 다시 시도해주세요.";
    public static var ERROR_ZM0002:String         = "세션만료";
    public static var ERROR_ZM0003:String         = "세션이 종료되었습니다.\n다시 로그인해주세요.";
    
    //10.component별 리소스관리.
    //10-1. AsetecDataGridPanel
    public static var AsetecDataGridPanel:Object  = ConstClass.initAsetecDataGridPanel();
    
	  //11.부서코드 기본값
    public static var USED_DEPT:String            = "Y";     //부서코드 사용여부
	  public static var DEFAULT_DEPT_CD:String      = "0000";  //기본 부서코드
    
	  /**
    * AsetecDataGridPanel 초기값.
    */
    public static function initAsetecDataGridPanel():Object {
      var objReturn:Object = new Object();
      objReturn.DEFAULT_BUTTON_BIG_HEIGHT = 16;
      objReturn.DEFAULT_BUTTON_BIG_WIDTH  = 16;
      objReturn.DEFAULT_BUTTON_HEIGHT     = 20;
      objReturn.DEFAULT_BUTTON_WIDTH      = 55;
      objReturn.DEFAULT_BUTTON_HGAP       = 10;
      objReturn.DEFAULT_BUTTON_VGAP       = 3;
      objReturn.HORIZONTAL_ALIGN_BUTTONS  = "left";
      
      return objReturn;
    }
    
    //10-2.AsetecPopUp
    [Bindable]
    public static var AsetecPopUp:Object          = ConstClass.initAsetecPopUp();
    public static function initAsetecPopUp():Object {
      var objReturn:Object = new Object();
      objReturn.width                     = 1000;
      objReturn.height                    = 550;
      
      return objReturn;
    }
    
    /**
    * Resource 정보를 바타응로 변수값 세팅.
    * @param values 서버 FlexResource. 
    */
    public static function setValues(values:ArrayCollection):void {
      if(values==null)
        return;
     
      ConstClass.RESOURCE.source = values.source;
      
      //FlexResources에 세팅된것이 아니라 root.properties에 세팅된 language코드값.
      ConstClass.DEFAULT_LOCALE                 = String(Util.getNull(values[0]["ConstClass.DEFAULT_LOCALE"]                  ,ConstClass.DEFAULT_LOCALE)                      );
      ConstClass.IS_USED_LOCALE                 = String(Util.getNull(values[0]["ConstClass.IS_USED_LOCALE"]                  ,ConstClass.IS_USED_LOCALE)                      );
      if(ConstClass.IS_USED_LOCALE=="Y") {
        mx.core.FlexGlobals.topLevelApplication.hbLoale.width = 80;
        mx.core.FlexGlobals.topLevelApplication.hbLoale.visible = true;
      }else{
        mx.core.FlexGlobals.topLevelApplication.hbLoale.width = 0;
        mx.core.FlexGlobals.topLevelApplication.hbLoale.visible = false;
      }
      
      ConstClass.DATE_FORMAT                    = String(Util.getNull(values[0]["ConstClass.DATE_FORMAT"]                     ,ConstClass.DATE_FORMAT)                         );
      ConstClass.DATETIME_FORMAT                = String(Util.getNull(values[0]["ConstClass.DATETIME_FORMAT"]                 ,ConstClass.DATETIME_FORMAT)                     );
      ConstClass.CONST_Y                        = String(Util.getNull(values[0]["ConstClass.CONST_Y"]                         ,ConstClass.CONST_Y)                             );
      ConstClass.CONST_N                        = String(Util.getNull(values[0]["ConstClass.CONST_N"]                         ,ConstClass.CONST_N)                             );
      ConstClass.CONST_OK                       = String(Util.getNull(values[0]["ConstClass.CONST_OK"]                        ,ConstClass.CONST_OK)                            );
      ConstClass.URL_VIEW_ROOT                  = String(Util.getNull(values[0]["ConstClass.URL_VIEW_ROOT"]                   ,ConstClass.URL_VIEW_ROOT)                       );
      ConstClass.PROGRAM_DIV_MENU               = String(Util.getNull(values[0]["ConstClass.PROGRAM_DIV_MENU"]                ,ConstClass.PROGRAM_DIV_MENU)                    );
      ConstClass.PROGRAM_DIV_ENTRY              = String(Util.getNull(values[0]["ConstClass.PROGRAM_DIV_ENTRY"]               ,ConstClass.PROGRAM_DIV_ENTRY)                   );
      ConstClass.PROGRAM_DIV_PRINT              = String(Util.getNull(values[0]["ConstClass.PROGRAM_DIV_PRINT"]               ,ConstClass.PROGRAM_DIV_PRINT)                   );
      ConstClass.PROGRAM_DIV_INQUIRY            = String(Util.getNull(values[0]["ConstClass.PROGRAM_DIV_INQUIRY"]             ,ConstClass.PROGRAM_DIV_INQUIRY)                 );
      ConstClass.PROGRAM_DIV_WEB                = String(Util.getNull(values[0]["ConstClass.PROGRAM_DIV_WEB"]                 ,ConstClass.PROGRAM_DIV_WEB)                     );
      ConstClass.ICON_DEFAULT                   = String(Util.getNull(values[0]["ConstClass.ICON_DEFAULT"]                    ,ConstClass.ICON_DEFAULT)                        );
      ConstClass.ICON_SELECT                    = String(Util.getNull(values[0]["ConstClass.ICON_SELECT"]                     ,ConstClass.ICON_SELECT)                         );
      ConstClass.ICON_ENTRY                     = String(Util.getNull(values[0]["ConstClass.ICON_ENTRY"]                      ,ConstClass.ICON_ENTRY)                          );
      ConstClass.ICON_REPORT                    = String(Util.getNull(values[0]["ConstClass.ICON_REPORT"]                     ,ConstClass.ICON_REPORT)                         );
      ConstClass.STATE_INSERT                   = String(Util.getNull(values[0]["ConstClass.STATE_INSERT"]                    ,ConstClass.STATE_INSERT)                        );
      ConstClass.STATE_UPDATE                   = String(Util.getNull(values[0]["ConstClass.STATE_UPDATE"]                    ,ConstClass.STATE_UPDATE)                        );
      ConstClass.STATE_DELETE                   = String(Util.getNull(values[0]["ConstClass.STATE_DELETE"]                    ,ConstClass.STATE_DELETE)                        );
      ConstClass.STATE_NONE                     = String(Util.getNull(values[0]["ConstClass.STATE_NONE"]                      ,ConstClass.STATE_NONE)                          );
      ConstClass.GRID_INSERT                    = String(Util.getNull(values[0]["ConstClass.GRID_INSERT"]                     ,ConstClass.GRID_INSERT)                         );
      ConstClass.GRID_UPDATE                    = String(Util.getNull(values[0]["ConstClass.GRID_UPDATE"]                     ,ConstClass.GRID_UPDATE)                         );
      ConstClass.GRID_DELETE                    = String(Util.getNull(values[0]["ConstClass.GRID_DELETE"]                     ,ConstClass.GRID_DELETE)                         );
      ConstClass.GRID_JOBTYPE                   = String(Util.getNull(values[0]["ConstClass.GRID_JOBTYPE"]                    ,ConstClass.GRID_JOBTYPE)                        );
      ConstClass.GRID_SUMCOLUMN                 = String(Util.getNull(values[0]["ConstClass.GRID_SUMCOLUMN"]                  ,ConstClass.GRID_SUMCOLUMN)                      );
      ConstClass.GRID_SUMCOLUMN_VALUE           = String(Util.getNull(values[0]["ConstClass.GRID_SUMCOLUMN_VALUE"]            ,ConstClass.GRID_SUMCOLUMN_VALUE)                );
      ConstClass.GRID_FLAGUPDATE_VIEW           = String(Util.getNull(values[0]["ConstClass.GRID_FLAGUPDATE_VIEW"]            ,ConstClass.GRID_FLAGUPDATE_VIEW)                );
      ConstClass.GRID_FLAGUPDATE_EDIT           = String(Util.getNull(values[0]["ConstClass.GRID_FLAGUPDATE_EDIT"]            ,ConstClass.GRID_FLAGUPDATE_EDIT)                );
      ConstClass.GRID_FLAGUPDATE_UPDATE         = String(Util.getNull(values[0]["ConstClass.GRID_FLAGUPDATE_UPDATE"]          ,ConstClass.GRID_FLAGUPDATE_UPDATE)              );
      ConstClass.GRID_FLAGUPDATE_REFERENCE      = String(Util.getNull(values[0]["ConstClass.GRID_FLAGUPDATE_REFERENCE"]       ,ConstClass.GRID_FLAGUPDATE_REFERENCE)           );
      ConstClass.GRID_ROWS                      = String(Util.getNull(values[0]["ConstClass.GRID_ROWS"]                       ,ConstClass.GRID_ROWS)                           );
      ConstClass.GRID_DEFAULT_ROW_HEIGHT        = int(   Util.getNull(values[0]["ConstClass.GRID_DEFAULT_ROW_HEIGHT"]         ,ConstClass.GRID_DEFAULT_ROW_HEIGHT)             );
      ConstClass.COLUMN_KEY                     = String(Util.getNull(values[0]["ConstClass.COLUMN_KEY"]                      ,ConstClass.COLUMN_KEY)                          );
      ConstClass.COLUMN_REF                     = String(Util.getNull(values[0]["ConstClass.COLUMN_REF"]                      ,ConstClass.COLUMN_REF)                          );
      ConstClass.COLUMN_NOR                     = String(Util.getNull(values[0]["ConstClass.COLUMN_NOR"]                      ,ConstClass.COLUMN_NOR)                          );
      ConstClass.COLUMN_IN                      = String(Util.getNull(values[0]["ConstClass.COLUMN_IN"]                       ,ConstClass.COLUMN_IN)                           );
      ConstClass.COLOR_KEY                      = uint(Util.getNull(values[0]["ConstClass.COLOR_KEY"]                         ,ConstClass.COLOR_KEY)                           );
      ConstClass.COLOR_REF                      = uint(Util.getNull(values[0]["ConstClass.COLOR_REF"]                         ,ConstClass.COLOR_REF)                           );
      ConstClass.COLOR_NORMAL                   = uint(Util.getNull(values[0]["ConstClass.COLOR_NORMAL"]                      ,ConstClass.COLOR_NORMAL)                        );
      ConstClass.COLOR_RED                      = uint(Util.getNull(values[0]["ConstClass.COLOR_RED"]                         ,ConstClass.COLOR_RED)                           );
      ConstClass.COLOR_BLACK                    = uint(Util.getNull(values[0]["ConstClass.COLOR_BLACK"]                       ,ConstClass.COLOR_BLACK)                         );
      ConstClass.PRINT_URL                      = String(Util.getNull(values[0]["ConstClass.PRINT_URL"]                       ,ConstClass.PRINT_URL)                           );
      ConstClass.PRINT_PARAMETER                = String(Util.getNull(values[0]["ConstClass.PRINT_PARAMETER"]                 ,ConstClass.PRINT_PARAMETER)                     );
      ConstClass.PRINT_PARAMETER_REPLACE        = String(Util.getNull(values[0]["ConstClass.PRINT_PARAMETER_REPLACE"]         ,ConstClass.PRINT_PARAMETER_REPLACE)             );
      ConstClass.PRINT_SILENT_PRINT             = String(Util.getNull(values[0]["ConstClass.PRINT_SILENT_PRINT"]              ,ConstClass.PRINT_SILENT_PRINT)                  );
      ConstClass.PRINT_STOP_PRINT               = String(Util.getNull(values[0]["ConstClass.PRINT_STOP_PRINT"]                ,ConstClass.PRINT_STOP_PRINT)                    );
      ConstClass.PRINT_PRINTER_NAME             = String(Util.getNull(values[0]["ConstClass.PRINT_PRINTER_NAME"]              ,ConstClass.PRINT_PRINTER_NAME)                  );
      ConstClass.PRINT_COUNT                    = String(Util.getNull(values[0]["ConstClass.PRINT_COUNT"]                     ,ConstClass.PRINT_COUNT)                         );
      ConstClass.PRINT_CHECKED_VALUE            = String(Util.getNull(values[0]["ConstClass.PRINT_CHECKED_VALUE"]             ,ConstClass.PRINT_CHECKED_VALUE)                 );
      ConstClass.PRINT_FILE                     = String(Util.getNull(values[0]["ConstClass.PRINT_FILE"]                      ,ConstClass.PRINT_FILE)                          );
      ConstClass.PRINT_QUERY                    = String(Util.getNull(values[0]["ConstClass.PRINT_QUERY"]                     ,ConstClass.PRINT_QUERY)                         );
      ConstClass.PRINT_MESSAGE_NONE_EXIST       = String(Util.getNull(values[0]["ConstClass.PRINT_MESSAGE_NONE_EXIST"]        ,ConstClass.PRINT_MESSAGE_NONE_EXIST)            );
      ConstClass.PRINT_MESSAGE_EXIST            = String(Util.getNull(values[0]["ConstClass.PRINT_MESSAGE_EXIST"]             ,ConstClass.PRINT_MESSAGE_EXIST)                 );
      ConstClass.PRINT_LABEL_IN                 = String(Util.getNull(values[0]["ConstClass.PRINT_LABEL_IN"]                  ,ConstClass.PRINT_LABEL_IN)                      );
      ConstClass.PRINT_BILL_IN                  = String(Util.getNull(values[0]["ConstClass.PRINT_BILL_IN"]                   ,ConstClass.PRINT_BILL_IN)                       );
      ConstClass.PRINT_LABEL_OUT                = String(Util.getNull(values[0]["ConstClass.PRINT_LABEL_OUT"]                 ,ConstClass.PRINT_LABEL_OUT)                     );
      ConstClass.PRINT_BILL_OUT                 = String(Util.getNull(values[0]["ConstClass.PRINT_BILL_OUT"]                  ,ConstClass.PRINT_BILL_OUT)                      );
      //ConstClass.CSVEXP_URL                     = String(Util.getNull(values[0]["ConstClass.CSVEXP_URL"]                      ,ConstClass.CSVEXP_URL)                          );
      ConstClass.INBOUND_ITEM_STATE             = String(Util.getNull(values[0]["ConstClass.INBOUND_ITEM_STATE"]              ,ConstClass.INBOUND_ITEM_STATE)                  );
      ConstClass.INBOUND_ITEM_LOT               = String(Util.getNull(values[0]["ConstClass.INBOUND_ITEM_LOT"]                ,ConstClass.INBOUND_ITEM_LOT)                    );
      ConstClass.INBOUND_INOUT_CD               = String(Util.getNull(values[0]["ConstClass.INBOUND_INOUT_CD"]                ,ConstClass.INBOUND_INOUT_CD)                    );
      ConstClass.OUTBOUND_ITEM_STATE            = String(Util.getNull(values[0]["ConstClass.OUTBOUND_ITEM_STATE"]             ,ConstClass.OUTBOUND_ITEM_STATE)                 );
      ConstClass.OUTBOUND_ITEM_LOT              = String(Util.getNull(values[0]["ConstClass.OUTBOUND_ITEM_LOT"]               ,ConstClass.OUTBOUND_ITEM_LOT)                   );
      ConstClass.OUTBOUND_INOUT_CD              = String(Util.getNull(values[0]["ConstClass.OUTBOUND_INOUT_CD"]               ,ConstClass.OUTBOUND_INOUT_CD)                   );
      ConstClass.RETURN_IN_ITEM_STATE           = String(Util.getNull(values[0]["ConstClass.RETURN_IN_ITEM_STATE"]            ,ConstClass.RETURN_IN_ITEM_STATE)                );
      ConstClass.RETURN_IN_ITEM_LOT             = String(Util.getNull(values[0]["ConstClass.RETURN_IN_ITEM_LOT"]              ,ConstClass.RETURN_IN_ITEM_LOT)                  );
      ConstClass.RETURN_IN_INOUT_CD             = String(Util.getNull(values[0]["ConstClass.RETURN_IN_INOUT_CD"]              ,ConstClass.RETURN_IN_INOUT_CD)                  );
      ConstClass.RETURN_IN_OUTBOUND_STATE       = String(Util.getNull(values[0]["ConstClass.RETURN_IN_OUTBOUND_STATE"]        ,ConstClass.RETURN_IN_OUTBOUND_STATE)            );
      ConstClass.RETURN_OUT_ITEM_STATE          = String(Util.getNull(values[0]["ConstClass.RETURN_OUT_ITEM_STATE"]           ,ConstClass.RETURN_OUT_ITEM_STATE)               );
      ConstClass.RETURN_OUT_ITEM_LOT            = String(Util.getNull(values[0]["ConstClass.RETURN_OUT_ITEM_LOT"]             ,ConstClass.RETURN_OUT_ITEM_LOT)                 );
      ConstClass.RETURN_OUT_INOUT_CD            = String(Util.getNull(values[0]["ConstClass.RETURN_OUT_INOUT_CD"]             ,ConstClass.RETURN_OUT_INOUT_CD)                 );
      ConstClass.RETURN_OUT_OUTBOUND_STATE      = String(Util.getNull(values[0]["ConstClass.RETURN_OUT_OUTBOUND_STATE"]       ,ConstClass.RETURN_OUT_OUTBOUND_STATE)           );
      ConstClass.RETURN_OUT_OUTBOUND_STATE10_NM = String(Util.getNull(values[0]["ConstClass.RETURN_OUT_OUTBOUND_STATE10_NM"]  ,ConstClass.RETURN_OUT_OUTBOUND_STATE10_NM)      );
      ConstClass.RETURN_OUT_OUTBOUND_STATE20_NM = String(Util.getNull(values[0]["ConstClass.RETURN_OUT_OUTBOUND_STATE20_NM"]  ,ConstClass.RETURN_OUT_OUTBOUND_STATE20_NM)      );
      ConstClass.ETC_IN_ITEM_STATE              = String(Util.getNull(values[0]["ConstClass.ETC_IN_ITEM_STATE"]               ,ConstClass.ETC_IN_ITEM_STATE)                   );
      ConstClass.ETC_IN_ITEM_LOT                = String(Util.getNull(values[0]["ConstClass.ETC_IN_ITEM_LOT"]                 ,ConstClass.ETC_IN_ITEM_LOT)                     );
      ConstClass.ETC_OUT_ITEM_STATE             = String(Util.getNull(values[0]["ConstClass.ETC_OUT_ITEM_STATE"]              ,ConstClass.ETC_OUT_ITEM_STATE)                  );
      ConstClass.ETC_OUT_ITEM_LOT               = String(Util.getNull(values[0]["ConstClass.ETC_OUT_ITEM_LOT"]                ,ConstClass.ETC_OUT_ITEM_LOT)                    );
      ConstClass.PROCESS_GRP_IN                 = String(Util.getNull(values[0]["ConstClass.PROCESS_GRP_IN"]                  ,ConstClass.PROCESS_GRP_IN)                      );
      ConstClass.PROCESS_GRP_OUT                = String(Util.getNull(values[0]["ConstClass.PROCESS_GRP_OUT"]                 ,ConstClass.PROCESS_GRP_OUT)                     );
      ConstClass.PROCESS_GRP_RIN                = String(Util.getNull(values[0]["ConstClass.PROCESS_GRP_RIN"]                 ,ConstClass.PROCESS_GRP_RIN)                     );
      ConstClass.PROCESS_GRP_ROUT               = String(Util.getNull(values[0]["ConstClass.PROCESS_GRP_ROUT"]                ,ConstClass.PROCESS_GRP_ROUT)                    );
      ConstClass.PROCESS_CONFIRM                = String(Util.getNull(values[0]["ConstClass.PROCESS_CONFIRM"]                 ,ConstClass.PROCESS_CONFIRM)                     );
      ConstClass.PROCESS_CANCEL                 = String(Util.getNull(values[0]["ConstClass.PROCESS_CANCEL"]                  ,ConstClass.PROCESS_CANCEL)                      );
      ConstClass.AM                             = String(Util.getNull(values[0]["ConstClass.AM"]                              ,ConstClass.AM)                                  );
      ConstClass.PM                             = String(Util.getNull(values[0]["ConstClass.PM"]                              ,ConstClass.PM)                                  );
      ConstClass.MIN_DATE                       = String(Util.getNull(values[0]["ConstClass.MIN_DATE"]                        ,ConstClass.MIN_DATE)                            );
      ConstClass.MAX_DATE                       = String(Util.getNull(values[0]["ConstClass.MAX_DATE"]                        ,ConstClass.MAX_DATE)                            );
      ConstClass.DISPLAY_DIV_1                  = String(Util.getNull(values[0]["ConstClass.DISPLAY_DIV_1"]                   ,ConstClass.DISPLAY_DIV_1)                       );
      ConstClass.DISPLAY_DIV_2                  = String(Util.getNull(values[0]["ConstClass.DISPLAY_DIV_2"]                   ,ConstClass.DISPLAY_DIV_2)                       );
      ConstClass.COLOR1                         = uint(Util.getNull(values[0]["ConstClass.COLOR1"]                            ,ConstClass.COLOR1)                              );
      ConstClass.ERRO_SESSION_END               = String(Util.getNull(values[0]["ConstClass.ERRO_SESSION_END"]                ,ConstClass.ERRO_SESSION_END)                    );
      ConstClass.ERROR_HEADER                   = String(Util.getNull(values[0]["ConstClass.ERROR_HEADER"]                    ,ConstClass.ERROR_HEADER)                        );
      ConstClass.ERROR_ZM0001                   = String(Util.getNull(values[0]["ConstClass.ERROR_ZM0001"]                    ,ConstClass.ERROR_ZM0001)                        );
      ConstClass.ERROR_ZM0002                   = String(Util.getNull(values[0]["ConstClass.ERROR_ZM0002"]                    ,ConstClass.ERROR_ZM0002)                        );
      ConstClass.ERROR_ZM0003                   = String(Util.getNull(values[0]["ConstClass.ERROR_ZM0003"]                    ,ConstClass.ERROR_ZM0003)                        );
      
      ConstClass.URL_UPLOAD                     = String(Util.getNull(values[0]["ConstClass.URL_UPLOAD"]                      ,ConstClass.URL_UPLOAD)                          );
      ConstClass.URL_UPLOAD_ROOT                = String(Util.getNull(values[0]["ConstClass.URL_UPLOAD_ROOT"]                 ,ConstClass.URL_UPLOAD_ROOT)                     );
      //ConstClass.URL_EDI_UPLOAD                 = String(Util.getNull(values[0]["ConstClass.URL_EDI_UPLOAD"]                  ,ConstClass.URL_EDI_UPLOAD)                      );
      ConstClass.UPLOAD_MESSAGE                 = String(Util.getNull(values[0]["ConstClass.UPLOAD_MESSAGE"]                  ,ConstClass.UPLOAD_MESSAGE)                      );
      
      ConstClass.DOWNLOAD_MESSAGE               = String(Util.getNull(values[0]["ConstClass.DOWNLOAD_MESSAGE"]                ,ConstClass.DOWNLOAD_MESSAGE)                      );
      
      //AsetecDataGridPanel 버튼크기값 조정.
      AsetecDataGridPanel.DEFAULT_BUTTON_BIG_HEIGHT = int(Util.getNull(values[0]["AsetecDataGridPanel.DEFAULT_BUTTON_BIG_HEIGHT"] ,AsetecDataGridPanel.DEFAULT_BUTTON_BIG_HEIGHT) );
      AsetecDataGridPanel.DEFAULT_BUTTON_BIG_WIDTH  = int(Util.getNull(values[0]["AsetecDataGridPanel.DEFAULT_BUTTON_BIG_WIDTH"]  ,AsetecDataGridPanel.DEFAULT_BUTTON_BIG_WIDTH)  );
      AsetecDataGridPanel.DEFAULT_BUTTON_HEIGHT     = int(Util.getNull(values[0]["AsetecDataGridPanel.DEFAULT_BUTTON_HEIGHT"]     ,AsetecDataGridPanel.DEFAULT_BUTTON_HEIGHT)     );
      AsetecDataGridPanel.DEFAULT_BUTTON_WIDTH      = int(Util.getNull(values[0]["AsetecDataGridPanel.DEFAULT_BUTTON_WIDTH"]      ,AsetecDataGridPanel.DEFAULT_BUTTON_WIDTH)      );
      AsetecDataGridPanel.DEFAULT_BUTTON_HGAP       = int(Util.getNull(values[0]["AsetecDataGridPanel.DEFAULT_BUTTON_HGAP"]       ,AsetecDataGridPanel.DEFAULT_BUTTON_HGAP)       );
      AsetecDataGridPanel.DEFAULT_BUTTON_VGAP       = int(Util.getNull(values[0]["AsetecDataGridPanel.DEFAULT_BUTTON_VGAP"]       ,AsetecDataGridPanel.DEFAULT_BUTTON_VGAP)       );
      
      //horizontalAlignButtions
      AsetecDataGridPanel.HORIZONTAL_ALIGN_BUTTONS  = String(Util.getNull(values[0]["AsetecDataGridPanel.HORIZONTAL_ALIGN_BUTTONS"]  ,AsetecDataGridPanel.HORIZONTAL_ALIGN_BUTTONS)  );
      
      //AsetecPopup 초기값세팅.
      AsetecPopUp.width                         = int(Util.getNull(values[0]["AsetecPopUp.width"]  ,AsetecPopUp.width)   );
      AsetecPopUp.height                        = int(Util.getNull(values[0]["AsetecPopUp.height"] ,AsetecPopUp.height)  );
    }
  }
}