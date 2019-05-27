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