<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <form action="findUser.action"  methon="post">
    	用户姓名：<input type="text" name="name"  /></br>
    	<input type="submit" value="查询">
    	
    	<input type="text" name="${name}"  /></br>
    	
    </form> 
</body>
</html>