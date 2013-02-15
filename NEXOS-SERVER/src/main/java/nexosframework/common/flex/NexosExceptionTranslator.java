package nexosframework.common.flex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.flex.core.ExceptionTranslator;

import flex.messaging.MessageException;

/**
 * NexosExceptionTranslator
 * ExceptionTranslator를 상속받아 Exception 내용을 로그처리합니다.
 * @author 이경우
 * @since 2011.06.07
 * @version 1.0
 * @see <pre>
 *  == 개정이력(Modification Information) ==
 *   
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2012-11-13  이경우          최초 작성
 * 
 * </pre>
 */
public class NexosExceptionTranslator implements ExceptionTranslator {
  
  private final Logger logger = LoggerFactory.getLogger(NexosExceptionTranslator.class);
  
  public boolean handles(Class<?> clazz) {
    logger.info ("[NexosExceptionTranslator.handles Start]");
    logger.info ("Class Name = " + clazz.getName());
    logger.info ("Class Name = " + clazz.getName());
    logger.info ("[NexosExceptionTranslator.handles End]");
    return false;
  }

  public MessageException translate(Throwable t) {
    logger.info ("[NexosExceptionTranslator.handles Start]");
    logger.info ("Throwable = " + t);
    logger.info ("[NexosExceptionTranslator.handles End]");
    return null;
  }
}
