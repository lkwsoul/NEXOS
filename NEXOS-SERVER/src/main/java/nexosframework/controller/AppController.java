package nexosframework.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * <p>기본 appServlet Controller</p>
 * <p>Description: 현재 플렉스버전이아니라 웹버전으로 구현시 사용할 컨트롤러</p>
 * <p>Copyright: Copyright (c) 2012</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br>
 * ---------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 *  1.0         2012-11-10  이경우     신규작성<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 */
@Controller
public class AppController {
	
	private final Logger logger = LoggerFactory.getLogger(AppController.class);
	
	/**
	 * 기본 /appServlet에 대한 ReqeustMapping처리 메소드
	 * @param locale
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/appServlet", method=RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! the client locale is "+ locale.toString());
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("outputString", "테스트 페이지 입니다." );
		
		return "home";
	}
}
