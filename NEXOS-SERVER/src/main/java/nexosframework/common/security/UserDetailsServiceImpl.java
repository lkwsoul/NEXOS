package nexosframework.common.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * <p>UserDetailsServiceImpl</p>
 * <p>Description: 스프링 보안 Authentication Manager에서 사용할 UserDetailsService의 구현클라스</p>
 * <p>Copyright: Copyright (c) 2012</p>
 * <p>Company: ASETEC</p>
 * @author Lee Kyung-woo
 * @version 1.0<br>
 * ---------------------------------------------------------------------------------------------------<br/>
 *  Ver         Date        Author            Description<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 *  1.0         2012-11-10  이경우            신규작성<br/>
 * ---------    ----------  ---------------   --------------------------------------------------------<br/>
 */
public class UserDetailsServiceImpl implements UserDetailsService{
  
  private final Logger logger = LoggerFactory.getLogger(UserDetailsServiceImpl.class);
  
  private UserDAO dao;    // 사용자 관련 DAO
  
  /**
   * DAO 주입
   * @param dao
   */
  public void setDAO(UserDAO dao) {
    this.dao = dao;
  }
   
  /**
   * 사용자명(id)를 기준으로 로그인처리하기 
   */
  @SuppressWarnings({ "rawtypes", "unchecked" })
  @Secured("ROLE_ANONYMOUS")              // 보안정책상 로그인전 접근가능하도록 처리
  public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException{
    logger.info("[loadUserByUsername START ##################################]");
    
    try {
      List list = dao.getUser(username);
      
      if(list==null || list.size()==0){
        throw new UsernameNotFoundException("사용자를 찾을 수 없습니다.");
      }
        
      Map<String, String> map = (Map)list.get(0);
      
      String userName = map.get("USER_ID");
      String password = map.get("USER_PWD");
      
      //현재 시점에서 등록되어 있다는 것은 사용가능하다는 전제를 하게 된다.
      boolean enabled = true;
  
      boolean accountNonExpired = true;    
      boolean credentialsNonExpired = true;    
      boolean accountNonLocked = true;
    
      //추후 고려사항으로 Authorities를 DB에 조회해서 가져오는 방식을 뜻하지만 현제 사용하지 않도록 합니다.
      /*
      Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
      List<String> authorityList = userDao.getAuthorities(userEntity.getUserName());
      
      Iterator<String> ite = authorityList.iterator();
      while(ite.hasNext()){
        authorities.add(new GrantedAuthorityImpl(ite.next()));
      }
      */
      //기본 사용자롤인 "ROLE_USER"을 적용합니다
      Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
      authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
      User user =new User(userName, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);    
      return user;
    }catch(Exception e){
      logger.error(e.getMessage());
      throw new UsernameNotFoundException("사용자에 대한 보안 적용시 오류가 발생하였습니다.");
    }finally{
      logger.info("[loadUserByUsername END ##################################]");
    }
  }
}