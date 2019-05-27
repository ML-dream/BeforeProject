package cn.itcast.bigdata.hadooprpc.client;

import java.net.InetSocketAddress;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.ipc.RPC;

import cn.itcast.bigdata.hadooprpc.protocol.IUserLoginService;

public class UserLoginAction {
	public static void main(String[] args) throws Exception {
		IUserLoginService userLoginService = RPC.getProxy(IUserLoginService.class, 100L, new InetSocketAddress("localhost", 9999), new Configuration());
		String login = userLoginService.login("angelababy", "1314520");
		System.out.println(login);
		
	}
}
