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
		
		//����classpath�����xml�ļ�
		InputStream inputStream = Resources.getResourceAsStream(resource);
		//�����Ự����������mybatis��������Ϣ��
		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		//��һ���Ի���
		sqlSession =sqlSessionFactory.openSession();
		
		return sqlSession ;
		
		
	}
	

}
