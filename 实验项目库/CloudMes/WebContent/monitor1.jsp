<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>法兰克监控界面</title>
    <script src="js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="js/jquery-3.3.1.min.js" type="text/javascript"></script>
    <script src="js/jquery-1.4.3.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/highcharts.js"></script>
    <script type="text/javascript" src="js/echarts.js"></script>
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

 <table width=1350px border=1 cellpadding=0 cellspacing=0 align="center">
 <tbody> 
 <tr>
        <td width=1350px>
        <div style="width:1350px;height:40px;background:#FFF8DC"><h1><div><font color="	#FF8247" size="6" face="华文楷体">法兰克数控加工中心实时监控界面</font><br></div></h1> </div>  
      </tr> 
 <tr><td width=900px > <div id="state" style="width:600px;height:300px; border:1px solid"></div> </td>
    <!--  <td width=350px> <div id="container1" style="width:350px;height:100px border:1px solid"></div></td> -->
     <td width=400px><div id="sp-rate" style="width:400px;height:300px; border:1px solid; margin-left:-400px"></div></td>   
     <td width=350px><div style="width:350px;height:300px;border:1px solid;margin-left:-750px">
     <hr><br><br><br>&nbsp;&nbsp;&nbsp;伺服轴&nbsp;&nbsp;&nbsp;&nbsp;实际坐标(mm)&nbsp;&nbsp;&nbsp;&nbsp;负载<br>
     <p id="json">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;X&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数据</p>
        <button onclick="myFunction()">获取数据</button>  
<!--     <script type="text/javascript">
        function myFunction(){
            $.ajax({
                type:"post",            //传输方式为post，所以我们在servlet里面代码是写在doPost()函数中
                url:"DataServletsa",      //这就是使用的servlet的url
                dataType:"json",
                //data:dat,
                error:function(){
                    alert("error");
                     alert(XMLHttpRequest.status);
                        alert(XMLHttpRequest.readyState);
                        alert(textStatus);
                },            
                success:function(data){                       
                          document.getElementById("json").innerHTML=data;                                  
                }
            });
            $.post("DataServletsa", dat, function(data) { alert(data.isOk); },"json");
        }
    </script> -->

     </div> </td>
</tr>
<tr>
<td width=400px> <div id="sp-load" style="width:400px;height:350px;border:1px solid"></div> </td>
<td width=400px> <div id="feed-rate" style="width:400px;height:350px;border:1px solid;margin-left:-400px"></div> </td>
<td width=510px><div style="width:530px;height:350px;border:1px solid;margin-left:-950px">
<fieldset style="width=100%;color:yellow;align=center">
  <legend>
			<strong><font size='4' color='green'>机床基本信息</font></strong>
		</legend>
</fieldset>
<form name="form1" id="form1" method="post" enctype="multipart/form-data">
			<table class="green_list_table" align="center" width="100%" border="0" style="word-break:break-all;border-collapse:collapse" bgcolor="">
			<tr>
					<th>CNC类型</th>
			    	<td><input id="cncType"  name="cncType"  width="100%" allowInput="false" vtype="float"/></td>
			        <th width="12%"style="color:red">机床IP</th>
			    	<td><input id="machineIP"  name="machineIP" style="background-color:white" width="100%" allowInput="false" vtype="float"/></td>
			    	
			    </tr>
			<tr>
					<th><br>运行模式</th>
			    	<td><input id="totalParts"  name="totalParts"  width="100%" allowInput="false" vtype="float"/></td>
			    	<th width="12%">报警信息</th>
			    	<td><input id="fillText"  name="fillText"  style="background-color:white" allowInput="false" width="100%" vtype="float"/></td>
			    </tr>
			    <tr>			   			    
			        <th width="12%">主程序的程序号</th>
			    	<td><input id="blockNoStr"  name="blockNoStr"   width="100%" allowInput="false" vtype="float"/></td>
			    	<th width="12%">正在运行的程序号</th>
			    	<td><input id="cmdSpeedRel"  name="cmdSpeedRel"   width="100%" allowInput="false" vtype="float"/></td>
			    </tr>
			    <tr>
			    			<th>正在运行的NC的程序的序号</th>
			    	<td><input id="progStatus"  name="progStatus" width="100%" allowInput="false" vtype="float"/></td>			    
			    	<th width="12%">正在运行的刀片号</th>
			    	<td><input id="cmdSpeedRel"  name="cmdSpeedRel"  width="100%" allowInput="false" vtype="float"/></td>
			    </tr>
			    <tr>
			    			<th>报警数量</th>
			    	<td><input id="progStatus"  name="progStatus" width="100%" allowInput="false" vtype="float"/></td>			
			    	<th width="12%">报警内容</th>
			    	<td><input id="cmdSpeedRel"  name="cmdSpeedRel"  width="100%" allowInput="false" vtype="float"/></td>
			    </tr>
   
			</table>
		</form>
</div> </td>
</tr>
     </tbody>
 </table>
       <script>
        var myChart = echarts.init(document.getElementById('sp-rate'));
        var myChart1= echarts.init(document.getElementById('sp-load'));
        var myChart2 = echarts.init(document.getElementById('feed-rate'));
         var option = {
         series: [
             {
                 type: "gauge",
                 center: ["50%", "60%"], // 仪表位置
                 radius: "100%", //仪表大小
                 startAngle: 200, //开始角度
                 endAngle: -20, //结束角度
                 
                 axisLine: {
                     show: false,
                     lineStyle: { // 属性lineStyle控制线条样式
                         color: [
                             [ 0.5,  new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                                 offset: 1,
                                 color: "#E75F25" // 50% 处的颜色
                             }, {
                                 offset: 0.8,
                                 color: "#D9452C" // 40% 处的颜色
                             }], false) ], // 100% 处的颜色
                              [ 0.7,  new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                                 offset: 1,
                                 color: "#FFC539" // 70% 处的颜色
                             }, {
                                 offset: 0.8,
                                 color: "#FE951E" // 66% 处的颜色
                             }, {
                                 offset: 0,
                                 color: "#E75F25" // 50% 处的颜色
                             }], false) ],
                              [ 0.9,  new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                 offset: 1,
                                 color: "#C7DD6B" // 90% 处的颜色
                             }, {
                                 offset: 0.8,
                                 color: "#FEEC49" // 86% 处的颜色
                             }, {
                                 offset: 0,
                                 color: "#FFC539" // 70% 处的颜色
                             }], false) ],
                             [1,  new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
                                 offset: 0.2,
                                 color: "#1CAD52" // 92% 处的颜色
                             }, {
                                 offset: 0,
                                 color: "#C7DD6B" // 90% 处的颜色
                             }], false) ]
                         ],
                         width: 10
                     }
                 },
                 splitLine: { 
                     show: false
                 },
                 axisTick: {
                     show: false
                 },
                 axisLabel: {
                     show: false
                 },
                 pointer : { //指针样式
                     length: '45%'
                 },
                 detail: {
                     show: false
                 }
             },
             {
                 type : "gauge",
                 center: ["50%", "60%"], // 默认全局居中
                 radius : "90%",
                 startAngle: 200,
                 endAngle: -20,
                 axisLine : {
                     show : true,
                     lineStyle : { // 属性lineStyle控制线条样式
                         color : [ //表盘颜色
                             [ 0.5, "#DA462C" ],//0-50%处的颜色
                             [ 0.7, "#FF9618" ],//51%-70%处的颜色
                             [ 0.9, "#FFED44" ],//70%-90%处的颜色
                             [ 1,"#20AE51" ]//90%-100%处的颜色
                         ],
                         width : 35//表盘宽度
                     }
                 },
                 splitLine : { //分割线样式（及10、20等长线样式）
                     length : 30,
                     lineStyle : { // 属性lineStyle控制线条样式
                         width : 2
                     }
                 },
                 axisTick : { //刻度线样式（及短线样式）
                      length : 20
                 },
                 axisLabel : { //文字样式（及“10”、“20”等文字样式）
                     color : "black",
                     distance : 5 //文字离表盘的距离
                 },
              
                 detail: {
                     formatter : '{value}r/min',
                     offsetCenter: [0, "40%"],
                   
                     backgroundColor: '#FFEC45',
                     height:30,
                     rich : {
                         score : {
                             color : "white",
                             fontFamily : "宋体",
                             fontSize : 50
                         }
                     }
                 },
                  data: [{value: 1500, name: '主轴转速'}],
                   min:0,
		           max:3000,
		           splitNumber:10
		           }
         ]
     };
     var option1 = {
         series: [
             {
                 type: "gauge",
                 center: ["50%", "65%"], // 仪表位置
                 radius: "100%", //仪表大小
                 startAngle: 200, //开始角度
                 endAngle: -20, //结束角度
                 
                 axisLine: {
                     show: false,
                     lineStyle: { // 属性lineStyle控制线条样式
                         color: [
                             [ 0.5,  new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                                 offset: 1,
                                 color: "#E75F25" // 50% 处的颜色
                             }, {
                                 offset: 0.8,
                                 color: "#D9452C" // 40% 处的颜色
                             }], false) ], // 100% 处的颜色
                              [ 0.7,  new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                                 offset: 1,
                                 color: "#FFC539" // 70% 处的颜色
                             }, {
                                 offset: 0.8,
                                 color: "#FE951E" // 66% 处的颜色
                             }, {
                                 offset: 0,
                                 color: "#E75F25" // 50% 处的颜色
                             }], false) ],
                              [ 0.9,  new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                 offset: 1,
                                 color: "#C7DD6B" // 90% 处的颜色
                             }, {
                                 offset: 0.8,
                                 color: "#FEEC49" // 86% 处的颜色
                             }, {
                                 offset: 0,
                                 color: "#FFC539" // 70% 处的颜色
                             }], false) ],
                             [1,  new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
                                 offset: 0.2,
                                 color: "#1CAD52" // 92% 处的颜色
                             }, {
                                 offset: 0,
                                 color: "#C7DD6B" // 90% 处的颜色
                             }], false) ]
                         ],
                         width: 10
                     }
                 },
                 splitLine: { 
                     show: false
                 },
                 axisTick: {
                     show: false
                 },
                 axisLabel: {
                     show: false
                 },
                 pointer : { //指针样式
                     length: '45%'
                 },
                 detail: {
                     show: false
                 }
             },
             {
                 type : "gauge",
                 center: ["50%", "65%"], // 默认全局居中
                 radius : "90%",
                 startAngle: 200,
                 endAngle: -20,
                 axisLine : {
                     show : true,
                     lineStyle : { // 属性lineStyle控制线条样式
                         color : [ //表盘颜色
                             [ 0.5, "#DA462C" ],//0-50%处的颜色
                             [ 0.7, "#FF9618" ],//51%-70%处的颜色
                             [ 0.9, "#FFED44" ],//70%-90%处的颜色
                             [ 1,"#20AE51" ]//90%-100%处的颜色
                         ],
                         width : 35//表盘宽度
                     }
                 },
                 splitLine : { //分割线样式（及10、20等长线样式）
                     length : 30,
                     lineStyle : { // 属性lineStyle控制线条样式
                         width : 2
                     }
                 },
                 axisTick : { //刻度线样式（及短线样式）
                      length : 20
                 },
                 axisLabel : { //文字样式（及“10”、“20”等文字样式）
                     color : "black",
                     distance : 5 //文字离表盘的距离
                 },
              
                 detail: {
                     formatter : '{value}KN',
                     offsetCenter: [0, "40%"],
                   
                     backgroundColor: '#FFEC45',
                     height:30,
                     rich : {
                         score : {
                             color : "white",
                             fontFamily : "宋体",
                             fontSize : 50
                         }
                     }
                 },
                  data: [{value: 25, name: '主轴负载'}],
                   min:0,
		           max:100,
		           splitNumber:10
		           }
         ]
     };
     var option2 = {
         series: [
             {
                 type: "gauge",
                 center: ["50%", "65%"], // 仪表位置
                 radius: "100%", //仪表大小
                 startAngle: 200, //开始角度
                 endAngle: -20, //结束角度
                 
                 axisLine: {
                     show: false,
                     lineStyle: { // 属性lineStyle控制线条样式
                         color: [
                             [ 0.5,  new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                                 offset: 1,
                                 color: "#E75F25" // 50% 处的颜色
                             }, {
                                 offset: 0.8,
                                 color: "#D9452C" // 40% 处的颜色
                             }], false) ], // 100% 处的颜色
                              [ 0.7,  new echarts.graphic.LinearGradient(0, 0, 1, 0, [{
                                 offset: 1,
                                 color: "#FFC539" // 70% 处的颜色
                             }, {
                                 offset: 0.8,
                                 color: "#FE951E" // 66% 处的颜色
                             }, {
                                 offset: 0,
                                 color: "#E75F25" // 50% 处的颜色
                             }], false) ],
                              [ 0.9,  new echarts.graphic.LinearGradient(0, 0, 0, 1, [{
                                 offset: 1,
                                 color: "#C7DD6B" // 90% 处的颜色
                             }, {
                                 offset: 0.8,
                                 color: "#FEEC49" // 86% 处的颜色
                             }, {
                                 offset: 0,
                                 color: "#FFC539" // 70% 处的颜色
                             }], false) ],
                             [1,  new echarts.graphic.LinearGradient(0, 0, 0, 1, [ {
                                 offset: 0.2,
                                 color: "#1CAD52" // 92% 处的颜色
                             }, {
                                 offset: 0,
                                 color: "#C7DD6B" // 90% 处的颜色
                             }], false) ]
                         ],
                         width: 10
                     }
                 },
                 splitLine: { 
                     show: false
                 },
                 axisTick: {
                     show: false
                 },
                 axisLabel: {
                     show: false
                 },
                 pointer : { //指针样式
                     length: '45%'
                 },
                 detail: {
                     show: false
                 }
             },
             {
                 type : "gauge",
                 center: ["50%", "65%"], // 默认全局居中
                 radius : "90%",
                 startAngle: 200,
                 endAngle: -20,
                 axisLine : {
                     show : true,
                     lineStyle : { // 属性lineStyle控制线条样式
                         color : [ //表盘颜色
                             [ 0.5, "#DA462C" ],//0-50%处的颜色
                             [ 0.7, "#FF9618" ],//51%-70%处的颜色
                             [ 0.9, "#FFED44" ],//70%-90%处的颜色
                             [ 1,"#20AE51" ]//90%-100%处的颜色
                         ],
                         width : 35//表盘宽度
                     }
                 },
                 splitLine : { //分割线样式（及10、20等长线样式）
                     length : 30,
                     lineStyle : { // 属性lineStyle控制线条样式
                         width : 2
                     }
                 },
                 axisTick : { //刻度线样式（及短线样式）
                      length : 20
                 },
                 axisLabel : { //文字样式（及“10”、“20”等文字样式）
                     color : "black",
                     distance : 5 //文字离表盘的距离
                 },
              
                 detail: {
                     formatter : '{value}mm/min',
                     offsetCenter: [0, "40%"],
                   
                     backgroundColor: '#FFEC45',
                     height:30,
                     rich : {
                         score : {
                             color : "white",
                             fontFamily : "宋体",
                             fontSize : 50
                         }
                     }
                 },
                  data: [{value: 1500, name: '进给速度'}],
                   min:0,
		           max:10000,
		           splitNumber:10
		           }
         ]
     };
     setInterval(function () {
    option.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
    option1.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
    option2.series[0].data[0].value = (Math.random() * 100).toFixed(2) - 0;
},2000);
          myChart.setOption(option);
          myChart1.setOption(option1);     
          myChart2.setOption(option2);    
     
      var chart = Highcharts.chart('state', {
	chart: {
		type: 'bar'
	},
	title: {
		text: '机床状态统计'
	},
	subtitle: {
		text: '24小时统计数据'
	},
	xAxis: {
		categories: ['运行时间', '切削时间', '循环时间', '开机时间', '停机时间'],
		title: {
			text: null
		}
	},
	yAxis: {
		min: 0,
		max:24,
		tickInterval:2,
		title: {
			text: '时刻 (小时)',
			align: 'high'
		},
		labels: {
			overflow: 'justify'
		}
	},
	tooltip: {
		valueSuffix: ' 小时'
	},
	plotOptions: {
		bar: {
			dataLabels: {
				enabled: true,
				allowOverlap: true // 允许数据标签重叠
			}
		}
	},
	legend: {
		layout: 'vertical',
		align: 'right',
		verticalAlign: 'top',
		x: -40,
		y: 100,
		floating: true,
		borderWidth: 1,
		backgroundColor: ((Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'),
		shadow: true
	},
	series: [{
		name: '状态统计',
		data: [1.53, 2.5, 1.2, 8.5, 15.5]
	}]
});  
 
     
</script> 
  </body>
</html>
