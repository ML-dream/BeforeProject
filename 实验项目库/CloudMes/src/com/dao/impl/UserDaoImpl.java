package com.dao.impl;

import java.util.ArrayList;
import java.util.List;
import com.dao.UserDao;
import com.entity.User;

public class UserDaoImpl extends BaseDao implements UserDao {

	@Override
	public boolean saveUser(User user) {
		String sql="insert into user(username,password,email,type)values(?,?,?,?)";
		List<Object> params=new ArrayList<Object>();
		params.add(user.getUsername());
		params.add(user.getPassword());
		params.add(user.getEmail());
		params.add(user.getType());
		return this.operUpdate(sql, params);
	}

	@Override
	public boolean delUser(int id) {
		String sql="delete from users where id=?";
		List<Object> params=new ArrayList<Object>();
		params.add(id);
		return this.operUpdate(sql, params);

	}

	@Override
	public boolean updataUser(User user) {
	   String sql="update users set username=?,password=?,email=?,type=? where id=?";
	   List<Object> params=new ArrayList<Object>();
	   params.add(user.getUsername());
	   params.add(user.getPassword());
	   params.add(user.getEmail());
	   params.add(user.getType());
	   params.add(user.getId());
		return this.operUpdate(sql, params);
	}

	@Override
	public User queryUser(User user) {
		List<User> uList=null;
		String sql="Select id,username,password,email,type from user where username=? and password=? and email=? and type=?";
		   List<Object> params=new ArrayList<Object>();
		   params.add(user.getUsername());
		   params.add(user.getPassword());
		   params.add(user.getEmail());
		   params.add(user.getType());
		   try {
			uList=this.operQuery(sql, params, User.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		   if(uList.size()>0) {
			   return uList.get(0);			 
		   }
		return null;
	}

}
