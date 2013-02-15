package nexosframework.service.wc;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.security.access.annotation.Secured;

public interface WCSession {

  /**
   * 스프링보안처리하기
   * @param username    아이디
   * @param password    암호
   * @throws Exception
   */
  void authenticatePrincipal(ApplicationContext appContext, String username, String password);

  /**
   * 스프링 보안해지하기
   * @throws Exception
   */
  void unAuthenticatePrincipal();

  /**
   * Session 세팅
   * @param list
   */
  @Secured("ROLE_USER")
  List mappingSession(WCDAO wcdao, List list);

}