import flash.events.Event;

import flexlib.mdi.events.MDIManagerEvent;

import mx.controls.Menu;
import mx.events.ResizeEvent;
import mx.managers.PopUpManager;

import nexosframework.common.ConstClass;
import nexosframework.common.Session;
import nexosframework.common.print.AsetecPrint;
import nexosframework.common.component.Login;

/**
 * <p>WMSMain.as</p>
 * <p>Description: WMSMain에서 사용하는 ActionScript 파일.</p>
 * <p>Copyright: Copyright(c) 2012</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br>
 * -----------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   ----------------------------------<br/>
 *  1.0         2012-11-12  Lee Kyung-woo     신규작성<br/>
 * ---------    ----------  ---------------   ----------------------------------<br/>
 * 
 */

//------------------------------------------------------------------------------
// 상수선언부분
//윈도우사이 크기.
private const C_WINDOWS_GAP:int       = 10;
//왼쪽 Menu 넓이
private const C_MENU_WIDTH:int        = 200;
//왼쪽 Menu 최소크기.
private const C_MENU_MINWIDTH:int     = 0;
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
//메인화면 속성 지정
//윈도우사이 크기.
private var int_windows_gap:int       = 10;
//왼쪽 Menu 넓이
private var int_Menu_width:int        = 200;
//왼쪽 Menu 최소크기.
private var int_Menu_MinWidth:int     = 0;

//창을 닫을때 다시한번 확인할 것인지 여부.
public var isWindowCloseConfirm:Boolean = false;

//삭제시 삭제여부를 확인 할지.
public var isDeleteQuestion:Boolean = true;

//삭제이후에 저장여부.
public var isDeleteAfterSave:Boolean = true;
//------------------------------------------------------------------------------

/**
 * Application초기화 function
 */
private function _initApp():void{
  
  //모든버튼 비활성화 처리합니다
  disableTopButtons();
  this.addEventListener(ResizeEvent.RESIZE, resizeHandle);
  this.focusManager.activate();
  
  //Browser이 focus를 주도록 합니다.
  //setBrowserFocus();
  
  //출력물 초기화
  //initPopBtnPrint();
  
  //FileReference초기화
  //initFileRef();
  
  //로그인창 호출
  loginPopup();
  
  //Browser Focus처리
  flash.external.ExternalInterface.call("setBrowserFocus");
}

/**
 * Resize Handle - 로그인창을 중앙으로 오도록 처리합니다.
 */
private function resizeHandle(event:ResizeEvent):void{
  //항상 Login창이 중앙에 오도록 합니다.
  if(Session.G_USER_ID==null && popupWindowLogin!=null){
    PopUpManager.centerPopUp(popupWindowLogin);
  }
}


//------------------------------------------------------------------------------
// Button 호출 부분 - 시작
/**
 * 조회
 */
public function clickBtnInquiry(event:Event=null):void{
}

/**
 * 신규
 */
public function clickBtnNew(event:Event=null):void{
}

/**
 * 저장
 */
public function clickBtnSave(event:Event=null):void{
}

/**
 * 취소
 */
public function clickBtnCancel(event:Event=null):void{
}

/**
 * 삭제
 */
public function clickBtnDelete(event:Event=null):void{
}

/**
 * 메뉴 활성화/비활성화
 */
public function clickMenu(event:Event=null):void{
  if(leftMenu.width==C_MENU_MINWIDTH)
    leftMenu.width = C_MENU_WIDTH;
  else
    leftMenu.width = C_MENU_MINWIDTH;
}

//Excel Export시 파일명.
public var excelExportName:String = null;

/**
 * 엑셀저장하기
 */
public function clickExcelExport(event:Event=null):void{
}

/**
 * 창닫기
 * @param event Event
 */
private function clickClose(event:Event=null):void{
}
// Button 호출 부분 - 종료
//------------------------------------------------------------------------------

public var isPopupBtnHide:Boolean = false;
/**
 * 메뉴를 숨길때 처리 Function
 * @param event Event
 */
public function popBtnPrintClose(event:Event=null):void{
  if(isPopupBtnHide){
    //initPopBtnPrint();
    isPopupBtnHide = false;
  }
}


private var _printMenu:Menu = new Menu();
/**
 * 상단 출력버튼 Menu
 */
[Bindable]
public function set printMenu(value:Menu):void{
  _printMenu = value;
  //_printMenu.addEventListener(MenuEvent.ITEM_CLICK, popBtnPrintItemClick);
}
public function get printMenu():Menu{
  return _printMenu;
}


//------------------------------------------------------------------------------
// 로그인 관련 - 시작
//Login Window Object
private var popupWindowLogin:Login = null;

/**
 * 로그인창을 뛰우기
 * @param userId   사용자아이디
 * @param userPwd  사용자암호
 */
public function loginPopup(userId:String=null, userPwd:String=null):void{
  popupWindowLogin    = new Login();
  PopUpManager.addPopUp(popupWindowLogin      ,this   ,true);
  PopUpManager.centerPopUp(popupWindowLogin);
}

/**
 * 로그인 정상처리 이후
 */
public function initLoginAfter():void {
  popupWindowLogin.removeAllChildren();
  PopUpManager.removePopUp(popupWindowLogin);
  popupWindowLogin = null;
  
  //메뉴를 보이게 한다
  checkMenuWide(ConstClass.CONST_N);
  
  //PDF한번 호출하기
  initPDF();
}

/**
 * 메뉴크기변경 여부변경여부.
 */
private var isMenuWidthChanged:Boolean = false;

/**
 * restore이후에 최대화 하기 여부.
 */
private var isWindowRestoreAfterMaximized:Boolean = false;
/**
 * 메뉴를 비화성화 비활성화 하는 로직(프로그램호출시)
 */
private function checkMenuWide(strWide_yn:String):void{
  //trace("[checkMenuWide start] strWide_yn="+strWide_yn);
  if(strWide_yn==ConstClass.CONST_Y){
    isMenuWidthChanged = leftMenu.width!=int_Menu_MinWidth;
    if(isMenuWidthChanged) {
      leftMenu.width=int_Menu_MinWidth;
    }
  }else{
    isMenuWidthChanged = leftMenu.width!=int_Menu_width;
    if(isMenuWidthChanged) {
      leftMenu.width=int_Menu_width;
    }
  }
  //trace("[checkMenuWide end]");
}
// 로그인 관련 - 종료
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// 권한 체크부분 - 시작
/**
 * 권한 체크 로직 구현
 */
private function checkPermissions():void{
  /*
  //ExcelButton 초기화
  btnExcel.enabled  = false;
  //if(win==null || win.loader.getChildAt(0)==null || win.program_div==ConstClass.PROGRAM_DIV_MENU)
  if(win==null || win.loader.getElementAt(0)==null || win.program_div==ConstClass.PROGRAM_DIV_MENU)
    return;
  
  btnExcel.enabled  = true;
  //0. 기본적으로 조회 버튼은 활성화 시킴.
  enabledInquiry  = true;
  
  //1. 저장 권한 (저장, 취소, 신규 버튼 활성화)
  var bExe_level1:Boolean = win.exe_level1==ConstClass.CONST_Y;
  enabledSave   = bExe_level1;
  enabledCancel = bExe_level1;
  enabledNew    = bExe_level1;
  
  //2. 삭제권한 (삭제버튼 활성화)
  var bExe_level2:Boolean = win.exe_level2==ConstClass.CONST_Y;
  enabledDelete = bExe_level2;
  
  //3. 최종적으로 프로그램별 설정된 권한조정이 있다면 처리하도록 합니다.
  //AsetecSubMainModule(win.loader.child)._initPermissions();
  //AsetecSubMainModule(win.loader.getChildAt(0))._initPermissions();
  AsetecSubMainModule(win.loader.getElementAt(0))._initPermissions();
  */
}

/**
 * 조회버튼 권한
 */
public function set enabledInquiry(value:Boolean):void{
  btnInquiry.enabled = value;
}
public function get enabledInquiry():Boolean{
  return btnInquiry.enabled;
}

/**
 * 신규버튼 권한
 */
public function set enabledNew(value:Boolean):void{
  btnNew.enabled = value;
}
public function get enabledNew():Boolean{
  return btnNew.enabled;
}

/**
 * 저장버튼 권한
 */
public function set enabledSave(value:Boolean):void{
  btnSave.enabled = value;
}
public function get enabledSave():Boolean{
  return btnSave.enabled;
}

/**
 * 취소버튼 권한
 */
public function set enabledCancel(value:Boolean):void{
  btnCancel.enabled = value;
}
public function get enabledCancel():Boolean{
  return btnCancel.enabled;
}

/**
 * 삭제버튼 권한
 */
public function set enabledDelete(value:Boolean):void{
  btnDelete.enabled = value;
}
public function get enabledDelete():Boolean{
  return btnDelete.enabled;
}

/**
 * 엑셀버튼 권한
 */
public function set enabledExcel(value:Boolean):void{
  btnExcel.enabled = value;
}
public function get enabledExcel():Boolean{
  return btnExcel.enabled;
}

/**
 * 모든 버튼 비활성화하기.
 */
private function disableTopButtons():void{
  //모든버튼 비활성화 처리합니다
  enabledCancel   = false;
  enabledDelete   = false;
  enabledExcel    = false;
  enabledInquiry  = false;
  enabledNew      = false;
  enabledSave     = false;
}
// 권한 체크부분 - 종료
//------------------------------------------------------------------------------

/**
 * PDF초기화
 */
private function initPDF():void {
  var asetecPrint:AsetecPrint = new AsetecPrint();
  asetecPrint.reportDoc     = "emputy_report";
  asetecPrint.isSilentPrint = ConstClass.CONST_Y;
  asetecPrint.callPrint();
  asetecPrint               = null;
}
