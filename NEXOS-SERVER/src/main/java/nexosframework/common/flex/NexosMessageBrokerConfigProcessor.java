package nexosframework.common.flex;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.flex.config.MessageBrokerConfigProcessor;

import flex.messaging.MessageBroker;
import flex.messaging.services.RemotingService;

/**
 * NexosMessageBrokerConfigProcessor
 * MessageBrokerConfigProcessor를 상속받아 MessageBroder의 traslator로 사용합니다.
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
public class NexosMessageBrokerConfigProcessor implements MessageBrokerConfigProcessor {
  
  private final Logger logger = LoggerFactory.getLogger(NexosMessageBrokerConfigProcessor.class);

  public MessageBroker processAfterStartup(MessageBroker broker) {
    RemotingService remotingService = (RemotingService)broker.getServiceByType(RemotingService.class.getName());
    
    if(remotingService.isStarted()){
      logger.info("################################################################");
      logger.info("The Remoting Service has been started with "
                       + remotingService.getDestinations().size() + " Destinations.");
      logger.info("################################################################");
    }
    return broker;
  }

  public MessageBroker processBeforeStartup(MessageBroker broker) {
    return broker;
  }
  
}
