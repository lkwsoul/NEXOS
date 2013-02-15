package nexosframework.service;

import org.springframework.flex.remoting.RemotingDestination;
import org.springframework.flex.remoting.RemotingInclude;
import org.springframework.stereotype.Service;

/**
 * <p>HelloFlex</p>
 * <p>Description: 테스트를 위한 Class</p>
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
@Service("HelloFlexService")              //define service name which export bean name for remoting
@RemotingDestination(channels={"my-amf"}) //define remoting destination channles
public class HelloFlex {

  @RemotingInclude
  public String sayHello(String name){
    
    return "Hello!".concat(name);
  }
  
}
