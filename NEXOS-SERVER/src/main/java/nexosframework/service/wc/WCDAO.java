package nexosframework.service.wc;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

public interface WCDAO {

  /**
   * 로그인 처리하기
   * @param map  조회조건
   * @return
   * @throws Exception
   */
  List getLogin(Map<Object, Object> map);

  /**
   * 로그인 부가 정보가져오기
   * @param userId
   * @param clientIP
   * @return
   * @throws Exception
   */
  List getCSUserSysInfo(String userId, String clientIP);

  /**
   * 로그인 기록하기
   * @param userId
   * @param clientIP
   * @param regUserId
   * @throws Exception
   */
  @Transactional
  void updateLoginInfo(String userId, String clientIP, String regUserId);

  /**
   * 메뉴정보 가져오기
   * @param map 조회조건
   * @return
   * @throws Exception
   */
  List getMenu(Map<Object, Object> map);

}