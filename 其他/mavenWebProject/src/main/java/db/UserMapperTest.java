package db;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.UserDao;
import mapper.UserMapper;
import po.user;



public class UserMapperTest {
private ApplicationContext applicationContext;  
    

	@Test
    public void testConnection() throws Exception{
    	applicationContext=new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");  
    	UserMapper userMapper=(UserMapper)applicationContext.getBean("userMapper");  
       System.out.println("数据库连接成功！！！！！");
    	user user=userMapper.findUserById("DWG");  

        System.out.println(user.getUserId());  
    }  
}
