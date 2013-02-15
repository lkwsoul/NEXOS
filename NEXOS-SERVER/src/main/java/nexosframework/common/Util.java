package nexosframework.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.GregorianCalendar;
import java.util.Hashtable;
import java.util.Locale;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.Vector;

/**
 * <p>Util</p>
 * <p>Description: 각종 Java Util 모음.</p>
 * <p>Copyright: Copyright (c) 2012</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br>
 * -------------------------------------------------------------------------------------------------<br>
 *  Ver        	Date        Author           	Description<br>
 * ---------  	----------  ---------------  	------------------------------------------------------<br>
 *  1.0        	2012-11-26  Lee Kyung-woo     신규작성<br>
 * ---------  	----------  ---------------  	------------------------------------------------------<br>
 */
public class Util {
  
  public static String DateFormat               = "yyyy-MM-dd";
  public static String DatetimeFormat           = "yyyy-MM-dd kk:mm:ss";
  public static String DateSeparatorChar        = "-";
  public static String DBDateFormat             = "'YYYY-MM-DD'";
  public static String DBDatetimeFormat         = "'YYYY-MM-DD HH24:MI:SS'";
  public static String DBDateSeparatorChar      = "'-'";
  
	
    /**
     * 입력값인 문자열이 null일 경우 ""을 리턴한다.
     * @param stText 체크할 문자열
     * @return String
     * @exception
     */
    public static String getNull(String stText) {
        try {
            if (stText == null) {
                return "";
            }else if(stText.equals("null")) {
                return "";
            }
            return stText.trim();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
    
    /**
     * 입력값이 null일 경우 ""을 리턴합니다.
     * @param objText 체크할 Object
     * @return
     */
    public static String getNull(Object objText) {
    	String 	strResultText 	= "";
    	String	stText			= "";
      try {
      	if (objText == null) {
          	return "";
          }
          stText				= ""+objText;
          if(stText.equals("null")) {
          	return "";
          }
          
          strResultText = stText.trim() ;
          return strResultText;
      } catch (Exception e) {
          e.printStackTrace();
          return "";
      }
    }
    
    
    /**
     * 입력값인 문자열이 null일 경우 stChangeValue 값으로 바꿔서 리턴한다.
     * @see getNull(String)
     * @param stText 체크할 문자열
     * @param stChangeValue null일때 되돌려 줄 문자값
     * @return String
     * @exception
     */
    public static String getNull(String stText,String stChangeValue) {
      try {
          if (stText == null) {
              return stChangeValue;
          }else if(stText.equals("")) {
          	return stChangeValue;
          }else if(stText.equals("null")) {
              return stChangeValue;
          }
          return stText.trim();
      } catch (Exception e) {
          e.printStackTrace();
          return "";
      }
    }
    
    /**
     * 입력값인 문자열이 null일 경우 stChangeValue 값으로 바꿔서 리턴한다.
     * @see getNull(String)
     * @param stText 체크할 문자열
     * @param stChangeValue null일때 되돌려 줄 문자값
     * @return String
     * @exception
     */
    public static String getNullNoneTrim(String stText,String stChangeValue) {
      try {
          if (stText == null) {
              return stChangeValue;
          }else if(stText.equals("")) {
            return stChangeValue;
          }else if(stText.equals("null")) {
              return stChangeValue;
          }
          
          return stText;
      } catch (Exception e) {
          e.printStackTrace();
          return "";
      }
    }
    
    /**
     * 입력값인 문자열이 null이거나 ""일 경우 "&nbsp;"을 리턴한다.
     * @param stText
     * @return String
     * @exception
     */
    public static String getNullHtmlSpace(String stText) {
        try {
            if (stText == null || stText.equals("")) {
                return "&nbsp;";
            }
            return stText.trim();
        } catch (Exception e) {
            e.printStackTrace();
            return "&nbsp;";
        }
    }
    
    /**
     * 입력값인 문자열이 null이거나 ""일 경우 " "을 리턴한다.
     * @param stText 변환할 문자열
     * @return String
     * @exception
     */
    public static String getNullSpace(String stText) {
      try {
        if (stText == null || stText.equals("")) {
            return " ";
        }
        return stText.trim();
      } catch (Exception e) {
        e.printStackTrace();
        return " ";
      }
    }
    
    /**
     * 입력값인 문자열이 null이거나 ""일 경우 1을 리턴한다.
     * @see getNullOne(String)
     * @param stText 변환할 문자열.
     * @return int
     * @exception
     */
    public static int getNullOne(String stText) {
      try {
        if (stText == null || stText.equals("")) {
          return 1;
        }
        return Integer.parseInt(stText);
      } catch (Exception e) {
        e.printStackTrace();
        return 1;
      }
    }
    
    /**
     * 입력값인 문자열이 null이거나 ""일 경우 BigDecimal 0을 리턴한다.
     * @see getNull(String)
     * @param stText 변환할 문자열 
     * @return String
     * @exception
     */
    public static BigDecimal getBigDecimalNull(String stText) {
      try {
        if (stText == null || stText.equals("")) {
          return new BigDecimal("0");
        }
        return new BigDecimal(stText.trim());
      } catch (Exception e) {
        e.printStackTrace();
        return new BigDecimal("0");
      }
    }
    
    /**
     * 입력값인 문자열을 Java Script의 alert창에 사용가능한 메시지로 변환한다.
     * @param stText 변환할 문자열
     * @return String
     * @exception
     */
    public static String getAlertMsg(String stText) {
        String stResult = getNull(stText);
        int inLen = stResult.length();
        StringBuffer sbufText = new StringBuffer();
        for (int i = 0; i < inLen; i++) {
            if (stResult.charAt(i) == '\n') {
                sbufText.append("\\n");
            } else if (stResult.charAt(i) == '"') {
                sbufText.append("'");
            } else {
                sbufText.append(stResult.charAt(i));
            }
        }
        stResult = sbufText.toString();
        return stResult;
    }
    
    /**
     * 입력값인 날짜를 해당 포맷으로 변환한다.<br>
     * String을 오라클에서 TO_DATE('2007-03-15 00:00','YYYY-MM-DD HH24:MI:SS') 형식으로 변환해서 사용하면 됩니다.<br>
     * @see getDate(String, String)
     * @param stDate 입력 날짜 문자열
     * @param stFormat 날짜 포맷 타입
     * @param stReturnFormat 되돌려 받을 날짜 타입.
     * @return 에러발생시 "0"을 return함.
     * @exception
     */
    public static String getDate(String stDate, String stFormat ,String stReturnFormat) throws Exception {
    	String strReturn	= "";
    	stFormat			= Util.getNull(stFormat);
    	stDate 				= Util.getNull(stDate);
    	
      stFormat = stFormat.replaceAll("Y", "y");
      stFormat = stFormat.replaceAll("D", "d");
      
      SimpleDateFormat formatter	 		= new SimpleDateFormat(stFormat,Locale.KOREA);
      SimpleDateFormat formatterReturn	= new SimpleDateFormat(stReturnFormat,Locale.KOREA);
      
      Date	date		= null;
      try{
      	date		= formatter.parse(stDate);
      	//strReturn	= date.toString();
      	strReturn   = formatterReturn.format(date);
      }catch(Exception e){
      	strReturn	= "0";
      	//1. 기본적인 우선날짜 변환
    		try{
    			//logger.info(com.asetec.common.GetMessageFromResource.getMessage("App.Log.L01001"));
    			//formatter	 		= new SimpleDateFormat(SystemInfo.DateFormat, Locale.KOREA);
    		  formatter     = new SimpleDateFormat(Util.DateFormat, Locale.KOREA);
      		date		= formatter.parse(stDate);
      		strReturn   = formatterReturn.format(date);
      	}catch(Exception ei){
      		//logger.error(ei.getMessage());
      	  
      	}
      	
      	if(strReturn.equals("-1")){
      		//logger.error("[날짜 형식에러발생하였습니다.]");
      		/*
      		try{
      			logger.error(com.asetec.common.GetMessageFromResource.getMessage("App.Log.L01002"));
      		}catch(Exception eGMFR){
      			logger.error(eGMFR.getMessage());
      		}
      		*/
      	  throw new Exception("[날짜 형식에러발생하였습니다.]");
      	}

      }
      
      //날짜중 년도
      String 	strYear = strReturn.substring(0, strReturn.indexOf( "-" ));
      
      int		intYear	=  Integer.parseInt(strYear);
      //int		MaxYear	=  Integer.parseInt(SystemInfo.Max_Year);
      //int		MinYear	=  Integer.parseInt(SystemInfo.Min_Year);
      int   MaxYear =  Integer.parseInt("9999");
      int   MinYear =  Integer.parseInt("1900");
      
      //년도 체크로직.
      if(MinYear>intYear)
      	strReturn	= "-1";
      if(MaxYear<intYear)
      	strReturn	= "-1";
      
      return strReturn;
    }
    
    /**
     * Date를 String을 변환합니다.
     * @param date 변환할 Date
     * @param strFromat Date format
     * @return
     */
    public static String getDate(Date date, String strFromat){
      if(date==null)
        return "";
      if(strFromat==null || strFromat.equals("")){
        //strFromat = SystemInfo.DateFormat;
        strFromat = Util.DateFormat;
      }
      
      SimpleDateFormat formatter =  new SimpleDateFormat(strFromat);
      return formatter.format(date);
    }
    
    /**
     * 특정 날짜 정보를 yyyy-MM-dd HH:mm:ss 형식으로 만듭니다.<br>
     * @param stDate		: 변환되기전 날짜데이터.
     * @param stFormat		: 변환할 날짜의 Format정보.
     * @return
     */
    public static String getDate(String stDate, String stFormat) throws Exception {
    	return Util.getDate(stDate,stFormat, Util.DatetimeFormat);
      /*
      if(stFormat==null || stFormat.equals(""))
        stFormat = "yyyy/MM/dd HH:mm:ss";
      return Util.getDate(stDate,stFormat,stFormat);
      */
    }
    
    /**
     * 오늘날짜를 SystemInfo.DateSeparatorChar으로 포맷하여 리턴한다
     * @return String
     * @exception
     */
    public static String getNowDate() {
      String date = getNowDate("yyyyMMdd");
      return date.substring(0, 4) + Util.DateSeparatorChar + date.substring(4, 6) + Util.DateSeparatorChar + date.substring(6, 8);
    }
    
    /**
     * 오늘날짜를 입력된 포맷으로 리턴한다
     * @param stFormat 날짜 포맷 타입
     * @return String
     * @exception
     */
    public static String getNowDate(String stFormat) {
      if (stFormat == null || stFormat.trim().equals("")) {
        stFormat = Util.DateFormat;
      }
      SimpleDateFormat formatter = new SimpleDateFormat(stFormat, Locale.KOREA);
      return formatter.format(new Date());
    }
    
    /**
     * 오늘 날짜와 시간초까지 모두 반환
     * @param stFormat 날짜 포맷 타입
     * @return String
     * @exception
     */
    public static String getNowDateTime() {
        String date = getNowDateTime("");
        return date;
    }
    
    /**
     * 오늘 날짜와 시간초까지 모두 반환
     * @param stFormat 날짜 포맷 타입
     * @return String
     * @exception
     */
    public static String getNowDateTime(String stFormat) {
      if (stFormat == null || stFormat.trim().equals("")) {
        stFormat = Util.DatetimeFormat;
      }
      SimpleDateFormat formatter = new SimpleDateFormat(stFormat, Locale.KOREA);
      return formatter.format(new Date());
    }
    
    /**
     * 년월일 구분자없이 입력된 날짜를 입력된 포맷으로 변환한다.
     * @param stDate 입력 날짜 문자열
     * @param stFormat 날짜 포맷 타입
     * @return String
     * @exception Exception
     */
    public static String getDateTime(String stDate, String stFormat) throws Exception {
      if (stFormat == null || stFormat.trim().equals("")) {
        stFormat = Util.DateFormat;
      }
      stDate = Util.getNull(stDate);
      if (stDate.equals("")) {
          return "";
      } else {
        if (stDate.length() != 8) {
          throw new Exception("일시를 8자리로 입력하세요.");
          //throw new Exception(com.asetec.common.GetMessageFromResource.getMessage("App.Log.L01003"));
        }
        return Util.getDate(stDate, stFormat);
      }
    }
    
    /**
     * 년월일 구분자없이 입력된 날짜를 입력된 포맷으로 변환한다.
     * @param stDate 입력 날짜 문자열
     * @return String
     * @exception Exception
     */
    public static String getDate(String stDate) throws Exception {
      if (stDate == null || stDate.trim().equals("")) {
          return "";
      } else {
        if (stDate.length() != 8) {
          throw new Exception("일시를 8자리로 입력하세요.");
        	//throw new Exception(com.asetec.common.GetMessageFromResource.getMessage("App.Log.L01003"));
        }
        return stDate.substring(0, 4) + Util.DateSeparatorChar + stDate.substring(4, 6) + Util.DateSeparatorChar + stDate.substring(6, 8);
      }
    }
    
    /**
     * Exception Message를 받아 오라클 에러메시지를 추출한다.
     * @param message : Exception Message
     * @return String
     * @exception
     */
    public static String substringMsg(String message) {
      if (message.indexOf("ORA-") == -1) {
        return "예외사항이 발생하였습니다.";
      	/*
        try{
      		return GetMessageFromResource.getMessage("App.Err.E02001");
      	}catch(Exception e){
      		return "appear Error.";
      	}
      	*/
      }
      String str = message.substring(message.indexOf("ORA-"));
      return str.substring(0, str.indexOf("\n"));
    }
    
    /**
     * Exception Message를 받아 클라이언트가 이해할 수 있는 에러메시지를 추출한다.
     * @param message : Exception Message
     * @return String
     * @exception
     */
    public static String showOraMessage(String s) {
      String suffix = "End  server side stack trace\n; nested exception is:";
      if (s == null) {
        return "보고 되지 않은 에러 입니다. 관리자에게 연락해 주세요";
      	/*
        try{
      		return GetMessageFromResource.getMessage("App.Err.E02002");
      	}catch(Exception e){
      		return "appear Error.";
      	}
      	*/
      }
      int lastIndex = s.lastIndexOf(suffix);
      return s.substring(suffix.length() + lastIndex).trim();
    }
    
    /**
     * 입력값인 문자열을 해당 구분자로 나누어 배열로 리턴한다.
     * @param stText : 입력 문자열
     * @param stToken : 구분자(ex: "/", "-", ",")
     * @return String[]
     * @exception
     */
    public static String[] getSplitString(String stText, String stToken) {
      Vector<String> vtText = new Vector<String>();
      int inLen = 0;
      if (stText != null && !stText.trim().equals("")) {
        StringTokenizer token = new StringTokenizer(stText, stToken);
        while (token.hasMoreTokens()) {
            vtText.add(token.nextToken());
        }
        inLen = vtText.size();
      }
      return (String[]) vtText.toArray(new String[inLen]);
    }
    
    /**
     * 입력값인 문자열을 해당 구분자로 나누어 String으로 리턴한다.
     * @param stText : 입력 문자열
     * @param stToken : 구분자(ex: "/", "-", ",")
     * @return String
     * @exception
     */
    public static String getSplitStr(String stText, String stToken) {
      StringBuffer sbReturn = new StringBuffer();
      if (stText != null && !stText.trim().equals("")) {
        StringTokenizer token = new StringTokenizer(stText, stToken);
        while (token.hasMoreTokens()) {
            sbReturn.append(token.nextToken());
        }
      }
      return sbReturn.toString();
    }
    
    /**
     * 입력값인 문자열을 화폐의 숫자타입으로 변환한다.
     * @param stText : 입력 문자열
     * @return String
     * @exception
     */
    public static String getToCommaInt(String stText) {
      if (stText == null || stText.trim().equals("")) {
        return "0";
      }
      String ch = "#,###,##0";
      DecimalFormat df = new DecimalFormat(ch);
      String stResult = df.format(Long.parseLong(stText));
      return stResult;
    }
    
    /**
     * 입력값인 문자열을 화폐의 숫자타입(소수점2자리 포함)으로 변환한다.
     * @param stText : 입력 문자열
     * @return String
     * @exception
     */
    public static String getToCommaDouble(String stText) {
      if (stText == null || stText.trim().equals("")) {
        return "0.00";
      }
      String ch = "#,###,##0.00";
      DecimalFormat df = new DecimalFormat(ch);
      String stResult = df.format(Double.parseDouble(stText));
      return stResult;
    }
    
    /**
     *  원하는 Decimal 포맷으로 변경
     *  @param stText : 입력 문자열
     *  @param sFormat : 포맷
     *  @return String
     *  @exception
     */
    public static String getToCommaDouble(String stText, String sFormat) {
      if (stText == null || stText.trim().equals("")) {
        return "0.00";
      }
      if (sFormat == null || sFormat.trim().equals("")) {
        sFormat = "##,###,###,###,###";
      }
      DecimalFormat df = new DecimalFormat(sFormat);
      String stResult = df.format(Double.parseDouble(stText));
      return stResult;
    }
    
    /**
     *  주어진 포맷으로 문자열의 포맷을 변형하여 반환
     *  @param stText : 입력 값
     *  @param sFormat : 원하는 포맷
     *  @return String
     *  @exception
     */
    public static String getAnyFormatString(String sSourceText, String sFormat) {
      char delim = '#';
      int size = sFormat.length();
      char c[] = new char[size];
      int index = -1;
      for (int i = 0; i < size; i++) {
        if (delim == sFormat.charAt(i)) {
          index += 1;
          c[i] = sSourceText.charAt(index);
        } else {
          c[i] = sFormat.charAt(i);
        }
      }
      sSourceText = new String(c);
      return sSourceText;
    }
    
    /**
     * 특정한 문자열로 체워넣는 문자열 변환.<br>
     * ex)  getAnyFormatString("33","0",5)<br>
     *      결과값 : 00033 <br>
     * @param sSourceText
     * @param sChnageChr
     * @param intTotalCount
     * @return
     */
    public static String getAnyFormatString(String sSourceText, String sChnageChr, int intTotalCount) {
  		int	intLength			= sSourceText.length();
  		StringBuffer			sb1 = new StringBuffer();
  		StringBuffer			sb2 = new StringBuffer();
  		for(int i=0;i<intTotalCount;i++){
  			if(i>=intLength){
  				sb1.append(sChnageChr);
  			}else{
  				sb2.append(sSourceText.charAt(i));
  			}
  		}
      return Util.getAnyFormatString(sSourceText, sb1.toString()+sb2.toString());
    }
    
    /**
     *  원하는원하는 달 간격을 참조, 주어진 달 간격 이전의 월 날짜를 스트링으로 반환
     *  @param stText : 입력 문자열
     *  @return String
     *  @exception
     */
    public static String getMonthPeriod(String todate, int period) {
      SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
      // 주어진 인텍스로 부터 parsing할 위치를 결정
      ParsePosition pos = new ParsePosition(0);
      Date date = formatter.parse(todate, pos);
      GregorianCalendar calendar = new GregorianCalendar();
      calendar.setTime(date);
      calendar.add(GregorianCalendar.MONTH, -period);
      String sResultDate = formatter.format(calendar.getTime());
      return sResultDate;
    }
    
    /**
     * 파일 삭제
     * @param  path : 생략할 파일의 경로
     * @param  name : 파일 이름
     * @return
     * @exception
     */
    public static boolean remove(String path, String name) {
      File file = new File(path + File.pathSeparator + name);
      return file.delete();
    }
    
    /**
     * 파일 생성을 위한 FileOutputStream 생성
     * @param  path : 생성할 파일의 경로
     * @param  name : 파일 이름
     * @return FileOutputStream
     * @exception IOException
     * @exception FileNotFoundException
     */
    public static FileOutputStream getFileTarget(String path, String name) throws FileNotFoundException, IOException {
      FileOutputStream fout = new FileOutputStream(getFile(path, name));
      return fout;
    }
    
    /**
     * 파일 생성을 위한 File 객체 생성
     * @param  path : 생성할 파일의 경로
     * @param  name : 파일 이름
     * @return File
     * @exception IOException
     */
    public static File getFile(String path, String name) throws IOException {
      return new File(path + File.separator + name);
    }
    
    /**
     * 중복되는 파일이 존재할 경우, rename 을 생성
     * @param  path : 생성할 파일의 경로
     * @param  name : 파일 이름
     * @return String
     * @exception IOException
     */
    public static String getRenamedFileName(String path, String name) throws IOException {
      File file = new File(path);
      if (file.isDirectory()) {
        String filesName[] = file.list();
        for (int i = 0; i < filesName.length; i++) {
          if (filesName[i].equals(name)) {
            name = setRenamedFileName(path, name);
            break;
          }
        }
      }
      return name;
    }
    
    /**
     * 중복되는 파일이 존재할 경우, rename 을 설정
     * @param  path : 생성할 파일의 경로
     * @param  name : 파일 이름
     * @return File
     * @exception IOException
     */
    public static String setRenamedFileName(String path, String name) throws IOException {
      File file = new File(path);
      int index = name.indexOf(".");
      String prefix = name.substring(0, index);
      String suffix = name.substring(index + 1);
      try {
          file = File.createTempFile(prefix, "." + suffix, file);
      } catch (java.lang.IllegalArgumentException e) {
          file = File.createTempFile(prefix + "tmp", "." + suffix, file);
      }
      return file.getName();
    }
    
    /**
     * 특정 Object를 IO를 통해서 파일로 만들기. 
     * @param path 생성할 경로
     * @param name 파일명
     * @param o 만들 Object
     * @throws IOException
     * @throws FileNotFoundException
     */
    public void writeObject(String path, String name, Object o) throws IOException, FileNotFoundException {
      FileOutputStream fout  = Util.getFileTarget(path, name);
      ObjectOutputStream out = new ObjectOutputStream(fout);
      out.writeObject(o);
      out.flush();
      out.close();
    }
    
    /**
     * 파일로 저장된 Object를 읽어오기.
     * @param path 파일경로
     * @param name 생선된 파일명
     * @return
     * @throws IOException
     * @throws FileNotFoundException
     * @throws ClassNotFoundException
     */
    public Object readObject(String path, String name) throws IOException, FileNotFoundException, ClassNotFoundException {
      FileInputStream fis = new FileInputStream(new File(path + File.separator + name));
      ObjectInputStream ois = new ObjectInputStream(fis);
      Object objReturn = ois.readObject();
      ois.close();
      return objReturn;
    }
    
    /**
     * 특정 경로의 파일명을 가져오기
     * @param path 경로
     * @param suffix 찾을 확장자
     * @return
     */
    public static String[] getFileNameList(String path, String suffix) {
      String arr[] = null;
      File file = new File(path);
      arr = file.list();
      arr = getFilteredFileList(arr, suffix);
      System.out.println("arr size : " + arr.length);
      return arr;
    }
    
    /**
     * 특정 경로의 파일명을 가져오기 (*.log파일만 가져옵니다.)
     * @param path 경로
     * @return
     */
    public static String[] getFileNameList(String path) {
      String arr[] = null;
      String suffix = "log";
      File file = new File(path);
      arr = file.list();
      arr = getFilteredFileList(arr, suffix);
      return arr;
    }
    
    /**
     * 파일명을 읽어 올때 특정 확정자에 해당하는 파일명만 가져오기.
     * @param arr 파일명이 포함된 문자 배열
     * @param suffix 확정
     * @return
     */
    public static String[] getFilteredFileList(String arr[], String suffix) {
      Vector<String> v = new Vector<String>();
      for (int i = 0; i < arr.length; i++) {
          int index = arr[i].indexOf(".");
          String _suffix = arr[i].substring(index + 1, arr[i].length());
          if (suffix.equals(_suffix)) {
              v.addElement(arr[i]);
          }
      }
      arr = new String[v.size()];
      v.copyInto(arr);
      return arr;
    }
    
    /**
     * 문자열 형태의 숫자에 +1 계산해서 문자열로 되돌려 줍니다.
     * @param sNum 문자열 숫자
     * @return +1 계산된 문자열
     */
    public static String getPlusOne(String sNum) throws Exception {
      int iValue = Integer.parseInt(sNum) + 1;
      if (iValue >= 100) {
          throw new Exception();
      }
      String s = null;
      if (iValue < 10) {
          s = "0" + iValue;
      } else {
          s = String.valueOf(iValue);
      }
      return s;
    }

    /**
     * 첨부 파일이 서버측에 업 로드된 시간 아래와 같은 형태로 변경하도록 합니다.<br>
     * sDate[1] + "년 " + sDate[2] + "월 " + sDate[3] + "일 " + sDate[4] + "시 " + sDate[5] + "분 " + sDate[6] + "초" 
     * @param sDate[]
     * @return
     * @throws Exception
     */
    public static String showUploadDate(String sDate[]) {
      String date = sDate[1] + "년 " + sDate[2] + "월 " + sDate[3] + "일 " +
                    sDate[4] + "시 " + sDate[5] + "분 " + sDate[6] + "초";
    	/*
      String date = "";
    	try{
    		date = sDate[1] + GetMessageFromResource.getMessage("App.Inf.I00001") 
                 + sDate[2] + GetMessageFromResource.getMessage("App.Inf.I00002")
   	             + sDate[3] + GetMessageFromResource.getMessage("App.Inf.I00003")
  	             + sDate[4] + GetMessageFromResource.getMessage("App.Inf.I00004")
  	             + sDate[5] + GetMessageFromResource.getMessage("App.Inf.I00005")
  	             + sDate[6] + GetMessageFromResource.getMessage("App.Inf.I00006");
    	}catch(Exception e){
    		date = "";
    	}
    	*/
      return date;
    }
    
    /**
     * String이 null이거나 ""일경우 0으로 변환
     * @param s 변환할 문자열
     * @return
     * @throws Exception
     */
    public static String getNullZero(String s) throws Exception {
      if (s == null || s.equals("")) {
          s = "0";
      }
      
      int intLenth = s.length()-2;
      
      if( s.indexOf(".0")>-1 && s.indexOf(".0")==intLenth){
       s = s.substring(0, intLenth); 
      }
      return s;
    }
    
    /**
     * Object가 null이거나 ""일 경우 0으로 변환
     * @param s 변환할 문자열
     * @return
     * @throws Exception
     */
    public static String getNullZero(Object s) throws Exception {
    	String strResultString = "";
    	if (s == null || "".equals(s)) {
      	strResultString = "0";
      } else {
          strResultString = s.toString();
      }
      return strResultString;
    }
    
    /**
     * String을 숫자형으로 변환합니다. 
     * @param s 변환할 문자열
     * @return
     * @throws Exception
     */
    public static int	getNullZeroInt(String s) throws Exception {
      if (s == null || s.equals("")) {
          s = "0";
      }
      return Integer.parseInt(s.trim());
    }
    
    /**
     * Tab을 기준으로 배열로 변환합니다.
     * @param s 변환할 문자열
     * @return
     */
    public static String[] getSplitString(String s) {
      Vector<String> v = new Vector<String>();
      int tab = (int) '\t';
      char c[] = new char[s.length()];
      for (int i = 0; i < c.length; i++) {
          c[i] = s.charAt(i);
      }
      int from = 0;
      for (int i = 0; i <= s.length(); i++) {
          if (i != s.length()) {
              int asc = (int) s.charAt(i);
              if (asc == tab) {
                  //System.out.println( new String(c, from, i - from) );
                  v.addElement(new String(c, from, i - from));
                  from = i + 1;
              }
          }
          if (i == s.length()) {
              v.addElement(new String(c, from, i - from));
              break;
          }
      }
      String spt[] = new String[v.size()];
      v.copyInto(spt);
      for (int i = 0; i < spt.length; i++) {
          if (spt[i].length() == 0) {
              spt[i] = "*";
          }
      }
      return spt;
    }
    
    /**
     * 입력날짜(From)부터 입력값인 날짜(To)까지의 날수를 리턴한다.
     * @param    String stFrom : 입력 날짜 문자열(From)
     * @param    String stTo   : 입력 날짜 문자열(To)
     * @return   int
     */
    public static int calDay(String stFrom, String stTo) throws ParseException {
      String stFormat = "yyyyMMdd";
      SimpleDateFormat formatter = new SimpleDateFormat(stFormat,
              Locale.KOREA);
      Date dtFrom = null;
      Date dtTo = null;
      long loMillSec = 0;
      dtTo = formatter.parse(stTo);
      dtFrom = formatter.parse(stFrom);
      loMillSec = dtTo.getTime() - dtFrom.getTime();
      // seconds in 1 day
      int inDay = (int) (loMillSec / (1000 * 60 * 60 * 24));
      return inDay;
    }
    
    /**
     * 자리수에 따른 round처리하기(유효자리수에 맞추어서 리턴함)
     * @param str
     * @param num
     * @param formater
     * @return
     */
    public static String round_2(String str, int num, String formater) {
      double numa = Math.pow(10, Double.parseDouble(String.valueOf(num - 1)));
      double numb = Double.parseDouble(str);
      double numc = numb * numa;
      String numd = "";
      numc = Math.round(numc);
      numc = numc / numa;
      String ch = formater + ".";
      if (num == 1) {
          ch = formater;
      }
      for (int i = 1; i < num; i++) {
          ch += "0";
      }
      DecimalFormat df = new DecimalFormat(ch);
      numd = df.format(numc);
      return numd;
    }
    
    /**
     * Stirng을 HTML에서 표시되는 문자로 변환해줍니다.
     * @param str String 변환할 문자열
     * @return String
     */
    public static String replaceHTML(String str) {
      str = str.replaceAll("&"   , "&amp;" );
      str = str.replaceAll("\""  , "&quot;");
      str = str.replaceAll( "\'" , "&apos;");
      str = str.replaceAll("<"   , "&lt;"  );
      str = str.replaceAll(">"   , "&gt;"  );
      return str;
    }
    
    /**
     * 요일을 구합니다.결과가 0이면 일요일이다
     * @param year int 년
     * @param month int 월
     * @param day int 일
     * @return int
     */
    public static int getDayOfWeek(int year, int month, int day) {
      // 0~6의 값을 반환한다. 결과가 0이면 일요일이다.
      return convertDatetoDay(year, month, day) % 7;
    }
    
    /**
     * 요일을 구합니다.결과가 0이면 일요일이다
     * @param year int 년
     * @param month int 월
     * @param day int 일
     * @return int
     */
    public static int getDayOfWeek(String sDate) {
      // 0~6의 값을 반환한다. 결과가 0이면 일요일이다.
      int year = Integer.parseInt(sDate.substring(0, 4));
      int month = Integer.parseInt(sDate.substring(5, 7));
      int day = Integer.parseInt(sDate.substring(8, 10));
      return convertDatetoDay(year, month, day) % 7;
    }
    
    /**
     * 전체 날짜 구하기
     * @param year int 년
     * @param month int 월
     * @param day int 일
     * @return int
     */
    public static int convertDatetoDay(int year, int month, int day) {
      int numOfLeapYear = 0; // 윤년의 수
      // 전년도까지의 윤년의 수를 구한다.
      for (int i = 0; i < year; i++) {
          if (isLeapYear(i)) {
              numOfLeapYear++;
          }
      }
      // 전년도까지의 일 수를 구한다.
      int toLastYearDaySum = (year - 1) * 365 + numOfLeapYear;
      // 올해의 현재 월까지의 일수 계산
      int thisYearDaySum = 0;
      //                               1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12
      int[] endOfMonth = {
                         31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
      for (int i = 0; i < month - 1; i++) {
          thisYearDaySum += endOfMonth[i];
      }
      // 윤년이고, 2월이 포함되어 있으면 1일을 증가시킨다.
      if (month > 2 && isLeapYear(year)) {
          thisYearDaySum++;
      }
      thisYearDaySum += day;
      return toLastYearDaySum + thisYearDaySum - 1;
    }
    
    /**
     * 윤년처리
     * @param year int
     * @return boolean
     */
    public static boolean isLeapYear(int year) {
      if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0)) {
        return true;
      } else {
        return false;
      }
    }
    
    /**
     * 일수 만큼 이동한 날짜를 return합니다.
     * @param sDate String 기준날짜
     * @param iday int
     * @return String
     */
    public static String moveDay(String sDate, int iday) {
      Calendar day = Calendar.getInstance();
      // 0~6의 값을 반환한다. 결과가 0이면 일요일이다.
      int cyear = Integer.parseInt(sDate.substring(0, 4));
      int cmonth = Integer.parseInt(sDate.substring(5, 7)) - 1;
      int cday = Integer.parseInt(sDate.substring(8, 10));
      day.set(cyear, cmonth, cday);
      day.add(Calendar.DATE, iday);
      int fmonth = day.get(Calendar.MONTH) + 1;
      int fday = day.get(Calendar.DATE);
      String fsMonth = "";
      String fsDay = "";
      if (fmonth < 10) {
          fsMonth = "0";
      }
      if (fday < 10) {
          fsDay = "0";
      }
      fsMonth = fsMonth + fmonth;
      fsDay = fsDay + fday;
      return day.get(Calendar.YEAR) + Util.DateSeparatorChar + fsMonth + Util.DateSeparatorChar + fsDay;
    }
    
    /**
     * 특정 월 만큼 이동시킵니다.
     * @param sDate String
     * @param imonth int
     * @return String
     */
    public static String moveMonth(String sDate, int imonth) {
      Calendar day = Calendar.getInstance();
      // 0~6의 값을 반환한다. 결과가 0이면 일요일이다.
      int cyear = Integer.parseInt(sDate.substring(0, 4));
      int cmonth = Integer.parseInt(sDate.substring(5, 7)) - 1;
      int cday = Integer.parseInt(sDate.substring(8, 10));
      day.set(cyear, cmonth, cday);
      day.add(Calendar.MONTH, imonth);
      int fmonth = day.get(Calendar.MONTH) + 1;
      int fday = day.get(Calendar.DATE);
      String fsMonth = "";
      String fsDay = "";
      if (fmonth < 10) {
          fsMonth = "0";
      }
      if (fday < 10) {
          fsDay = "0";
      }
      fsMonth = fsMonth + fmonth;
      fsDay = fsDay + fday;
      //return day.get(Calendar.YEAR) + "-" + fsMonth + "-" + fsDay;
      return day.get(Calendar.YEAR) + Util.DateSeparatorChar + fsMonth + Util.DateSeparatorChar + fsDay;
    }
    
    /**
     * 특정 연수만큼 년도를 이동시킵니다.
     * @param sDate String
     * @param iyear int
     * @return String
     */
    public static String moveYear(String sDate, int iyear) {
      Calendar day = Calendar.getInstance();
      int cyear = Integer.parseInt(sDate.substring(0, 4));
      int cmonth = Integer.parseInt(sDate.substring(5, 7)) - 1;
      int cday = Integer.parseInt(sDate.substring(8, 10));
      day.set(cyear, cmonth, cday);
      day.add(Calendar.YEAR, iyear);
      int fmonth = day.get(Calendar.MONTH) + 1;
      int fday = day.get(Calendar.DATE);
      String fsMonth = "";
      String fsDay = "";
      if (fmonth < 10) {
          fsMonth = "0";
      }
      if (fday < 10) {
          fsDay = "0";
      }
      fsMonth = fsMonth + fmonth;
      fsDay = fsDay + fday;
      return day.get(Calendar.YEAR) + Util.DateSeparatorChar + fsMonth + Util.DateSeparatorChar + fsDay;
    }
    
    /**
     * 특정 문자에서 Enter부분을 없애 줍니다.<br>
     * 사용 목적 에러 메새지를 출력할때 Enter가 들어가면 javascript 오류가 납니다.<br>
     * 그러므로 이것을 걸러 줍니다.
     * @param sOriginal String
     * @return String
     */
    public static String removeEnter(String sOriginal) {
      String sResult = "";
      sResult = sOriginal.replaceAll("\r\n" , "\\r\\n");
      sResult = sResult.replaceAll("\r"     , "\\r");
      sResult = sResult.replaceAll("\n"     , "\\n");
      sResult = sResult.replaceAll(";"      , "");
      sResult = sResult.replaceAll("\""     , "");
      sResult = sResult.replaceAll("\'"     , "");
      return sResult;
    }
    
    /**
     * Hashtable 테이블 data를 Properties 형식으로 변경합니다.
     * @param sourceHash Hashtable
     * @return Properties
     */
    @SuppressWarnings({ "rawtypes"})
    public static Properties hashToProperties(Hashtable sourceHash) throws Exception {
      try{
        Properties pro = new Properties();
        Enumeration em_keys = sourceHash.keys();
        String str_title = new String();
        while (em_keys.hasMoreElements()) {
           str_title = (String) em_keys.nextElement();
           pro.setProperty(str_title, (String) sourceHash.get(str_title));
        }
        return pro;
      }catch (Exception e){
        throw new Exception(e.getMessage());
      }
    }
    
    /**
     * 특정 문자열로 나누어서 해당 문자열이 있는지 검색하는 Method.
     * @param strSource : 검색할 문자열
     * @param strSep1 : 나눌 문자 첫번째 문자
     * @param strFind : 찾을 문자
     * @return<br>
     * 존재한다면 true, 그렇지 못하면 false
     * @throws Exception
     */
    public static boolean isIncludeStr(String strSource,String strSep1,String strFind) throws Exception {
    	boolean bolReturn = false;
    	if(strSource==null){
    		throw new Exception("찾고자 하는 문자열이 Null입니다.");
    		//throw new Exception(GetMessageFromResource.getMessage("App.Err.E02003"));
    	}
    	
    	String 		[] temArray		= strSource.split(strSep1);
    	
    	for(int i=0;i<temArray.length;i++){
    		bolReturn = temArray[i].equals(strFind);
        	if(bolReturn)
        		return bolReturn;
    	}
    	return bolReturn;
    }
    
    /**
     * 두개의 날짜를 비교하는 Method.
     * @param sysdate : 첫번째 날짜
     * @param strDate : 두번째 날짜.
     * @return int 0같음, 1 :첫번째 날짜가 큼, 2:두번째 날짜가 큼. 
     * @throws Exception
     */
    public static int compareDate(String sysdate, String strDate) throws Exception {
    	SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
    
    	StringTokenizer st = new StringTokenizer(sysdate, Util.DateSeparatorChar);
    	sysdate = st.nextToken()+st.nextToken()+st.nextToken();
    	Date param_date1 = fmt.parse(sysdate);
        
    	st = new StringTokenizer(strDate, Util.DateSeparatorChar);
    	strDate = st.nextToken()+st.nextToken()+st.nextToken();
    	Date param_date2 = fmt.parse(strDate);
    	
      int flag = 0;
  
      long millisDiff = (param_date1.getTime() - param_date2.getTime())/(1000 * 60 * 60 * 24);
  
      if(millisDiff > 0){
      	flag = 1;
      }else if(millisDiff < 0){
      	flag = 2;
      }else if(millisDiff == 0){
      	flag = 0;
      }
      return flag;
    }
    
    /**
     * 두개의 날짜를 비교하는 Method.
     * @param sysdate : 첫번째 날짜
     * @param strDate : 두번째 날짜.
     * @param strSepterator : 날짜 구분자.
     * @return int 0같음, 1 :첫번째 날짜가 큼, 2:두번째 날짜가 큼. 
     * @throws Exception
     */
    public static int compareDate(String sysdate, String strDate, String strSepterator) throws Exception {
    	if(strSepterator==null)
    		strSepterator = Util.DateSeparatorChar;
    	SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
    
    	StringTokenizer st = new StringTokenizer(sysdate, strSepterator);
    	sysdate = st.nextToken()+st.nextToken()+st.nextToken();
    	Date param_date1 = fmt.parse(sysdate);
        
    	st = new StringTokenizer(strDate, strSepterator);
    	strDate = st.nextToken()+st.nextToken()+st.nextToken();
    	Date param_date2 = fmt.parse(strDate);
    	
      int flag = 0;
  
      long millisDiff = (param_date1.getTime() - param_date2.getTime())/(1000 * 60 * 60 * 24);
  
      if(millisDiff > 0){
      	flag = 1;
      }else if(millisDiff < 0){
      	flag = 2;
      }else if(millisDiff == 0){
      	flag = 0;
      }
      return flag;
    }
    
    /**
     * 특정 문자열을 Date형식으로 변환합니다.
     * @param strValue
     * @return
     * @throws Exception
     */
    public static Date StringToDate(String strValue) throws Exception {
      if( strValue.replaceAll(Util.DateSeparatorChar, "").length()==8 )
        return (new SimpleDateFormat(Util.DateFormat)).parse(strValue);
      else
        return (new SimpleDateFormat(Util.DatetimeFormat)).parse(strValue);
    }
}