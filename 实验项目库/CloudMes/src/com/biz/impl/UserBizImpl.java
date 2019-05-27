package com.biz.impl;

import com.biz.UserBiz;
import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.entity.User;

public class UserBizImpl implements UserBiz {
	private UserDao userDao=null;
	public UserBizImpl() {
		userDao=new UserDaoImpl();
	}

	@Override
	public User login(User user) {
		return userDao.queryUser(user);
	}

	@Override
	public int registerUser(User user) {
	    if(userDao.queryUser(user)!=null) {
	    	return 1;//���û����Ѿ�����
	    }else {
	    	boolean res=userDao.saveUser(user);
	    	if(res) {
	    		return 2;//ע��ɹ�
	    	}else
	    		return 3;//ע��ʧ��
	    }
	}

}
