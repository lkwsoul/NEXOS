package nexosframework.service.wc;

import java.util.List;
import java.util.Map;

public interface WCMenu {

  /**
   * 프로그램 메뉴데이터를 생성하는 Method.
   * @param rsdcReturn : 메뉴데이터
   * @return String : XML메뉴데이터.
   * @throws Exception
   */
  String makeMenuXMLString(List list, boolean isTopGrop);

  /**
   * 현재 메뉴의 Setp 구하기.
   * @param db
   * @return int : setp 1,2,3,4 단계 순을 구합니다.
   */
  int getStep(Map<String, String> db);

  /**
   * DB상의 최고의 값을 1증가한 값을 찾아 옵니다.<br>
   * 즉 1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,... 식으로 증가하게 됩니다.
   * @param stMax String
   * @return String
   */
  String getNextmun(String stMax);

  /**
   * 프로그램 구분에 따른 Icon을 가져오는 Method.
   * @param strProgramDiv
   * @return
   */
  String getIcon(String strProgramDiv);

}