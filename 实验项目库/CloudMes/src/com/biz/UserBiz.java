package com.biz;

import com.entity.User;

public interface UserBiz {
	//用户登录，返回就是登录用户的信息
	public User login(User user);
	//注册用户
	public int registerUser(User user);

}
