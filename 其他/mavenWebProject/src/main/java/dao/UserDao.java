package dao;

import po.user;

//�û������Dao�ӿ�  
public interface UserDao{  
  //����Id��ѯ�û���Ϣ  
  public user findUserById(String id) throws Exception;  
}  