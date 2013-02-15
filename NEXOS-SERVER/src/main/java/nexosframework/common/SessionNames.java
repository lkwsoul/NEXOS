package nexosframework.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import flex.messaging.FlexContext;
import flex.messaging.FlexSession;

//import com.asetec.struts.action.LoginAction;

/**
 * <p>SessionNames Class.</p>
 * <p>Description: Request Session를 관리하기 위한 Session 변수명 List를 여기서 관리합니다.</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 2.2<br>
 * <p>
 * ---------------------------------------------------------------------------------------------------<br>
 *  Ver        	Date        Author           	Description<br>
 * ---------  	----------  ---------------  	------------------------------------------------------<br>
 *  1.0        	2006-11-20  Lee Kyung-woo     신규작성<br>
 * ----------  	----------  ---------------  	------------------------------------------------------<br>
 * </p>
 */
public class SessionNames {
	
	/**
	 * Log4j Object.
	 */
	private static Logger logger					                  = LoggerFactory.getLogger(SessionNames.class);
	
    /**
     * 현재 로그인한 사용자의 ID.
     */
    public static final String LOGIN_USER_ID 		          = "G_USER_ID";
    
    
    /**
     * 현재 로그인한 사용자의 사용자 명.
     */
    public static final String LOGIN_USER_NAME		        = "G_USER_NM";
    
    /**
     * 현재 로그인한 사용자의 암호.
     */
    public static final String LOGIN_USER_PASSWORD	      = "G_USER_PWD";
    
    /**
     * 현재 로그인한 사용자의 해당 CENTER_CD
     */
    public static final String LOGIN_USER_CENTER_CD	      = "G_CENTER_CD";
    
    /**
     * 현재 로그인한 사용자의 CENTER_NM
     */
    public static final String LOGIN_USER_CENTER_NM	      = "G_CENTER_NM";
    
    /**
     * 현재 로그인한 사용자의 위탁사 코드
     */
    public static final String LOGIN_USER_CUST_CD	        = "G_CUST_CD";
    
    /**
     * 현재 로그인한 사용자의 위탁사 명.
     */
    public static final String LOGIN_USER_CUST_NM	        = "G_CUST_NM";
    
    /**
     * 현재 로그인한 사용자의 부서코드.
     */
    public static final String LOGIN_USER_DEPT_CD	        = "G_DEPT_CD";
    
    /**
     * 현재 로그인한 사용자의 부서명.
     */
    public static final String LOGIN_USER_DEPT_NM	        = "G_DEPT_NM";
    
    /**
     * 현재 로그인한 사용자의 FACT_CD
     */
    public static final String LOGIN_USER_FACT_CD	        = "G_FACT_CD";
    
    /**
     * 현재 로그인한 사용자의 FACT_NM
     */
    public static final String LOGIN_USER_FACT_NM	        = "G_FACT_NM";
    
    /**
     * 현재 로그인한 사용자의 BRAND_CD
     */
    public static final String LOGIN_USER_BRAND_CD	      = "G_BRAND_CD";
    
    /**
     * 현재 로그인한 사용자의 BRAND_NM
     */
    public static final String LOGIN_USER_BRAND_NM	      = "G_BRAND_NM";
    
    /**
     * 현재 로그인한 사용자의 BRAND 화면유형.
     */
    public static final String LOGIN_USER_BRAND_DISPLAY_DIV= "G_BRAND_DISPLAY_DIV";
    
    /**
     * 프로그램 권한 1 (저장권한)
     */
    public static final String EXE_LEVEL1			            = "G_EXE_LEVEL1";
    
    /**
     * 프로그램 권한 2 (삭제권한)
     */
    public static final String EXE_LEVEL2			            = "G_EXE_LEVEL2";
    
    /**
     * 프로그램 권한 3 (특수권한1)
     */
    public static final String EXE_LEVEL3			            = "G_EXE_LEVEL3";
    
    /**
     * 프로그램 권한 4 (특수권한2)
     */
    public static final String EXE_LEVEL4			            = "G_EXE_LEVEL4";
    
    /**
     * 팝업공지 존재여부
     */
    public static final String EXIST_NOTICE               = "G_EXIST_NOTICE";
    
    /**
     * REPORT FILE NAME
     */
    public static final String REPORT_FILENAME            = "reportFileName";
    
    /**
     * Report Query의 Parameter Header.
     */
    public static final String REPORT_PARAMETER           = "__P_";
    
    /**
     * Report Query의 Replace Parameter(Query의 특정 부분을 replace 함).
     */
    public static final String REPORT_PARAMETER_REPLACE   = "_R";
    
    /**
     * Report Parameter중 Silent Print Parameter Name.
     */
    public static final String REPORT_SILENT_PRINT        = "_SP";
    
    /**
     * Report Parameter중 자동출력 중지여부.
     */
    public static final String REPORT_STOP_PRINT          = "_ST";
    
    /**
     * Report Parameter중 사용할 프린트
     * PRINT_LABEL_IN      : 입고 라벨 프린트
     * PRINT_BILL_IN       : 입고 전표 프린트
     * PRINT_LABEL_OUT     : 출고 라벨 프린트
     * PRINT_BILL_OUT      : 출고 전표 프린트
     */
    public static final String REPORT_PRINTER_NAME        = "_PN";
    
    /**
     * 출력매수.
     */
    public static final String REPORT_PRINT_COUNT         = "_PC";
    
    /**
     * 출력을 위한 선택한 값
     */
    public static final String REPORT_CHECKED_VALUE       = "_CH";
    
    /**
     * 리포트내부 쿼리사용여부
     */
    public static final String REPORT_OWN_QUERY           = "_OW";
    
    /**
     * 현재 로그한 사용자의 종료<br>
     * <font color="red">SEDEX에서 3개 Container처리를 위해서 사용함.</font><br>
     * 1 =  3PL<br>
     * 2 =	차량관리<br>
     * 3 = 	경영정보
     */
    public static final String SESSION_TYPE			          = "SESSION_TYPE";
    
    /**
     * 사용자별 LANGUAGE<br>
     * DB의 
     */
    public static final String SYS_LANG 			            = "SYS_LANG";
    
    /**
     * 사용자 인증구분
     */
    public static final String CERTIFY_DIV                = "G_CERTIFY_DIV";
    
    /**
     * 운송사
     */
    public static final String REF_CUST_CD                = "G_REF_CUST_CD";
    public static final String REF_CUST_NM                = "G_REF_CUST_NM";
    
    /**
     * 라벨사업부코드
     */
    public static final String L_STORER                   = "G_L_STORER";
    
    //------------------------------------------------------------------------------------------------
    // 프린트 정보
    /**
     * 입고 라벨 프린트.
     */
    public static final String PRINT_LABEL_IN             = "G_PRINT_LABEL_IN";
    
    /**
     * 입고 전표 프린트 
     */
    public static final String PRINT_BILL_IN              = "G_PRINT_BILL_IN";
    
    /**
     * 출고 라벨 프린트.
     */
    public static final String PRINT_LABEL_OUT            = "G_PRINT_LABEL_OUT";
    
    /**
     * 출고 전표 프린트 
     */
    public static final String PRINT_BILL_OUT             = "G_PRINT_BILL_OUT";
    
    //------------------------------------------------------------------------------------------------
    
    /**
     * 프로젝트ID
     */
    public static final String PROJECT_ID               = "G_PROJECT_ID";
    
    /**
     * View Root
     */
    public static final String VIEW_ROOT                = "G_VIEW_ROOT";
    
    /**
     * 현재 활당된 Session을 삭제합니다.
     * @param request
     */
    @SuppressWarnings("rawtypes")
    public static void removeSession(HttpServletRequest request) {
    	try{
    	  if(request==null){
    	    logger.debug("HttpServletRequest is null");
    	    return;
    	  }
	    	HttpSession session = request.getSession();
	    	java.util.Enumeration en = session.getAttributeNames();
	    	while( en.hasMoreElements() ){
	    	  session.removeAttribute( (String)en.nextElement() );
	    	}
    	}catch (Exception e){
    		logger.error(e.getMessage());
    		throw new RuntimeException(e.getMessage());
    	}
    }
    
    /**
     * 헌재 활당된 Session을 삭제합니다.
     */
    @SuppressWarnings("rawtypes")
    public static void removeFlexSession() {
      try{
        FlexSession flexSession      = FlexContext.getFlexSession();
        if(flexSession==null) {
          logger.debug(" Flex session is null");
          return;
        }
        java.util.Enumeration enFlex = flexSession.getAttributeNames();
        while( enFlex.hasMoreElements() ){
          flexSession.removeAttribute( (String)enFlex.nextElement() );
        }
      }catch (Exception e){
        logger.error(e.getMessage());
        throw new RuntimeException(e.getMessage());
      }  
    }
}
