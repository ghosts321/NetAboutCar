
multicharts.createMap=function(ec){	
	var myChart = echarts.init(document.getElementById("map"),multicharts.theme);
	var url='../echarts3/master/map/json/province';
	
	function load(param){
		console.log(param);
		
		$.getJSON(param.data.jsonfile, function (geoJson) {
		    console.log(geoJson);
		    multicharts.geoJson=geoJson;
		    
			echarts.registerMap(param.name, geoJson);
			
			multicharts.selectLoc=param.name;
    		var data=[],yMax=Math.round(Math.random()*10000);
    		for(var i=0;i<geoJson.features.length;i++){
    			var _city=geoJson.features[i];
    			data[i]={
    				name:_city.properties.name,
    				value:random(1,0,yMax),
    				jsonfile:url+'/city/'+_city.id+'.json'
    			}
    			multicharts.cities[i]=_city.properties.name;
    		}
    		//console.log(data);
    		
			var option = {
				    title: {
				        text: multicharts.selectLoc+'网约车地理分布图',
				        subtext: '',
				        left: 'center',
				        textStyle:{
			  		    	fontSize:12
			  		    }
				    },
				    tooltip: {
				        trigger: 'item'
				    },
				    legend: {
				        orient: 'vertical',
				        left: 'left',
				        data:['驾驶员数','车辆数','完成订单数']
				    },
				    visualMap: {
				        min: 0,
				        max: yMax,
				        left: 'left',
				        top: 'bottom',
				        text: ['高','低'],           // 文本，默认为数值文本
				        calculable: true
				    },
				    series: []
				};
						
			option.series[0]=
	        {
		            name: '驾驶员数',
		            type: 'map',
		            mapType:param.name,
		            roam: false,
		            selectedMode : 'single',
		            label: {
		                normal: {
		                    show: true,
		                    textStyle:{
		                    	color:'white'
		                    }
		                },
		                emphasis: {
		                    show: true
		                }
		            },
		            data:data
		        }
			
			
	        myChart.setOption(option, true);
	        myChart.on('click', function (param){//单击省份事件
	        	load(param);
	        });

            multicharts.create1();
            multicharts.create2(11);
            multicharts.create3('jiaozuoshi');
            multicharts.create4('jiaozuoshi');
            multicharts.create5('jiaozuoshi');
            multicharts.create6('jiaozuoshi');
            multicharts.create7();
	        
		});
	}

	load({name:'河南',data:{jsonfile:url+'/410000.json'}});
}