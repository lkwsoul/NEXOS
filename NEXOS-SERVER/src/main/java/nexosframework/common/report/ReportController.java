package nexosframework.common.report;

import javax.servlet.http.HttpServletRequest;

//import net.sf.jasperreports.engine.JRDataSource;
import nexosframework.common.SessionNames;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * <p>기본 Report Controller</p>
 * <p>Description: 리포트에서 사용할 컨트롤러</p>
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
@Controller
public class ReportController {
	
	private final Logger logger = LoggerFactory.getLogger(ReportController.class);
	
	private final String PRE_FIX = "jp.";
	
	private final String EMPUTY_REPORT = "emputy_report";
	
	//추후 DB적용해서 작성 예정임
	//private JRDataSource jrDataSource;
	
	public ReportController() throws Exception {
	  
	}
	
	/**
	 * 리포트 기본 호출에 대한 컨트롤러(GET)
	 * @param request
	 * @param model
	 * @return 호출될 Bean ID(jasperreport-views.propertis에 등록된 Bean호출)
	 */
	@RequestMapping(value="/report", method=RequestMethod.GET)
	public String showReportGet(HttpServletRequest request, Model model){
    String strReturn = "";
    try{
      strReturn = showReport(request);
      model.addAttribute("format" , "pdf");
      //model.addAttribute("datasource", jrDataSource);
    }catch(Exception e){
      logger.error(e.getMessage());
    }
    
    return strReturn;
  }
	
	/**
   * 리포트 기본 호출에 대한 컨트롤러(GET)
   * @param request
   * @param model
   * @return 호출될 Bean ID(jasperreport-views.propertis에 등록된 Bean호출)
   */
	@RequestMapping(value="/report", method=RequestMethod.POST)
	public String showReportPost(HttpServletRequest request, Model model){
	  String strReturn = "";
	  try{
	    strReturn = showReport(request);
      model.addAttribute("format" , "pdf");
      //model.addAttribute("datasource", jrDataSource);
    }catch(Exception e){
      logger.error(e.getMessage());
    }
	  
	  return strReturn;
	}
	
	
	/**
	 * 리포트 기본 호출에 대한 공통 처리 로직
	 * (PRE_FIX문자열과 호출한 리포트 파일명과 결합하여 문자열을 되돌려 준다)
	 * @param request
	 * @return
	 * @throws Exception
	 */
	private String showReport(HttpServletRequest request) throws Exception {
	  String reportFileName = "";
	  try{
	    reportFileName = request.getParameter(SessionNames.REPORT_FILENAME);
    }catch(Exception e){
      logger.error(e.getMessage());
      throw e;
    }
	  if(reportFileName==null || "".equals(reportFileName)){
	    reportFileName = EMPUTY_REPORT;
	  }
	  return PRE_FIX + reportFileName;
	}
}
