package dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import po.user;

public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao{  
	
	//private SqlSessionFactory sqlSessionFactory;
	
    public user findUserById(String id) throws Exception {  
        
    	//�̳�SqlSessionDaoSupport�࣬ͨ��this.getSqlSession()�õ�sqlSession  
       // this.setSqlSessionFactory(sqlSessionFactory);
    	SqlSession sqlSession=this.getSqlSession();  
        user user=sqlSession.selectOne("test.findUserById",id);  
        return user;  
    }  
}  
