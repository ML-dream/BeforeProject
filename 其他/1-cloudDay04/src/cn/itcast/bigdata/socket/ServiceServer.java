package cn.itcast.bigdata.socket;

import java.net.InetSocketAddress;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class ServiceServer {

	public static void main(String[] args) throws Exception {

		// 创建一个serversocket，绑定到本机的8899端口上
		ServerSocket server = new ServerSocket();
		server.bind(new InetSocketAddress("localhost", 8899));
		
		
		
		//建立固定数量线程池
	
				ExecutorService exec = Executors.newFixedThreadPool(4);
				
		
		// 接受客户端的连接请求;accept是一个阻塞方法，会一直等待，到有客户端请求连接才返回
		
		//这个地方可以高造成一个线程池，建立的同时本身就是有阻塞序列的，再加上生产者消费者实现同步，建立一个，可以在加上反射，然后在加一个动态代理！！！
		//动态代理可以用来进行一些方法的验证，是否有权限之类的
		while (true) {
			Socket socket = server.accept();
			exec.execute(new ServiceServerTask(socket));
			System.out.println("1");
		}
	}

}
