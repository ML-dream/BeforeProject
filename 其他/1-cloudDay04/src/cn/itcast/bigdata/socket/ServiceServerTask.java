package cn.itcast.bigdata.socket;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.net.Socket;
import java.util.ArrayList;

import cn.itcast_04_reflect.Person;

public class ServiceServerTask implements Runnable{
	Socket socket ;
	InputStream in=null;
	OutputStream out = null;
	
	public ServiceServerTask(Socket socket) {
		this.socket = socket;
	}

	//业务逻辑：跟客户端进行数据交互
	@Override
	public void run() {
		 try {
			//从socket连接中获取到与client之间的网络通信输入输出流 
			in = socket.getInputStream();
			out = socket.getOutputStream();
			
			
			BufferedReader br = new BufferedReader(new InputStreamReader(in));
			//从网络通信输入流中读取客户端发送过来的数据
			//注意：socketinputstream的读数据的方法都是阻塞的 
			//String param = br.readLine();
			System.out.println("2");
			String param = null;
			String className = null;
			ArrayList<String> arrayList =new ArrayList<String>();
			
			String line;
			arrayList.add(br.readLine());
			arrayList.add(br.readLine());
			/*while ((line=br.readLine()).length()!=0) {//如果之前文件为空，则不执 行输出
                arrayList.add(line);
                System.out.println(line);
			}*/
			
			//打印出
			System.out.println(arrayList.toString());
			className  = (String) arrayList.get(0);
			param = (String) arrayList.get(1);
			System.out.println(className);
			System.out.println(param);
			System.out.println("3");
			String result = null;
			try {
				result = getNotPrivateMethod("cn.itcast.bigdata.socket."+className,param);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			/**
			 * 作业：
			 * 将以下业务调用逻辑写成更加通用的：可以根据客户端发过来的调用类名、调用方法名、调用该参数来灵活调用
			 * 
			 * 《反射》
			 * 
			 */
			
			
			
			
			//GetDataServiceImpl getDataServiceImpl = new GetDataServiceImpl();
			//String result = getDataServiceImpl.getData(param);
			
			
			//将调用结果写到sokect的输出流中，以发送给客户端
			PrintWriter pw = new PrintWriter(out);
			pw.println(result);
			pw.flush();
			
			
			
		} catch (IOException e) {
			 
			e.printStackTrace();
		}finally{
			try {
				in.close();
				out.close();
				socket.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	public String getNotPrivateMethod(String obj1,String param) throws Exception {
		//System.out.println(personClass.getMethod("toString"));
		//根据传递的字符串进行类加载
		Class personClass = Class.forName(obj1);
		Object obj = personClass.newInstance();//获取空参的构造函数
		Method getDataMethod = personClass.getMethod("getData",String.class);
		String data = (String) getDataMethod.invoke(obj,param);
		return data;
		//System.out.println();
	}
}
