package nexosframework.service.wc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import nexosframework.common.SessionNames;
import nexosframework.common.Util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Repository;

import flex.messaging.FlexContext;
import flex.messaging.FlexSession;

@Repository("wcsession")
public class WCSessionImpl implements WCSession {
  
  private final Logger logger = LoggerFactory.getLogger(WCSessionImpl.class);

  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCSession#authenticatePrincipal(org.springframework.context.ApplicationContext, java.lang.String, java.lang.String)
   */
  @Override
  public void authenticatePrincipal(ApplicationContext appContext, String username, String password) {
    logger.info("[authenticatePrincipal START ##################################]");
    try{
      AuthenticationManager manager = (AuthenticationManager)appContext.getBean("authenticationManager");
      UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken = new UsernamePasswordAuthenticationToken(username,password);
      Authentication authentication                                           = manager.authenticate(usernamePasswordAuthenticationToken);
      //초기화 후 지정
      SecurityContextHolder.clearContext();
      SecurityContextHolder.getContext().setAuthentication(authentication);
      String name = SecurityContextHolder.getContext().getAuthentication().getName();
      logger.info("Authentication Name = " + name);
      logger.info("Authentications     = " + authentication.getAuthorities());
    }catch(Exception e){
      logger.error(e.getMessage());
      throw new RuntimeException("보안 승인중 오류가 발생하였습니다.");
    }finally{
      logger.info("[authenticatePrincipal END  ##################################]");  
    }
  }
  
  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCSession#unAuthenticatePrincipal()
   */
  @Override
  public void unAuthenticatePrincipal() {
    logger.info("[unAuthenticatePrincipal START ##################################]");
    try{
      String name = SecurityContextHolder.getContext().getAuthentication().getName();
      logger.info("Unauthentication Name = " + name);
      SecurityContextHolder.clearContext();
    }catch(Exception e){
      logger.error(e.getMessage());
      throw new RuntimeException(e.getMessage());
    }finally{
      logger.info("[unAuthenticatePrincipal END   ##################################]");  
    }
  }
  
  /* (non-Javadoc)
   * @see nexosframework.service.wc.WCSession#mappingSession(nexosframework.service.wc.WCDAO, java.util.List)
   */
  @Override
  @SuppressWarnings({ "unchecked", "rawtypes" })
  @Secured("ROLE_USER")
  public List mappingSession(WCDAO wcdao, List list) {
    
    if(list==null)
      return null;
    
    if(list.size()==0)
      return null;
    
    Map<String,String> mapRow = (HashMap)list.get(0);
    FlexSession session = FlexContext.getFlexSession();
    
    if(session!=null) {    
      session.setAttribute(SessionNames.LOGIN_USER_ID                 ,mapRow.get("USER_ID")                                              );
      session.setAttribute(SessionNames.LOGIN_USER_NAME               ,mapRow.get("USER_NM")                                              );
      session.setAttribute(SessionNames.LOGIN_USER_PASSWORD           ,mapRow.get("USER_PWD")                                             );
      session.setAttribute(SessionNames.LOGIN_USER_CENTER_CD          ,mapRow.get("CENTER_CD")                                            );
      session.setAttribute(SessionNames.LOGIN_USER_CENTER_NM          ,mapRow.get("CENTER_NM")                                            );
      session.setAttribute(SessionNames.LOGIN_USER_BRAND_CD           ,mapRow.get("BRAND_CD")                                             );
      session.setAttribute(SessionNames.LOGIN_USER_BRAND_NM           ,mapRow.get("BRAND_NM")                                             );
      session.setAttribute(SessionNames.LOGIN_USER_BRAND_DISPLAY_DIV  ,mapRow.get("DISPLAY_DIV")                                          );
      session.setAttribute(SessionNames.LOGIN_USER_CUST_CD            ,mapRow.get("CUST_CD")                                              );
      session.setAttribute(SessionNames.LOGIN_USER_CUST_NM            ,mapRow.get("CUST_NM")                                              );
      session.setAttribute(SessionNames.EXIST_NOTICE                  ,mapRow.get("EXIST_NOTICE")                                         );
      
      //session.setAttribute(SessionNames.SYS_LANG                      ,Util.getNull( (String)mapRow.get("SYS_LANG"), SystemInfo.LANGUAGE) );
      session.setAttribute(SessionNames.SYS_LANG                      ,Util.getNull( (String)mapRow.get("SYS_LANG"),  "ko-KR"           ) );
      session.setAttribute(SessionNames.CERTIFY_DIV                   ,mapRow.get("CERTIFY_DIV")                                          );
      session.setAttribute(SessionNames.L_STORER                      ,mapRow.get("L_STORER")                                             );
      
  
      //기본 출력프린트 설정
      session.setAttribute(SessionNames.PRINT_LABEL_IN                 ,mapRow.get("PRINT_NM")                                             );
      session.setAttribute(SessionNames.PRINT_BILL_IN                  ,mapRow.get("PRINT_NM")                                             );
      session.setAttribute(SessionNames.PRINT_LABEL_OUT                ,mapRow.get("PRINT_NM")                                             );
      session.setAttribute(SessionNames.PRINT_BILL_OUT                 ,mapRow.get("PRINT_NM")                                             );
    }else{
      logger.debug("Flex Session is null");
    }
    
    //HttpSession 세팅
    HttpServletRequest request     = FlexContext.getHttpRequest();
    
    String remoteaddr = "localhost";
    String remoteUrl  = "/";
    String contextPath= "";
    if(request!=null) {
      HttpSession        httpSession = request.getSession();
      
      
      remoteaddr = request.getRemoteAddr();
      remoteUrl  = request.getRequestURL().toString().replaceAll(request.getRequestURI(), "");
      contextPath= httpSession.getServletContext().getRealPath("/");
      logger.debug("###############################################");
      logger.debug("remoteaddr="+remoteaddr);
      logger.debug("remoteUrl="+remoteUrl);
      logger.debug("contextPath="+contextPath);
      logger.debug("###############################################");
      
      
      httpSession.setAttribute(SessionNames.LOGIN_USER_ID                 ,mapRow.get("USER_ID")                                              );
      httpSession.setAttribute(SessionNames.LOGIN_USER_NAME               ,mapRow.get("USER_NM")                                              );
      httpSession.setAttribute(SessionNames.LOGIN_USER_PASSWORD           ,mapRow.get("USER_PWD")                                             );
      httpSession.setAttribute(SessionNames.LOGIN_USER_CENTER_CD          ,mapRow.get("CENTER_CD")                                            );
      httpSession.setAttribute(SessionNames.LOGIN_USER_CENTER_NM          ,mapRow.get("CENTER_NM")                                            );
      httpSession.setAttribute(SessionNames.LOGIN_USER_BRAND_CD           ,mapRow.get("BRAND_CD")                                             );
      httpSession.setAttribute(SessionNames.LOGIN_USER_BRAND_NM           ,mapRow.get("BRAND_NM")                                             );
      httpSession.setAttribute(SessionNames.LOGIN_USER_BRAND_DISPLAY_DIV  ,mapRow.get("DISPLAY_DIV")                                          );
      httpSession.setAttribute(SessionNames.LOGIN_USER_CUST_CD            ,mapRow.get("CUST_CD")                                              );
      httpSession.setAttribute(SessionNames.LOGIN_USER_CUST_NM            ,mapRow.get("CUST_NM")                                              );
      httpSession.setAttribute(SessionNames.EXIST_NOTICE                  ,mapRow.get("EXIST_NOTICE")                                         );
      
      //httpSession.setAttribute(SessionNames.SYS_LANG                      ,Util.getNull( (String)mapRow.get("SYS_LANG"), SystemInfo.LANGUAGE) );
      httpSession.setAttribute(SessionNames.SYS_LANG                      ,Util.getNull( (String)mapRow.get("SYS_LANG"),  "ko-KR"           ) );
      httpSession.setAttribute(SessionNames.CERTIFY_DIV                   ,mapRow.get("CERTIFY_DIV")                                          );
      httpSession.setAttribute(SessionNames.L_STORER                      ,mapRow.get("L_STORER")                                             );
      
  
      //기본 출력프린트 설정
      httpSession.setAttribute(SessionNames.PRINT_LABEL_IN                 ,mapRow.get("PRINT_NM")                                             );
      httpSession.setAttribute(SessionNames.PRINT_BILL_IN                  ,mapRow.get("PRINT_NM")                                             );
      httpSession.setAttribute(SessionNames.PRINT_LABEL_OUT                ,mapRow.get("PRINT_NM")                                             );
      httpSession.setAttribute(SessionNames.PRINT_BILL_OUT                 ,mapRow.get("PRINT_NM")                                             );
    }else{
      logger.debug("Reqeust is null");
    }
    
    //로그인 기록 처리히기
    wcdao.updateLoginInfo(mapRow.get("USER_ID"), remoteaddr, mapRow.get("USER_ID"));
    
    Map mapSession = null;
    //Session 값을 되돌려 줍니다.
    if(session==null) {
      logger.debug("Flex Session is null. Session Values return.");
      //테스트에서 사용하기 위한 처리
      mapSession        = new HashMap<String, String>();
      mapSession.put(SessionNames.LOGIN_USER_ID                    , mapRow.get("USER_ID") );
      mapSession.put(SessionNames.LOGIN_USER_NAME                  , mapRow.get("USER_NM") );
      mapSession.put(SessionNames.LOGIN_USER_PASSWORD              , mapRow.get("USER_PWD") );
      mapSession.put(SessionNames.LOGIN_USER_CENTER_CD             , mapRow.get("CENTER_CD") );
      mapSession.put(SessionNames.LOGIN_USER_CENTER_NM             , mapRow.get("CENTER_NM") );
      mapSession.put(SessionNames.LOGIN_USER_BRAND_CD              , mapRow.get("BRAND_CD") );
      mapSession.put(SessionNames.LOGIN_USER_BRAND_NM              , mapRow.get("BRAND_NM") );
      mapSession.put(SessionNames.LOGIN_USER_BRAND_DISPLAY_DIV     , mapRow.get("DISPLAY_DIV") );
      mapSession.put(SessionNames.LOGIN_USER_CUST_CD               , mapRow.get("CUST_CD") );
      mapSession.put(SessionNames.LOGIN_USER_CUST_NM               , mapRow.get("CUST_NM") );
      mapSession.put(SessionNames.SYS_LANG                         , Util.getNull( (String)mapRow.get("SYS_LANG"),  "ko-KR"           ) );
      mapSession.put(SessionNames.CERTIFY_DIV                      , mapRow.get("CERTIFY_DIV") );
      mapSession.put(SessionNames.L_STORER                         , mapRow.get("L_STORER") );
      mapSession.put(SessionNames.PRINT_LABEL_IN                   , mapRow.get("PRINT_NM") );
      mapSession.put(SessionNames.PRINT_BILL_IN                    , mapRow.get("PRINT_NM") );
      mapSession.put(SessionNames.PRINT_LABEL_OUT                  , mapRow.get("PRINT_NM") );
      mapSession.put(SessionNames.PRINT_BILL_OUT                   , mapRow.get("PRINT_NM") );
    }else{
      java.util.Enumeration enSession = session.getAttributeNames();
      mapSession            = new HashMap<String, String>();
      String strSessionName = "";
      while( enSession.hasMoreElements() ){
        strSessionName = (String)enSession.nextElement();
        mapSession.put(strSessionName, session.getAttribute(strSessionName));
      }
    }
    List listRetrun = new ArrayList();
    listRetrun.add(mapSession);
    return listRetrun;
  }
}
