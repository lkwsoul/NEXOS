package nexosframework.service.wc;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import nexosframework.common.Util;

import org.springframework.stereotype.Repository;

/**
 * <p>WCMenu</p>
 * <p>Description: WCMenu - Menu관련 Class(처리로직 담당)</p>
 * <p>Copyright: Copyright (c) 2012</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br>
 * ---------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 *  1.0         2012-11-10  이경우            신규작성<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 */
@Repository("wcmenu") // 주입되는 Bean id 역활을 합니다. 구현 클라스에 따라서 이 부분을 주석처리합니다.
public class WCMenuImpl implements WCMenu {
  
  //private final Logger logger = LoggerFactory.getLogger(WCMenu.class);
  
  private final String ICON_DEFAULT = "leaf_icon";
  private final String ICON_SELECT  = "leaf_iconS";
  private final String ICON_ENTRY   = "leaf_iconE";
  private final String ICON_REPORT  = "leaf_iconR";
  
  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCMenu#makeMenuXMLString(java.util.List, boolean)
   */
  @Override
  @SuppressWarnings({ "rawtypes", "unchecked" })
  public String makeMenuXMLString(List list, boolean isTopGrop) {
    StringBuffer sbReturn   = new StringBuffer();
    Iterator iterator       = list.iterator();
    Map<String, String> db   = null;
      
    boolean   isMenuClose = true;
    int     intMenuCount= 0;
    int     intStep   = 0;
    int     intNowStep  = 0;
    int     intCloseTAG = 0;
      
    if(list==null || list.size()==0) {
      sbReturn.append("<node></node>");
      return sbReturn.toString();
    } else {
      sbReturn.append("<node>\n");
    }
    
    String      strProgramMenu  = "MENU";
    
    if(isTopGrop){
      sbReturn.append("<group")
                .append(" jobType=\"\"")
                .append(" label=\"").append(strProgramMenu).append("\"")
                .append(" url=\"\"")
                .append(" program_id=\"\"")
                .append(" program_nm=\"\"")
                .append(" program_div=\"\"")
                .append(" package_id=\"\"")
                .append(" wide_yn=\"\"")
                .append(" grp_1=\"\"")
                .append(" grp_2=\"\"")
                .append(" grp_3=\"\"")
                .append(" grp_4=\"\"")
                .append(">\n");
    }

    String strBeforProgramDiv="";
    
    int intTmep=0;
    while(iterator.hasNext()){
      db = (HashMap)iterator.next();
      
      intNowStep      = this.getStep(db);
      //########################################################################
      // Menu닫기 logic추가.
    
      //현재 Step이 과거의 Step보다 작은경우 Closing처리합니다.
      //if(intNowStep<intStep && !isMenuClose){
      if(intNowStep<intStep){
        intCloseTAG   = (intStep-intNowStep);
        
        //intNowStep 첫번째 Step이라면 모둗 닫도록 합니다.
        if(intNowStep==1 && intMenuCount>0 && intMenuCount>intCloseTAG){
          intTmep  = intMenuCount;
        }else{
          intTmep  = intCloseTAG;
        }
        
        for(int i=0;i<intTmep;i++){
          sbReturn.append("</group>\n");
          intMenuCount= intMenuCount-1;
        }
          
        if(intCloseTAG>0 && intMenuCount==0)
          isMenuClose = true;
      //연속되어 같은 Step의 menu일 경우 기존 Group을 닫도록 합니다.
      }else if( intNowStep==intStep && (db.get("PROGRAM_DIV").equals("M") && strBeforProgramDiv.equals("M")) ){
        sbReturn.append("</group>\n");
        intMenuCount= intMenuCount-1;
        
        if(intCloseTAG>0)
          isMenuClose = true;
      }
    //########################################################################
      
      if(db.get("PROGRAM_DIV").equals("M")){
        sbReturn.append("<group")
        .append(" jobType=\"\"")
        .append(" label=\"").append(db.get("PROGRAM_NM")).append("\"")
        .append(" url=\"").append(Util.getNull(db.get("WEB_URL"))).append("\"")
        .append(" program_id=\"").append(Util.getNull(db.get("PROGRAM_ID"))).append("\"")
        .append(" program_nm=\"").append(db.get("PROGRAM_NM")).append("\"")
        .append(" program_div=\"").append(db.get("PROGRAM_DIV")).append("\"")
        .append(" package_id=\"").append(db.get("PACKAGE_ID")).append("\"")
        .append(" wide_yn=\"").append(db.get("WIDE_YN")).append("\"")
        .append(" grp_1=\"").append(db.get("GRP_1")).append("\"")
        .append(" grp_2=\"").append(db.get("GRP_2")).append("\"")
        .append(" grp_3=\"").append(db.get("GRP_3")).append("\"")
        .append(" grp_4=\"").append(db.get("GRP_4")).append("\"");
        if(!isTopGrop){
          sbReturn.append(" exe_level1=\"").append(db.get("EXE_LEVEL1")).append("\"")
          .append(" exe_level2=\"").append(db.get("EXE_LEVEL2")).append("\"")
          .append(" exe_level3=\"").append(db.get("EXE_LEVEL3")).append("\"")
          .append(" exe_level4=\"").append(db.get("EXE_LEVEL4")).append("\"");
        }
        sbReturn.append(">\n");
        intMenuCount++;
        
        isMenuClose     = false;
      }else{
        if(!isTopGrop){
          sbReturn.append("<item")
          .append(" jobType=\"\"")
          .append(" label=\"").append(db.get("PROGRAM_NM")).append("\"")
          //.append(" showInList=\"").append(Util.getNull(db.get("SHOWINLIST"))).append("\"")
          .append(" icon=\"").append(getIcon(""+db.get("PROGRAM_DIV"))).append("\"")
          .append(" url=\"").append(Util.getNull(db.get("WEB_URL"))).append("\"")
          .append(" program_id=\"").append(db.get("PROGRAM_ID")).append("\"")
          .append(" program_nm=\"").append(db.get("PROGRAM_NM")).append("\"")
          .append(" program_div=\"").append(db.get("PROGRAM_DIV")).append("\"")
          .append(" package_id=\"").append(Util.getNull(db.get("PACKAGE_ID"))).append("\"")
          .append(" wide_yn=\"").append(db.get("WIDE_YN")).append("\"")
          .append(" grp_1=\"").append(db.get("GRP_1")).append("\"")
          .append(" grp_2=\"").append(db.get("GRP_2")).append("\"")
          .append(" grp_3=\"").append(db.get("GRP_3")).append("\"")
          .append(" grp_4=\"").append(db.get("GRP_4")).append("\"")
          .append(" exe_level1=\"").append(db.get("EXE_LEVEL1")).append("\"")
          .append(" exe_level2=\"").append(db.get("EXE_LEVEL2")).append("\"")
          .append(" exe_level3=\"").append(db.get("EXE_LEVEL3")).append("\"")
          .append(" exe_level4=\"").append(db.get("EXE_LEVEL4")).append("\"")
          .append(" />\n");
        }else{
          //시스템관리의 프로그램 목록 tree데이터.
          sbReturn.append("<item")
          .append(" jobType=\"\"")
          .append(" label=\"").append(db.get("PROGRAM_NM")).append("\"")
          //.append(" showInList=\"").append(Util.getNull(db.get("SHOWINLIST"))).append("\"")
          .append(" icon=\"").append(ICON_DEFAULT).append("\"")
          .append(" url=\"").append(Util.getNull(db.get("WEB_URL"))).append("\"")
          .append(" program_id=\"").append(db.get("PROGRAM_ID")).append("\"")
          .append(" program_nm=\"").append(db.get("PROGRAM_NM")).append("\"")
          .append(" program_div=\"").append(db.get("PROGRAM_DIV")).append("\"")
          .append(" package_id=\"").append(Util.getNull(db.get("PACKAGE_ID"))).append("\"")
          .append(" wide_yn=\"").append(db.get("WIDE_YN")).append("\"")
          .append(" grp_1=\"").append(db.get("GRP_1")).append("\"")
          .append(" grp_2=\"").append(db.get("GRP_2")).append("\"")
          .append(" grp_3=\"").append(db.get("GRP_3")).append("\"")
          .append(" grp_4=\"").append(db.get("GRP_4")).append("\"")
          .append(" />\n");
        }
      }
        
      intStep = this.getStep(db);
      strBeforProgramDiv = (String)db.get("PROGRAM_DIV");
    }
    //기존 item TAG닫기.
    if(!isMenuClose){
      for(int i=0;i<intMenuCount;i++){
        sbReturn.append("</group>\n");
      }
      isMenuClose = true;
    }     
    
    if(isTopGrop)
      sbReturn.append("</group>\n");
    sbReturn.append("</node>");
      return sbReturn.toString();
  }
  
  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCMenu#getStep(java.util.Map)
   */
  @Override
  public int getStep(Map<String,String> db){
    int intStep = 0;
    int iGRP_1  = 0;
    int iGRP_2  = 0;
    int iGRP_3  = 0;
    int iGRP_4  = 0;
      
    //1. 숫자형으로 변환 합니다.
    iGRP_1 = (int) ((String)db.get("GRP_1")).charAt(0);
    iGRP_2 = (int) ((String)db.get("GRP_2")).charAt(0);
    iGRP_3 = (int) ((String)db.get("GRP_3")).charAt(0);
    iGRP_4 = (int) ((String)db.get("GRP_4")).charAt(0);
      
    if(iGRP_1==48)
      iGRP_1 = 0;
    if(iGRP_2==48)
      iGRP_2 = 0;
    if(iGRP_3==48)
      iGRP_3 = 0;
    if(iGRP_4==48)
      iGRP_4 = 0;

    if(( iGRP_2 + iGRP_3 + iGRP_4 ) == 0)
      intStep = 1;
    else if((iGRP_3 + iGRP_4) == 0)
      intStep = 2;
    else if(iGRP_4 == 0)
      intStep = 3;
    else if(iGRP_1 != 0)
      intStep = 4;
    else
      intStep = 0;
      
    return intStep;
  }
  
  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCMenu#getNextmun(java.lang.String)
   */
  @Override
  public String getNextmun(String stMax) {
    String stReturn = null;
    char[] chTemp = new char[1];
    //1. 숫자형으로 변환 합니다.
    int asc_value = (int) stMax.charAt(0);
    //2. ascii code가 57('9')이라면 65('A')를 변환해서 문자열로 변환해줍니다.
    if (asc_value == 57) {
        asc_value = 65;
    } else {
        //3. ascii code가 57('9')아니라면 +1해서 해당 값을 가지고 옵니다.
        asc_value++;
    }
    chTemp[0] = (char) asc_value;
    stReturn = new String(chTemp);
    return stReturn;
  }
  
  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCMenu#getIcon(java.lang.String)
   */
  @Override
  public String getIcon(String strProgramDiv){
    if(strProgramDiv==null || strProgramDiv.equals(""))
      return ICON_DEFAULT;
    
    String strReturn = ICON_DEFAULT;
    if("E".equals(strProgramDiv))
      strReturn =  ICON_ENTRY;
    else if("Q".equals(strProgramDiv))
      strReturn =  ICON_SELECT;
    else if("R".equals(strProgramDiv))
      strReturn =  ICON_REPORT;
    else
      strReturn =  ICON_DEFAULT;
    
    return strReturn;
  }
}
