·<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login_handle.html' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%!
        //处理字符串的函数
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
     %>
     <%
        String username=getString(request.getParameter("Username")).trim();
        String password=getString(request.getParameter("Password")).trim();
             Class.forName("com.mysql.jdbc.Driver"); 
			String dbURL = "jdbc:mysql://127.0.0.1/user";  // 连接服务器和数据库mytest 
			String userName = "root"; // 默认用户名
			String userPwd = "123456"; // 密码
			Connection conn = DriverManager.getConnection(dbURL, userName, userPwd);
			out.print("数据库连接成功"); 
			Statement st=conn.createStatement();
			String sql="select * from login where name='"+username+"'";
			ResultSet rs=st.executeQuery(sql);
			if(!rs.next()){
    %>
                <script language="javascript">
                   alert("该用户不存在！"); 
                   history.back();  
               </script>
    <%      }else{
               String Name=rs.getString("name").trim();
               String Password=rs.getString("password").trim(); 
               if(Password.equals(password)){
               
                  session.setAttribute("name1", Name);
                  session.setAttribute("login1", "success");
    %>
                 <script language="javascript">
	               alert("登录成功！");
	               window.location.href="index.jsp";
                 </script> 
   <%          }else{
    %>
                   <script language="javascript">
	                 alert("密码错误！");
	                 history.back();
                   </script>
  <%            } 
           }
  %>

  </body>
</html>
