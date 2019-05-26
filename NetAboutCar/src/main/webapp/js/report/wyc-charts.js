
$(function(){

	/*$('.change-icon').click(function(){
	});
*/
})


	function random(ii,rnd,max,min){
		var data=[];
		if(min==undefined)min=0;
		for(i=0;i<ii;i++){
			data[i]=Math.round(Math.random()*max+min,rnd);
		}
		if(ii==1){
			return data[0];
		}else
			return data;
	}

var multicharts={
		selectLoc:'全省',
		theme:'dark',
		graphics_funs:[],  //其他图形刷新接口函数
		select_date:'',
		cities:[]
}

multicharts.create1=function(){

	  var option={
	          		title : {
	            		    text: multicharts.selectLoc+'一季度订单规模',
	            		    x:'center',
	          		    textStyle:{
	          		    	fontSize:'9'
	          		    }
	         		},
	  			    tooltip : {
	  			        trigger: 'axis',
	  			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	  			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	  			        }
	  			    },
	  			    legend: {
	  			    	orient : 'horizontal',
	  			    	x:'center',
	  			    	y:'bottom',
	  			        data:['驾驶员数','车辆数','订单数'],
	  			        textStyle:{
	  			        	fontSize:'9'
	  			        }
	  			    },
	  			    calculable : true,
	  			    xAxis : [
	  			        {
	  			            type : 'category',
	  			            data : ['1','2','3','4','当月']
	  			        }
	  			    ],
	  			    yAxis : [
	  			        {
	  			            type : 'value'
	  			        }
	  			    ],
	  			    series:[]
	  }

	  option.series[0]={
				name:'驾驶员数',
				type:'bar',
				stack:'季度',
				data:random(5,0,10000)
			}
	  option.series[1]={
				name:'车辆数',
				type:'bar',
				stack:'季度',
				data:random(5,0,10000)  
	  }
	  option.series[2]={
			  name:'订单数',
			  type:'line',
			  itemStyle:{
				  normal:{
					  color:'yellow',
				  }
			  },
			  data:random(5,0,10000)
	  }
	  
	 var myChart = echarts.init(document.getElementById('chart1'),multicharts.theme);  
	 myChart.setOption(option,true);
}

multicharts.create2=function(city){
	
	var geo=multicharts.geoJson.features;
	var xAxisData=[];
	var cityLen=geo.length<5?geo.length:5;
	for(var i=0;i<cityLen;i++){
		xAxisData[i]=geo[i].properties.name;
	}

	  var option={
	          		title : {
	            		    text: multicharts.selectLoc+'一季度订单规模前'+cityLen+'位',
		            		x:'center',
		          		    textStyle:{
		          		    	fontSize:'9'
		          		    }
	         		    },
	  			    tooltip : {
	  			        trigger: 'axis',
	  			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	  			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	  			        }
	  			    },
	  			    legend: {
	  			    	orient : 'horizontal',
	  			    	x:'center',
	  			    	y:'bottom',
	  			        data:['订单数'],
	  			        textStyle:{
	  			        	fontSize:'8'
	  			        }
	  			    },
	  			    calculable : true,
	  			    xAxis : [
	  			        {
	  			            type : 'category',
	  			            data :xAxisData
	  			        }
	  			    ],
	  			    yAxis : [
	  			        {
	  			            type : 'value'
	  			        }
	  			    ],
	  			    series :[]
	  }

	  option.series[0]={
			  name:'订单数',
			  type:'bar',
			  data:random(xAxisData.length,0,10000)
	  }
	  
      var myChart2 = echarts.init(document.getElementById('chart2'),multicharts.theme);  
      myChart2.setOption(option, true);	  
}


multicharts.create3=function(city){
	option = {
		    title: {
		        text: multicharts.selectLoc+'一季度服务质量图',
      		    textStyle:{
      		    	fontSize:'9'
      		    }
		    },
		    legend: {
		        orient: 'vertical',
		        x: 'right',
		        data: ['乘客满意度','投诉率']
		    },
		    radar: {
		        // shape: 'circle',
		        indicator: [
		           { name: '服务质量', max: 30000},
		           { name: '驾驶员', max: 30000},
		           { name: '车辆', max: 30000},
		           { name: '平台', max: 30000}
		        ]
		    },
		    series: [{
		        name: '乘客满意度',
		        type: 'radar',
		        data : [
		            {
		                value : random(4,0,30000),
		                name : '乘客满意度',
		                itemStyle:{
		                	normal:{
		                		color:'blue'
		                	}
		                }
		            },
		             {
		                value : random(4,0,30000),
		                name : '投诉率',
		                itemStyle:{
		                	normal:{
		                		color:'yellow'
		                	}
		                }
		            }
		        ]
		    }]
		};
	

    var myChart2 = echarts.init(document.getElementById('chart3'),multicharts.theme);  
    myChart2.setOption(option, true);	  
}

multicharts.create4=function(city){
	//app.title = '嵌套环形图';

	var legendData=['滴滴','优步','达人','超速','神速','牛掰'];
	var data=[{name:'',value:0, selected:true},{name:'',value:0},{name:'',value:0}];
	var data1=[];
	for(var i=0;i<legendData.length;i++){
		var value=random(1,0,10000);
		data1[i]={
			name:legendData[i],value:value
		}
		if(value>data[0].value){
			data[2].value=data[1].value;
			data[2].name=data[1].name;
			data[1].value=data[0].value;
			data[1].name=data[0].name
			data[0].value=value;
			data[0].name=legendData[i];
		}else if(value>data[1].value){
			data[2].value=data[1].value;
			data[2].name=data[1].name;
			data[1].value=value;
			data[1].name=legendData[i];
		}else if(value>data[2].value){
			data[2].value=value;
			data[2].name=legendData[i];
		}
	}
	
	option = {
			title:{
				text:multicharts.selectLoc+'一季度营收分布及三强图（万元）',
      		    textStyle:{
      		    	fontSize:'9'
      		    }
			},
	    tooltip: {
	        trigger: 'item',
	        formatter: "{a} <br/>{b}: {c} ({d}%)"
	    },
	    legend: {
	        orient: 'vertical',
	        x: 'right',
	        data:legendData
	    },
	    series: [
	        {
	            name:'前三强 营业收入',
	            type:'pie',
	            selectedMode: 'single',
	            radius: [0, '30%'],

	            label: {
	                normal: {
	                    position: 'inner'
	                }
	            },
	            labelLine: {
	                normal: {
	                    show: false
	                }
	            },
	            data:data
	        },
	        {
	            name:'营业收入',
	            type:'pie',
	            radius: ['40%', '55%'],

	            data:data1
	        }
	    ]
	};
	

    var myChart2 = echarts.init(document.getElementById('chart4'),multicharts.theme);  
    myChart2.setOption(option, true);	 
}


multicharts.create5=function(city){
	var yMax=500000;
	
	var option = {
			title:{
				text:multicharts.selectLoc+'一季度运营里程前三强（公里）',
      		    textStyle:{
      		    	fontSize:'9'
      		    }
			},
		    color: ['#ff3d3d', '#00a0e9', '#f603ff', '#00b419', '#5f52a0'],
		    tooltip: {
		        trigger: 'axis'
		    },
		    legend: {
		        x: 'right',
		        padding: [10, 20, 0, 20],
		        data: ['滴滴','快的','优步'],
		        selected: {
		            '滴滴': true,		            
		        }
		    },
		    grid: {
		        left: '0',
		        right: '3%',
		        bottom: '3%',
		        top: '13%',
		        containLabel: true
		    },
		    xAxis: {
		        type: 'category',
		        boundaryGap: false,
		        splitLine: { //网格线
		            show: true,
		            lineStyle: {
		                color: ['#b1b1b1'],
		                type: 'dashed'
		            }
		        },
		        data: ['1月上','1月下', '2月上','2月下', '3月上','3月下', '当月']
		    },
		    yAxis: {
		        splitLine: { //网格线
		            show: true,
		            lineStyle: {
		                color: ['#b1b1b1'],
		                type: 'dashed'
		            }
		        }
		    },
		    series: [{
		        name: '滴滴',
		        type: 'line',
		        data: random(7,1,yMax),
		        label: {
		            normal: {
		                show: true,
		                position: 'top' //值显示
		            }
		        }
		    },{
		        name: '快的',
		        type: 'line',
		        data: random(7,1,yMax),
		        label: {
		            normal: {
		                show: true,
		                position: 'top' //值显示
		            }
		        }
		    },{
		        name: '优步',
		        type: 'line',
		        data: random(7,1,yMax),
		        label: {
		            normal: {
		                show: true,
		                position: 'top' //值显示
		            }
		        }
		    }]
		};
	

	
    var myChart2 = echarts.init(document.getElementById('chart5'),multicharts.theme);  
    myChart2.setOption(option, true);	 
}



multicharts.create6=function(){
	
	var dataAxis = [];
	for(var i=0;i<25;i++)dataAxis[i]=i;
	
	var data = [];

	var yMax =random(1,0,50,50);
	var dataShadow = [];

	for(var i=0;i<25;i++){
		data[i]=random(1,0,yMax);
	}
	
	

	for (var i = 0; i < data.length; i++) {
	    dataShadow.push(yMax);
	}

	option = {
	    title: {
	        text: multicharts.selectLoc+'一季度驾驶员活跃度（24小时均值）',
	        subtext: '24小时驾驶员活跃情况',
  		    textStyle:{
  		    	fontSize:'9'
  		    }
	    },
	    xAxis: {
	        data: dataAxis,
	        axisLabel: {
	            inside: true,
	            textStyle: {
	                color: '#fff'
	            }
	        },
	        axisTick: {
	            show: false
	        },
	        axisLine: {
	            show: false
	        },
	        z: 10
	    },
	    yAxis: {
	        axisLine: {
	            show: false
	        },
	        axisTick: {
	            show: false
	        },
	        axisLabel: {
	            textStyle: {
	                color: '#999'
	            }
	        }
	    },
	    dataZoom: [
	        {
	            type: 'inside'
	        }
	    ],
	    series: [
	        { // For shadow
	            type: 'bar',
	            itemStyle: {
	                normal: {color: 'rgba(0,0,0,0.05)'}
	            },
	            barGap:'-100%',
	            barCategoryGap:'40%',
	            data: dataShadow,
	            animation: false
	        },
	        {
	            type: 'bar',
	            label:{
	            	normal:{
		            	show:true,	       
		            	position:'top',
		            	textStyle:{
		            		color:'rgb(24, 141, 240)'
		            	}
	            	}	            	
	            },
	            itemStyle: {
	                normal: {
	                    color: new echarts.graphic.LinearGradient(
	                        0, 0, 0, 1,
	                        [
	                            {offset: 0, color: '#83bff6'},
	                            {offset: 0.5, color: '#188df0'},
	                            {offset: 1, color: '#188df0'}
	                        ]
	                    )
	                },
	                emphasis: {
	                    color: new echarts.graphic.LinearGradient(
	                        0, 0, 0, 1,
	                        [
	                            {offset: 0, color: '#2378f7'},
	                            {offset: 0.7, color: '#2378f7'},
	                            {offset: 1, color: '#83bff6'}
	                        ]
	                    )
	                }
	            },
	            data: data
	        }
	    ]
	};

    var myChart = echarts.init(document.getElementById('chart6'),multicharts.theme);  
    myChart.setOption(option, true);	 

    // Enable data zoom when user click bar.
	var zoomSize = 6;
	myChart.on('click', function (params) {
	    console.log(dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)]);
	    myChart.dispatchAction({
	        type: 'dataZoom',
	        startValue: dataAxis[Math.max(params.dataIndex - zoomSize / 2, 0)],
	        endValue: dataAxis[Math.min(params.dataIndex + zoomSize / 2, data.length - 1)]
	    });
	});
	
	
}


multicharts.create7=function(){
	

	
	option = {
		    title: {
		        text: multicharts.selectLoc+'一季度各时间段出车率与出车数',
	  		    textStyle:{
	  		    	fontSize:'9'
	  		    }
		    },
		    tooltip : {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross',
		            label: {
		                backgroundColor: '#6a7985'
		            }
		        }
		    },
		    grid: {
		        left: '3%',
		        right: '4%',
		        bottom: '3%',
		        containLabel: true
		    },
		    xAxis : [
		        {
		            type : 'category',
		            boundaryGap : false,
		            data : ['夜间','早高峰','10点-16点','晚高峰','其他']
		        }
		    ],
		    yAxis : [
		        {
		            type : 'value'
		        }
		    ],
		    series : [
		        {
		            name:'出车数',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:random(5,0,10000)
		        },
		        {
		            name:'订单数',
		            type:'line',
		            stack: '总量',
		            areaStyle: {normal: {}},
		            data:random(5,0,10000)
		        }
		    ]
		};

	
	
    var myChart = echarts.init(document.getElementById('chart7'),multicharts.theme);  
    myChart.setOption(option, true);	 

	
	
}


multicharts.createBar=function(title,curr,data){
	var legendData=[],series=[];
	
	var xAxisData=[];
	for(var i=0;i<(data.length>5?5:data.length);i++){
		var d=eval('data[i].'+curr.dimCode);
		xAxisData.push(d);
	}
	
	for(var i=0;i<curr.valueTypes.length;i++){
		legendData.push(curr.valueTypes[i].dimName);


		var seriesData=[];

		for(var ii=0;ii<(data.length>5?5:data.length);ii++){
			var d=eval('data[ii].'+curr.valueTypes[i].dimCode);
			seriesData.push(d);
		}
				
		  series.push({

				name: curr.valueTypes[i].dimName,
				type:'bar',
				stack:'季度',
				//barWidth:45,
				data:seriesData
			  
		  });
	}

	console.clear();
	console.log(legendData);
	console.log(xAxisData);
	console.log(series);
	
	  var option={
	          		title : {
	            		    text: multicharts.selectLoc+title,
	            		    x:'center',
	          		    textStyle:{
	          		    	fontSize:'9'
	          		    }
	         		},
	  			    tooltip : {
	  			        trigger: 'axis',
	  			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	  			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	  			        }
	  			    },
	  			    legend: {
	  			    	orient : 'horizontal',
	  			    	x:'center',
	  			    	y:'bottom',
	  			        data:legendData,
	  			        textStyle:{
	  			        	fontSize:'9'
	  			        }
	  			    },
	  			    calculable : true,
	  			    xAxis : [
	  			        {
	  			            type : 'category',
	  			            data : xAxisData
	  			        }
	  			    ],
	  			    yAxis : [
	  			        {
	  			            type : 'value'
	  			        }
	  			    ],
	  			    series:series
	  }

	  
	  
	 var myChart = echarts.init(document.getElementById(multicharts.selectChartId),multicharts.theme);  
	 myChart.setOption(option,true);
}



multicharts.createLine=function(title,curr,data){
var legendData=[],series=[];
	
	var xAxisData=[];
	for(var i=0;i<(data.length>5?5:data.length);i++){
		var d=eval('data[i].'+curr.dimCode);
		xAxisData.push(d);
	}
	
	for(var i=0;i<curr.valueTypes.length;i++){
		legendData.push(curr.valueTypes[i].dimName);


		var seriesData=[];

		for(var ii=0;ii<(data.length>5?5:data.length);ii++){
			var d=eval('data[ii].'+curr.valueTypes[i].dimCode);
			seriesData.push(d);
		}
				
		  series.push({

				name: curr.valueTypes[i].dimName,
				type:'line',
				stack:'季度',
				//barWidth:45,
				data:seriesData
			  
		  });
	}
	
	  var option={
	          		title : {
	            		    text: multicharts.selectLoc+title,
	            		    x:'center',
	          		    textStyle:{
	          		    	fontSize:'9'
	          		    }
	         		},
	  			    tooltip : {
	  			        trigger: 'axis',
	  			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	  			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	  			        }
	  			    },
	  			    legend: {
	  			    	orient : 'horizontal',
	  			    	x:'center',
	  			    	y:'bottom',
	  			        data:legendData,
	  			        textStyle:{
	  			        	fontSize:'9'
	  			        }
	  			    },
	  			    calculable : true,
	  			    xAxis : [
	  			        {
	  			            type : 'category',
	  			            data : xAxisData
	  			        }
	  			    ],
	  			    yAxis : [
	  			        {
	  			            type : 'value'
	  			        }
	  			    ],
	  			    series:series
	  }

	  
	  
	 var myChart = echarts.init(document.getElementById(multicharts.selectChartId),multicharts.theme);  
	 myChart.setOption(option,true);
}


multicharts.createPie=function(title,curr,data){

	var legendData=[],series=[],seriesData=[];
		
	for(var i=0;i<(data.length>6?6:data.length);i++){
		legendData.push(eval('data[i].'+curr.dimCode));
		seriesData.push({value:eval('data[i].'+curr.valueTypes[0].dimCode),name:eval('data[i].'+curr.dimCode)});
	}
	

	  series.push({
          name:title,
          type:'pie',
          radius : [15, 50],
          center : ['60%', '50%'],
          roseType : 'area',
          data:seriesData
      });
	
	var option = {
		    title : {
		        text: multicharts.selectLoc+title+'前五位',
		        //subtext: '纯属虚构',
		        x:'left',
      		    textStyle:{
      		    	fontSize:'9'
      		    }
		    },
		    tooltip : {
		        trigger: 'item',
		        formatter: "{a} <br/>{b} : {c} ({d}%)"
		    },
		    legend: {
		        x : 'left',
		        y:'bottom',
		        orient: 'vertical',
		        data:legendData
		    },
		    calculable : true,
		    series : series
		}
	

	 var myChart = echarts.init(document.getElementById(multicharts.selectChartId),multicharts.theme);  
	 myChart.setOption(option,true);
}

multicharts.createRadar=function(title,legends,xAxisData){

	var legendData=[],series=[],seriesData=[];
	
	var len=xAxisData.length<5?xAxisData.length:5;
	
	for(var i=0;i<len;i++){
		legendData.push(xAxisData[i]);
		seriesData.push({value:random(1,0,29112),name:xAxisData[i]});
	}
	

	  series.push({
          name:title,
          type:'pie',
          radius : [15, 50],
          center : ['60%', '50%'],
          roseType : 'area',
          data:seriesData
      });
	
	  
	var option = {
		    title: {
		        text: multicharts.selectLoc+title,
      		    textStyle:{
      		    	fontSize:'9'
      		    }
		    },
		    legend: {
		        data: legendData
		    },
		    radar: [
		        {
		            indicator: [
		                { text: '语文', max: 150 },
		                { text: '数学', max: 150 },
		                { text: '英语', max: 150 },
		                { text: '物理', max: 120 },
		                { text: '化学', max: 108 },
		                { text: '生物', max: 72 }
		            ],
		            center: ['75%', '50%'],
		            radius: 120
		        }
		    ],
		    series: [
		        {
		            name: '雷达图',
		            type: 'radar',
		            itemStyle: {
		                emphasis: {
		                    // color: 各异,
		                    lineStyle: {
		                        width: 4
		                    }
		                }
		            },
		            data: [
		                {
		                    value: [100, 8, 0.40, -80, 2000],
		                    name: '图一',
		                    symbol: 'rect',
		                    symbolSize: 5,
		                    lineStyle: {
		                        normal: {
		                            type: 'dashed'
		                        }
		                    }
		                },
		                {
		                    value: [60, 5, 0.30, -100, 1500],
		                    name: '图二',
		                    areaStyle: {
		                        normal: {
		                            color: 'rgba(255, 255, 255, 0.5)'
		                        }
		                    }
		                }
		            ]
		        },
		        {
		            name: '成绩单',
		            type: 'radar',
		            radarIndex: 1,
		            data: [
		                {
		                    value: [120, 118, 130, 100, 99, 70],
		                    name: '张三',
		                    label: {
		                        normal: {
		                            show: true,
		                            formatter:function(params) {
		                                return params.value;
		                            }
		                        }
		                    }
		                },
		                {
		                    value: [90, 113, 140, 30, 70, 60],
		                    name: '李四',
		                    areaStyle: {
		                        normal: {
		                            opacity: 0.9,
		                            color: new echarts.graphic.RadialGradient(0.5, 0.5, 1, [
		                                {
		                                    color: '#B8D3E4',
		                                    offset: 0
		                                },
		                                {
		                                    color: '#72ACD1',
		                                    offset: 1
		                                }
		                            ])
		                        }
		                    }
		                }
		            ]
		        }
		    ]
		}

	 var myChart = echarts.init(document.getElementById(multicharts.selectChartId),multicharts.theme);  
	 myChart.setOption(option,true);
}

angular.module('wyc',[]).controller('WycController',function($http,$scope){

	$scope.doGetDataCatalog=function(chartId){
		$http({method:'post',url:"findAllDataCatalog.action",headers:{
	    	'Content-Type': 'application/x-www-form-urlencoded'
	    }}).success(function (response) {
	    	$scope.lists=response;
	    	//console.log(response);
	    });
		
		$('#myModal').modal('show');
		multicharts.selectChartId=chartId;//$(this).attr('opt-chart');
	}
	
	$scope.curr={}
    $scope.curr.graphicTypes=[{type:'bar',text:'柱图'},{type:'line',text:'折线图'},{type:'pie',text:'饼图'}];//,{type:'radar',text:'雷达图'}]
	$scope.curr.periodTypes=[{type:'year',text:'年度'},{type:'quarter',text:'季度'},{type:'month',text:'月度'}];
	$scope.curr.contrastTypes=[{type:'1',text:'同比'},{type:'2',text:'环比'}];
	
	$scope.doClickGraphicType=function(g){
		$scope.curr.graphicType=g.type;
	}
	
	$scope.doClickValueType=function(v){
		
	}
	
	$scope.doChangeGraphic=function(){
		
		var title=$scope.curr.sjzl.dataTitle+getTypeName($scope.curr.periodType,$scope.curr.periodTypes)+
		getTypeName($scope.curr.contrastType,$scope.curr.contrastTypes);
		
		var valueCodes="";
		var valueTypes=[];
		if($scope.curr.graphicType=='pie'){
			valueCodes+=$scope.curr.values[parseInt($scope.curr.valueType)].dimCode;
			$scope.curr.valueTypes=[($scope.curr.values[parseInt($scope.curr.valueType)])];	
		}else{
			$('input[name=valueType]:checked').each(function(){
				//valueTypes.push({valueCode:$(this).val(),valueName:$(this).attr('value-name')});
				valueCodes+=","+$(this).val();
				valueTypes.push($scope.curr.values[parseInt($(this).attr("index"))]);
			});
			$scope.curr.valueTypes=valueTypes;			
		}
		
		var xAxisData=[];
		if($scope.curr.dimCode=='DATE'){
			if($scope.curr.periodType=='year'){
				var year=new Date().getFullYear();
				for(var i=0;i<4;i++){
					xAxisData.unshift(year-i);
				}
			}else if($scope.curr.periodType=='quarter'){
				var quarter_chinese=['一','二','三','四'];
				for(var i=0;i<4;i++){
					xAxisData.push(quarter_chinese[i]+'季度');
				}
			}else if($scope.curr.periodType=='month'){
				var month=new Date().getMonth()+1;
				xAxisData.push('当月');
				for(var i=1;i<month;i++){
					xAxisData.unshift(month-i+'月');
				}
			}
		}else if($scope.curr.dimCode=='CITY'){
			xAxisData=multicharts.cities;
		}
		
		$http.post("statistics2.action?periodType="+$scope.curr.periodType+"contrastType="+$scope.curr.contrastType
				+"&dataCode="+$scope.curr.sjzl.dataCode+"&dimCode="+$scope.curr.dimCode+"&valueCodes="+valueCodes
			).success(function (response) {
				
					console.clear();
			    	console.log($scope.curr);    
			console.log(response);

			if($scope.curr.graphicType=='bar'){					
							
				multicharts.createBar(title,$scope.curr,response);	
				
			}else if($scope.curr.graphicType=='line'){	
				
				multicharts.createLine(title,$scope.curr,response);	
				
			}else if($scope.curr.graphicType=='pie'){	

				var title=$scope.curr.sjzl.dataTitle+getTypeName($scope.curr.periodType,$scope.curr.periodTypes);
				
				multicharts.createPie(title,$scope.curr,response);	
			}
			
	    	
	    });
    	
		$('#myModal').modal('hide');
		$('#myModal2').modal('hide');
	
	}
	
    $scope.doSelectChart=function(sjzl){
		$scope.curr.sjzl=sjzl;
		
		$http.post("findAllDeminsion.action?fieldType=DEMINSION&dataCode="+sjzl.dataCode).success(function (response) {
	    	
			$scope.curr.dims=response;	    	
	    	
	    });
		
		$http.post("findAllDeminsion.action?fieldType=VALUE&dataCode="+sjzl.dataCode).success(function (response) {
	    	
			$scope.curr.values=response;    	
	    	
	    });
		
		$('#myModal2').modal('show');		
    	console.log($scope.curr);    	
		
	}
        
});


function getTypeName(type,types){
	for(var i=0;i<types.length;i++){
		if(type==types[i].type){
			return types[i].text;
		}
	}
}