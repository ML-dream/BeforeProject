package mavenWebProject;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import mapper.UserMapper;
import po.DataConnection;
import po.user;

public class MyBatisTest {
	
	public DataConnection dataConn = new DataConnection();
	
	@Test
	public void TestSelect() throws Exception {
		SqlSession sqlSession = dataConn.getSqlSession();
		/*user user = sqlSession.selectOne("test.userId", "DWG");
		System.out.println(user.getUserId());
		sqlSession.close();*/
		//下面就是一个反射，动态代理形成一个usemapper实现类的过程，然后自动形成一个具体的类！
		//有个特点，就是mapper.xml中的namespace就是具体这个对应的usemapper的类的具体位置
		//其次，其中定义的一个方法名就是mapper.xml中得一个一个查询语句的id
		//以上就是使用接口定义的动态代理形成一个usemapper的具体的实例，然后自动可以根据方法名找到这个mapper.xml中的这个sql语句，然后把参数传入进行执行！
		UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
        user user = userMapper.findUserById("DWG");
        System.out.println(user.getUserId());		
        sqlSession.close();
	}//

}
