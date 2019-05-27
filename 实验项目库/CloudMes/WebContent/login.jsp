<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html;charset=UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:useBean id="yzm" scope="application" class="com.CheckCode"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<script type="text/javascript" src="lib/PIE_IE678.js"></script>
<![endif]-->
<link href="css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="http://lib.h-ui.net/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<title>系统登录</title>
<meta name="keywords" content="H-ui.admin v2.3,H-ui网站后台模版,后台模版下载,后台管理系统模版,HTML后台模版下载">
<meta name="description" content="H-ui.admin v2.3，是一款由国人开发的轻量级扁平化网站后台模板，完全免费开源的网站后台管理系统模版，适合中小型CMS后台系统。">
</head>
<%
String message = (String)request.getAttribute("message");
	if(message == null){
			message = "";
	}
	if (!message.trim().equals("")){
		out.println("<script language='javascript'>");
		out.println("alert('"+message+"');");
		out.println("</script>");
	}
	request.removeAttribute("message");
 	String code=yzm.getCheckCode();
%>
<body>
<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header">数控机床群云端监控管理系统</div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="LoginHandle" method="post">
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-8">
          <input id="Username" name="Username" type="text" placeholder="账户" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-8">
          <input id="Password" name="Password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-8 col-offset-3">
          <input id="yzm" class="input-text size-L"  type="text" placeholder="验证码" onblur="if(this.value==''){this.value=''}" onclick="if(this.value=='验证码:'){this.value='';}" value="" style="width:150px;">
         <font size="4"><B> <%=code %> </div>
      </div>
      <div class="row">
        <div class="formControls col-8 col-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row">
        <div class="formControls col-8 col-offset-3">
          <input id="login_button" name="" type="submit" class="btn btn-success radius size-L" onclick="return a()" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L"  value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 南京航空航天大学 by SGQ.admin.v2.3</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="js/H-ui.js"></script> 
<script type="text/javascript">src="js/login.js"</script>
<script src="js/index.js"></script>
<!-- <script type="text/javascript">
$(function(){
        $("#login_btn").click(function(){
        /* var url = "/test1/servlet"; */
        var url="LoginServlet"
        var params = {"username":$("input[type='text']").val(), "password":$("input[type='password']").val()};
      
        $.ajax({
                "url" : url,
                "data" : params,
                "type" : "post",
                "success" : function(data) {
                    // 参数为json类型的对象
                    alert(data.message)
                },
                "error" : function() {
                    alert("1");
                }
            });

        });
    }); 
</script> -->
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F080836300300be57b7f34f4b3e97d911' type='text/javascript'%3E%3C/script%3E"));
</script>
  <script language="javascript">
	 
	 function a()
    {
  
      if(document.getElementById("Username").value=='')
      {
         alert("用户名不能为空！");
         return false;
      }
      else if(document.getElementById("Password").value=='')
      {
         alert("密码不能为空！");
         return false;
      }
      else if(document.getElementById("yzm").value==''){
         alert("验证码不能为空");
         return false;
       
      }
      else if(document.getElementById("yzm").value!=<%=code%>){
          alert("请正确输入验证码！");
          return false;
      }
      else
         return true;
    }
</script>
 <script> 
//取出传回来的参数error并与yes比较
  var success ='<%=request.getParameter("success")%>';
  if(success=='yes'){
   alert("登录成功!");
  }
</script>
 <script> 
//取出传回来的参数error并与yes比较
  var error ='<%=request.getParameter("error1")%>';
  if(error=='yes'){
   alert("密码错误!");
  }
</script>
 <script> 
//取出传回来的参数error并与yes比较
  var error ='<%=request.getParameter("error2")%>';
  if(error=='yes'){
   alert("登录成功!");
  }
</script>
</body>
</html>