package nexosframework.common.flex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.flex.core.MessageInterceptor;
import org.springframework.flex.core.MessageProcessingContext;

import flex.messaging.messages.Message;

/**
 * NexosMessageInterceptor
 * MessageInterceptor를 상속받아 Message 내용을 로그처리합니다.
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
public class NexosMessageInterceptor implements MessageInterceptor {
  
  private final Logger logger = LoggerFactory.getLogger(NexosMessageInterceptor.class);

  public Message postProcess(MessageProcessingContext context, Message inputMessage, Message outputMessage) {
    logger.info ("[NexosMessageInterceptor.postProcess Start]");
    logger.debug("context  = " + context);
    logger.debug("inputMessage = " + inputMessage);
    logger.debug("outputMessage = " + outputMessage);
    logger.info ("[NexosMessageInterceptor.postProcess End]");
    return outputMessage;
  }

  public Message preProcess(MessageProcessingContext context, Message inputMessage) {
    logger.info ("[NexosMessageInterceptor.postProcess Start]");
    logger.debug("context  = " + context);
    logger.debug("inputMessage = " + inputMessage);
    logger.info ("[NexosMessageInterceptor.postProcess End]");
    return inputMessage;
  }

}
