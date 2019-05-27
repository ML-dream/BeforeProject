package dao;

import po.user;

//用户管理的Dao接口  
public interface UserDao{  
  //根据Id查询用户信息  
  public user findUserById(String id) throws Exception;  
}  