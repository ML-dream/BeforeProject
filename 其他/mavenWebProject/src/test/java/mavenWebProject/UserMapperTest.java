package mavenWebProject;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.UserDao;
import mapper.UserMapper;
import po.user;



public class UserMapperTest {
private ApplicationContext applicationContext;  
    
	
    @Before  
    public void setup() throws Exception{  
        applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");  
    }  
      
    @Test  
    public void testFindUserById() throws Exception{  
    	UserMapper userMapper=(UserMapper)applicationContext.getBean("userMapper");  
       
    	user user=userMapper.findUserById("DWG");  

        System.out.println(user.getUserId());  
    }  
}
