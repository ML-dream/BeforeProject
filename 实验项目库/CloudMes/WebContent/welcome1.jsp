<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link href="css/H-ui.admin.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="lib/Hui-iconfont/1.0.1/iconfont.css" rel="stylesheet" type="text/css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<script type="text/javascript" src="js/highcharts.js"></script>
<title>欢迎首页</title>
</head>
<body>
<!-- <div class="pd-20" style="padding-top:20px;">
  <p class="f-20 text-success">欢迎进入云端监控系统 <span class="f-14">v1.0</span>&nbsp;&nbsp;&nbsp;test！</p>
  <p>设备台数（台）<h style="font-size: x-large;">&nbsp;&nbsp;26</h></p>
  <div class="left" id="device-sum" ></div>
   <div class="middle" id="device-state" ></div>
   <div class="right" id="produce-plan" ></div>
</div> -->
<table width=1350px border=0 cellpadding=0 cellspacing=0 align="center">
<tr>
 <td width=1350px>
     <div class="top">
        <p class="f-20 text-success">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎进入云端监控系统 <span class="f-14">v1.0</span></p>
     </div>
 <tr>
    <td width=450px>
     <div style="width:450px;height:30px;padding-left:100px;padding-top:20px"> <p style="font-size: 15px">&nbsp;&nbsp;&nbsp;&nbsp;设备总数（台）<h style="font-size: x-large;">&nbsp;&nbsp;26</h></p></div>
     <div class="mid-left" id="device-sum"></div></td>
    <td width=400px>
     <div style="width:400px;height:30px;padding-left:100px;padding-top:20px"> <p style="font-size: 15px">&nbsp;&nbsp;&nbsp;&nbsp;</h></p></div>
     <div class="mid-middle" id="device-state"></div></td>
    <td width=500px>
     <div style="width:500px;height:30px;padding-left:100px;padding-top:20px"> <p style="font-size: 15px">&nbsp;&nbsp;&nbsp;&nbsp;</p></div>
     <div class="mid-right" id="produce-plan"></div></td>
  <tr>
    <td width=200px>
     <div id="machine1" style="width:200px;height:200px;border:0px solid;margin-left:100px;margin-top:20px"></div>
     <div style="width:200px;height:20px;margin-left:135px;margin-top:10px"><h style="font-size:15px;font-weight:bold">数控电火花成形机床</h></div>   
    <td width=200px>
     <div id="machine2" style="width:200px;height:200px;border:0px solid;margin-left:-170px;margin-top:20px"></div>
     <div style="width:200px;height:20px;margin-left:-150px;margin-top:10px"><h style="font-size:15px;font-weight:bold">数控走丝电火花切割机床</h></div>
     <td width=200px>
     <div id="machine3" style="width:200px;height:200px;border:0px solid;margin-left:-380px;margin-top:20px"></div>
     <div style="width:200px;height:20px;margin-left:-335px;margin-top:10px"><h style="font-size:15px;font-weight:bold">数控高速成型磨床</h></div>  
     <td width=200px>
     <div id="machine4" style="width:200px;height:200px;border:0px solid;margin-left:-680px;margin-top:20px"></div>
     <div style="width:200px;height:20px;margin-left:-645px;margin-top:10px"><h style="font-size:15px;font-weight:bold">车铣复合加工中心</h></div> 
     <td width=200px>
     <div id="machine5" style="width:200px;height:200px;border:0px solid;margin-left:-390px;margin-top:20px"></div>
     <div style="width:200px;height:20px;margin-left:-350px;margin-top:10px"><h style="font-size:15px;font-weight:bold">高速五坐标加工中心</h></div> 

</table>
<footer class="footer">
  <p><br>Copyright 南京航空航天大学 by SGQ.admin.v1.0<br> </p>
</footer>
 <script >
// Build the chart
Highcharts.chart('device-sum', {
		chart: {
				plotBackgroundColor: '#FFFAFA',
				plotBorderWidth: null,
				plotShadow: false,
				height:330,
				width:400,
				marginRight:0,
				type: 'pie'
		},
		title: {
				text: '车间设备占比'
		},
		tooltip: {
				  headerFormat: '{series.name}<br>',
               pointFormat: '{point.name}: <b>{point.percentage:.1f}%</b>'
             
               
		},
		plotOptions: {
				pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						dataLabels: {
                    enabled: true,
                    distance: -50,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    },
                    format: '{y}%'
                },
						showInLegend: true
				}
		},
		legend: {
    enabled: true,      //不显示图例
	 layout: 'vertical',   //图例布局：竖直方向排列
	 backgroundColor: '#fff',  //图例背景颜色
	 borderRadius: '5',   //图例背景边框圆角
	 maxHeight: 200,     // 最大高度
	 lineHeight: 200,    // 行高
	 padding: 0,      //内边距
	 itemMarginTop: 20,    //图例每行举上高度
	 squareSymbol: true,
	 x: 0,          //x,y设置图例位置
	 y: -50,
	 align: 'left',   //居左显示
	   labelFormatter: function () {
	           
                 return this.name + ':'+this.percentage+'%'; 
            }
	     
  },

		series: [{
				name: 'Brands',
				colorByPoint: true,
				data: [{
						name: '101实验室车间',
						y: 60,
						sliced: true,
						selected: true
				}, {
						name: '102实验室车间',
						y: 30
				}, {
						name: '103实验室车间',
						y: 10				
				}]
		}]
});
Highcharts.chart('device-state', {
		chart: {
				plotBackgroundColor:'#FFFAFA',
				plotBorderWidth: null,
				plotShadow: false,
				height:350,
				marginLeft:10,
				type: 'pie'
		},

		title: {
				text: '所有车间设备所处各个状态占比汇总'
		},
		tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		plotOptions: {
				pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						 dataLabels: {
                    enabled: true,
                    distance: -55,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    },
                    format: '{y}%'
                },
						showInLegend: true
				}
		},
		
		  colors:[
                        'green',//第一个颜色，欢迎加入Highcharts学习交流群294191384
                        'yellow',//第二个颜色
                        'gray',//第三个颜色
                         'red',//第四个颜色

                      ],
		series: [{
				name: 'Brands',
				colorByPoint: true,
				data: [{
						name: '加工',
						y: 31,
						sliced: true,
						selected: true
				},  {
						name: '待机',
						y: 62
				},
				{
						name: '停机',
						y: 62
				}, {
						name: '故障',
						y: 10				
				}]
		}]
});
  var chart = Highcharts.chart('produce-plan', {
	chart: {
		type: 'bar'
	},
	title: {
		text: '生产计划达成率'
	},
	xAxis: {
		categories: ['101实验室车间', '102实验室车间', '103实验室车间'],
		title: {
			text: null
		}
	},
	yAxis: {
		min: 0,
		max:100,
		tickInterval:2,
		title: {
			text: '百分比（%）',
			align: 'high'
		},
		labels: {
			overflow: 'justify'
		}
	},
	tooltip: {
		valueSuffix: ' %'
	},
	plotOptions: {
		bar: {
			 dataLabels: {
                    enabled: true,
                    distance: -50,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    },
                    format: '{y}%'
                },
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
		name: '生产计达成率',
		data: [20, 40, 73]
	}]
});  
Highcharts.chart('machine1', {
		chart: {
				plotBackgroundColor: '#FFFAFA',
				plotBorderWidth: null,
				plotShadow: false,
				height:200,
				width:200,
				marginLeft:0,
				type: 'pie'
		},
		title: {
				text: ''
		},
		tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		plotOptions: {
				pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						 dataLabels: {
                    enabled: true,
                    distance: -40,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    },
                    format: '{y}%'
                },
						showInLegend: true
				}
		},
		legend: {
    enabled: false,      //不显示图例
	 //layout: 'vertical',   //图例布局：竖直方向排列
	 align:'right',
	 backgroundColor: '#fff',  //图例背景颜色
	 borderRadius: '5',   //图例背景边框圆角
	 //maxHeight: 200,     // 最大高度
	// lineHeight: 200,    // 行高
	 padding: 0,      //内边距
	 itemMarginTop: 20,    //图例每行举上高度
	 squareSymbol: true,
	 x: 0,          //x,y设置图例位置
	 y: 0,
	 
	 //align: 'left',   //居左显示
	     
  },
  colors:[
                        'green',//第一个颜色，欢迎加入Highcharts学习交流群294191384
                        'yellow',//第二个颜色
                        'gray',//第三个颜色
                         'red',//第四个颜色

                      ],

		series: [{
				name: 'Brands',
				colorByPoint: true,
				data: [{
						name: '加工',
						y: 15,
						sliced: true,
						selected: true
				}, {
						name: '待机',
						y: 30
				}, {
						name: '停机',
						y: 0				
				}, {
						name: '故障',
						y: 55				
				}]
		}]
});
Highcharts.chart('machine2', {
		chart: {
				plotBackgroundColor: '#FFFAFA',
				plotBorderWidth: null,
				plotShadow: false,
				height:200,
				width:200,
				marginLeft:0,
				type: 'pie'
		},
		title: {
				text: ''
		},
		tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		plotOptions: {
				pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						 dataLabels: {
                    enabled: true,
                    distance: -30,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    },
                    format: '{y}%'
                },
						showInLegend: true
				}
		},
		legend: {
    enabled: false,      //不显示图例
	 //layout: 'vertical',   //图例布局：竖直方向排列
	 align:'right',
	 backgroundColor: '#fff',  //图例背景颜色
	 borderRadius: '5',   //图例背景边框圆角
	 //maxHeight: 200,     // 最大高度
	// lineHeight: 200,    // 行高
	 padding: 0,      //内边距
	 itemMarginTop: 20,    //图例每行举上高度
	 squareSymbol: true,
	 x: 0,          //x,y设置图例位置
	 y: 0,
	 //align: 'left',   //居左显示
	     
  },
  colors:[
                        'green',//第一个颜色，欢迎加入Highcharts学习交流群294191384
                        'yellow',//第二个颜色
                        'gray',//第三个颜色
                         'red',//第四个颜色

                      ],

		series: [{
				name: 'Brands',
				colorByPoint: true,
				data: [{
						name: '加工',
						y: 9,
						sliced: true,
						selected: true
				}, {
						name: '待机',
						y: 11
				}, {
						name: '停机',
						y: 70				
				}, {
						name: '故障',
						y: 10				
				}]
		}]
});
Highcharts.chart('machine3', {
		chart: {
				plotBackgroundColor: '#FFFAFA',
				plotBorderWidth: null,
				plotShadow: false,
				height:200,
				width:200,
				marginLeft:0,
				type: 'pie'
		},
		title: {
				text: ''
		},
		tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		plotOptions: {
				pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						 dataLabels: {
                    enabled: true,
                    distance: -30,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    },
                    format: '{y}%'
                },
						showInLegend: true
				}
		},
		legend: {
    enabled: false,      //不显示图例
	 //layout: 'vertical',   //图例布局：竖直方向排列
	 align:'right',
	 backgroundColor: '#fff',  //图例背景颜色
	 borderRadius: '5',   //图例背景边框圆角
	 //maxHeight: 200,     // 最大高度
	// lineHeight: 200,    // 行高
	 padding: 0,      //内边距
	 itemMarginTop: 20,    //图例每行举上高度
	 squareSymbol: true,
	 x: 0,          //x,y设置图例位置
	 y: 0,
	 //align: 'left',   //居左显示
	     
  },
  colors:[
                        'green',//第一个颜色，欢迎加入Highcharts学习交流群294191384
                        'yellow',//第二个颜色
                        'gray',//第三个颜色
                         'red',//第四个颜色

                      ],

		series: [{
				name: 'Brands',
				colorByPoint: true,
				data: [{
						name: '加工',
						y: 20,
						sliced: true,
						selected: true
				}, {
						name: '待机',
						y: 30
				}, {
						name: '停机',
						y: 40				
				}, {
						name: '故障',
						y: 10				
				}]
		}]
});
Highcharts.chart('machine4', {
		chart: {
				plotBackgroundColor: '#FFFAFA',
				plotBorderWidth: null,
				plotShadow: false,
				height:200,
				width:200,
				marginLeft:0,
				type: 'pie'
		},
		title: {
				text: ''
		},
		tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		plotOptions: {
				pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						 dataLabels: {
                    enabled: true,
                    distance: -30,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    },
                    format: '{y}%'
                },
						showInLegend: true
				}
		},
		legend: {
    enabled: false,      //不显示图例
	 //layout: 'vertical',   //图例布局：竖直方向排列
	 align:'right',
	 backgroundColor: '#fff',  //图例背景颜色
	 borderRadius: '5',   //图例背景边框圆角
	 //maxHeight: 200,     // 最大高度
	// lineHeight: 200,    // 行高
	 padding: 0,      //内边距
	 itemMarginTop: 20,    //图例每行举上高度
	 squareSymbol: true,
	 x: 0,          //x,y设置图例位置
	 y: 0,
	 //align: 'left',   //居左显示
	     
  },
  colors:[
                        'green',//第一个颜色，欢迎加入Highcharts学习交流群294191384
                        'yellow',//第二个颜色
                        'gray',//第三个颜色
                         'red',//第四个颜色

                      ],

		series: [{
				name: 'Brands',
				colorByPoint: true,
				data: [{
						name: '加工',
						y: 10,
						sliced: true,
						selected: true
				}, {
						name: '待机',
						y: 60
				}, {
						name: '停机',
						y: 30				
				}, {
						name: '故障',
						y: 0				
				}]
		}]
});
Highcharts.chart('machine5', {
		chart: {
				plotBackgroundColor: '#FFFAFA',
				plotBorderWidth: null,
				plotShadow: false,
				height:200,
				width:200,
				marginLeft:0,
				type: 'pie'
		},
		title: {
				text: ''
		},
		tooltip: {
				pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		plotOptions: {
				pie: {
						allowPointSelect: true,
						cursor: 'pointer',
						 dataLabels: {
                    enabled: true,
                    distance: -30,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    },
                    format: '{y}%'
                },
						showInLegend: true
				}
		},
		legend: {
    enabled: false,      //不显示图例
	 //layout: 'vertical',   //图例布局：竖直方向排列
	 align:'right',
	 backgroundColor: '#fff',  //图例背景颜色
	 borderRadius: '5',   //图例背景边框圆角
	 //maxHeight: 200,     // 最大高度
	// lineHeight: 200,    // 行高
	 padding: 0,      //内边距
	 itemMarginTop: 20,    //图例每行举上高度
	 squareSymbol: true,
	 x: 0,          //x,y设置图例位置
	 y: 0,
	 //align: 'left',   //居左显示
	     
  },
  colors:[
                        'green',//第一个颜色，欢迎加入Highcharts学习交流群294191384
                        'yellow',//第二个颜色
                        'gray',//第三个颜色
                         'red',//第四个颜色

                      ],

		series: [{
				name: 'Brands',
				colorByPoint: true,
				data: [{
						name: '加工',
						y: 80,
						sliced: true,
						selected: true
				}, {
						name: '待机',
						y: 10
				}, {
						name: '停机',
						y: 5				
				}, {
						name: '故障',
						y: 5				
				}]
		}]
});
 </script>

</body>
</html>