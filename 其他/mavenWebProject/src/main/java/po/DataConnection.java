package po;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DataConnection {
	private String resource = "mybatis/SqlMapConfig.xml";
	private SqlSessionFactory sqlSessionFactory;
	private SqlSession sqlSession;
	
	public SqlSession getSqlSession() throws Exception {
		
		//加载classpath里面的xml文件
		InputStream inputStream = Resources.getResourceAsStream(resource);
		//创建会话工厂，传入mybatis的配置信息！
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		//打开一个对话！
		sqlSession =sqlSessionFactory.openSession();
		
		return sqlSession ;
		
		
	}
	

}
