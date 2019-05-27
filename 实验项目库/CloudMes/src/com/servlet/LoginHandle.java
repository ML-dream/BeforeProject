package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.*;
import com.tools.*;

/**
 * Servlet implementation class Login_Handle
 */
@WebServlet("/LoginHandle")
public class LoginHandle extends HttpServlet {

	private static final long serialVersionUID = -6480924742009510047L;

	/**
     * @see HttpServlet#HttpServlet()
     */
    public LoginHandle() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setDateHeader("Expires", 0);
		response.setHeader("Pragma", "no-cache");
		HttpSession session = request.getSession();
		String username = getString(request.getParameter("Username")).trim();
		String password = getString(request.getParameter("Password")).trim();
	/*	password = MD5.MD5Convert(password);*/
		/*User user = null;*/
		System.out.println("用户名=="+username);
		System.out.println("密码=="+password);
		 try {
			Class.forName("com.mysql.jdbc.Driver");
		      System.out.println("成功加载MySQL驱动");
		} catch (ClassNotFoundException e) {
			System.out.println("找不到MySQL驱动");
			e.printStackTrace();
		} 
			try {
				String dbURL = "jdbc:mysql://127.0.0.1/user";  // 数据库mysql的url
				String userName = "root"; // 用户名	
				String userPwd = "123456"; // 密码
				boolean loginok=false;
				Connection conn=null;
				conn = DriverManager.getConnection(dbURL, userName, userPwd);
				System.out.println("数据库连接成功5");
				String sql="select * from login where name='"+username+"'";
				PreparedStatement ps=conn.prepareCall(sql);
				ResultSet rs=ps.executeQuery(sql);
				while(rs.next()) {
					String name1=rs.getString("name");
					String password1=rs.getString("password");
					System.out.println("数据库："+name1);
					System.out.println("数据库："+password1);
					if (name1.equals(username)&& password1.equals(password)) {
						loginok = true;
					}
					if (loginok) {           //登陆成功
						System.out.println("登陆成功");
						session.setAttribute("username", username);
						response.sendRedirect("index.jsp?success");
					}else {	
						if(name1.equals(username)&&!password1.equals(password)) {
							System.out.println("密码错误");
							response.sendRedirect("login.jsp?error1=yes");
						}
						if(!name1.equals(username)&&password1.equals(password)) {
							System.out.println("用户不存在");
							response.sendRedirect("login.jsp?error2=yes");
						}
					}
				}
				conn.close();
			} catch (SQLException e) {
				System.out.println("数据库连接失败");
				System.out.println("错误信息："+e.toString());
			}
			/*PreparedStatement ps=null;
			ResultSet rs=null;			
			try {
				String sql="select * from login where name='"+username+"'";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery(sql);
				while(rs.next()) {
					String name1=rs.getString("name");
					String password1=rs.getString("password");
					System.out.println("数据库："+name1);
					System.out.println("数据库："+password1);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
				/*String Password=rs.getString("password");
					if (Password.equals(password)) {
						loginok = true;
					}
					if (loginok) {           //閻ц缍嶉幋鎰閿涗緤绱�
						System.out.println("鐧婚檰鎴愬姛");
						session.setAttribute("username", username);
						response.sendRedirect("index.jsp");
					}else {					//鐧诲綍澶辫触
						System.out.println("鐧诲綍澶辫触");
						response.sendRedirect("login.jsp");
						}*/
				
				
			
			/*	ResultSet rs=st.executeQuery(sql);*/
							
		
	
	}


	//澶勭悊瀛楃涓茬殑鍑芥暟
    public String getString(String s)
    {
       if(s==null)
          s="";
       try{
          byte a[]=s.getBytes("ISO-8859-1");
          s= new String(a);
       }catch(Exception e){}
      return s;
    }
}