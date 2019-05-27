package com.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;

import com.entity.User;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public interface UserDao {
	public boolean saveUser(User user);//添加用户
	public boolean delUser(int id);//删除用户
	public boolean updataUser(User user);//更新用户
	public User queryUser(User user);//查询用户
  /* Connection conn=null;
   PreparedStatement pre=null;
   ResultSet res=null;
   public User getUser(String username,String password) {
	   User user=new User();
	   try {
		   Class.forName("com.mysql.jdbc.Driver");
		   conn =(Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/user","root","123456");
		   String sql="select *from user where username=? and password=?";
		   pre=(PreparedStatement) conn.prepareStatement(sql);
		   pre.setString(1, username);
		   pre.setString(2, password);
		   res=pre.executeQuery();
		   while(res.next()) {
			   user.setUsername(res.getString("username"));
			   user.setPassword(res.getString("password"));
			   user.setEmail(res.getString("email"));
		   }
	   } catch (Exception e) {
		   e.printStackTrace();
	   }
	   return user;
   }*/
}
