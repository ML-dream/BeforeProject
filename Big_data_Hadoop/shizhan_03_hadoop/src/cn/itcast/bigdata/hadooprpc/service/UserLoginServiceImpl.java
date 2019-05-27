package cn.itcast.bigdata.hadooprpc.service;

import cn.itcast.bigdata.hadooprpc.protocol.IUserLoginService;

public class UserLoginServiceImpl implements IUserLoginService{

	@Override
	public String login(String name, String passwd) {
		
		return name + "logged in successfully...";
	}
	
	
	

}
