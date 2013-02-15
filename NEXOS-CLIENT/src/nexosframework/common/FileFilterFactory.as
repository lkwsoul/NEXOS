package nexosframework.common {
  import flash.net.FileFilter;
  import mx.controls.Alert;
  
 /**
 * <p>FileFilterFactory</p>
 * <p>Description: Filefilter를 생성하는 Factory</p>
 * <p>Copyright: Copyright(c) 2010</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br/>
 * -------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 *  1.0         2008-10-10  Lee Kyung-woo     신규작성<br/>
 *  2.0         2009-04-17  Lee Kyung-woo     text, xml추가<br/>
 * ---------    ----------  ---------------   ------------------------------------------------------<br/>
 * 
 */
  public class FileFilterFactory{
    
    private static var imagesFilter:FileFilter;
    private static var docFilter:FileFilter;
    private static var excelFilter:FileFilter;
    
    public static const IMAGE:String = "image";
    public static const DOC:String = "doc";
    public static const EXCEL:String = "excel";
    public static const TEXT:String = "text";
    public static const XML:String = "xml";

    [Inspectable(category="General", enumeration="image,doc,excel,text")]
    /**
    * 형태에 따른 FileFilter 가져오기.
    * @param type : image,doc,excel FileFilter분류.
    * return FileFilter
    */
    public static function getByType(type:String):FileFilter{
      switch(type){
        case FileFilterFactory.IMAGE:
          if(imagesFilter==null)
            imagesFilter  = new FileFilter("Images(*.jpg;*.gif;*.png)","*.jpg;*.gif;*.png");
          return imagesFilter;
        break;
        case FileFilterFactory.DOC:
          if(docFilter==null)
            docFilter  = new FileFilter("Document(*.doc;*.docx)","*.doc;*.docx");
          return docFilter;
        break;
        case FileFilterFactory.EXCEL:
          if(excelFilter==null)
            excelFilter  = new FileFilter("Excel(*.xls;*.xlsx)","*.xls;*.xlsx");
          return excelFilter;
        break;
        case FileFilterFactory.TEXT:
          if(excelFilter==null)
            excelFilter  = new FileFilter("Text(*.txt)","*.txt");
          return excelFilter;
        break;
        case FileFilterFactory.XML:
          if(excelFilter==null)
            excelFilter  = new FileFilter("Text(*.xml)","*.xml");
          return excelFilter;
        break;
        default:
          Alert.show("생성할 FileFilter의 분류를 잘못 지정하였습니다.");
          /*
          * 2012-10-05
          * 이경우
          * 소스 정리(다국어 미처리)로 주석처리
          Alert.show(ResourceData.source["FileFilterFactory.ZM0001"]);
          */
          return null;
        break;
      }
    }
    
    /**
    * 특정 형태의 FileFilter를 생성합니다.
    */
    public static function getFileFilter(description:String, extension:String, macType:String=null):FileFilter{
      return new FileFilter(description, extension, macType);
    }
  }
}