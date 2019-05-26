angular.module('wyc',[]).controller('WycController',function($http,$scope){
	
	
	$scope.provinces=[{areaCode:'410000',areaName:'河南省',areaLevel:'1'}];
	$scope.compare_types=['环比','同比'];//[{typecode:'nextby',typename:'环比'},{typecode:'same',typename:'同比'}];
	$scope.stat_types=['年度','季度','月度','每天'];//[{typecode:'year',typename:'年度'},{typecode:'quarter',typename:'季度'},{typecode:'month',typename:'月度'}];
	$scope.quarters=['一季度','二季度','三季度','四季度'];
	
	$scope.pics=[{text:'饼图',name:'pie'},{text:'柱图',name:'bar'},{text:'折线图',name:'line'},{text:'雷达图',name:'rador'},{text:'分时图',name:'timeline'}];
	$scope.fieldTypes=[{text:'维度字段',value:'DEMINSION'},{text:'值字段',value:'VALUE'}];

	$scope.jdd={fieldType:'DEMINSION'}	
	
	$scope.dims={AREACODE:'地区代码',AREANAME:'地区名称',PROVINCE:'省级',CITY:'市级',COUNTRY:'区级'};
	
	$scope.dims.DATE={text:'日期',title:'当前维度层级',dimTypes:[{value:'MINUTE',text:'分'},{value:'DAY',text:'天'},{value:'MONTH',text:'月'},{value:'QUARTER',text:'季'},{value:'YEAR',text:'年'}]}

    $scope.select={};
	$scope.period={};
	
    $http.post("findDataCatalog.action?dataCode="+jdc.dataCode).success(function (response) {
    	$scope.sjzl=response;
    	jdc=response;
    });
	
    $http.post("findAllDeminsion.action?dataCode="+jdc.dataCode+"&fieldType=DEMINSION").success(function (response) {
    	$scope.dims=response;
    	$scope.dims_=[]
    	
    	$scope.graphic_dims=[];
    	for(var i=0;i<response.length;i++){
    		var dim =response[i];
    		dim.canDraw=true;
    		if(dim.dimCode=='DATE'){
    			$scope.hasDimDate=true;
    			$scope.period=dim;
    		}else if(dim.dimCode=='PROVINCE'){
    			$scope.hasDimProvince=true;
    			$scope.province=dim;
    		}else if(dim.dimCode=='CITY'){
    			$scope.hasDimProvince=true;
    			$scope.hasDimCity=true;    	
    			$scope.city=dim;
    		}else if(dim.dimCode=='COUNTRY'){
    			$scope.hasDimProvince=true;
    			$scope.hasDimCity=true;   
    			$scope.hasDimCountry=true;     	
    			$scope.country=dim;	    			
    		}
    		
    		if(dim.dataUrl!='' && dim.dataUrl!=null){
    			$scope.doGetDeminsionData(dim);
    			$scope.dims_.push(dim);    			
    		}
    	}
    });
    
    $scope.doGetDeminsionData=function(dim){
	    $http.post(path+'/'+dim.dataUrl).success(function (response) {
	    	dim.data=[];
	    	for(var i=0;i<response.length;i++){
	    		var data={code:eval('response[i].'+dim.dataCodeField),name:eval('response[i].'+dim.dataNameField)};// eval('{code:"'+response[i]+'.'+dim.dataCodeField+",name:""}');
	    		dim.data.push(data);
	    	}
	    });
    }
    
	
    $http.post("findAllDeminsion.action?dataCode="+jdc.dataCode+"&fieldType=VALUE").success(function (response) {
    	$scope.values=response;    	
    });
    
    $scope.doChangeCompareType=function(a){
    	$('.search-options-compare-type .search-option-select').removeClass('search-option-select');
    	$('.compare-type-'+a).addClass('search-option-select');
    	$scope.select.compare_type=a;
    	if(a=='同比' && $scope.select.stat_type=='季度'){
    		$('.quarter-start').val('');
    		delete $scope.select.startQuarter;
    	}
    }


    
    $scope.doChangeStatType=function(a){
    	$scope.select.stat_type=a;
    	
    	$('.search-options-stat-type .search-option-select').removeClass('search-option-select');
    	$('.stat-type-'+a).addClass('search-option-select');
    	$('.date-picker').val('');
    	
    	if(a=='年度' || a=='季度'){
    		$('.date-picker').datepicker('remove');
    		$('.date-picker').datepicker({format:'yyyy',startView:2,maxViewMode:2,minViewMode:2});
    		$('.date-picker').datepicker('setDate',new Date());
    		$('.date-picker').css('width','55px');
    	}else if(a=='月度'){
    		$('.date-picker').datepicker('remove');
    		$('.date-picker').datepicker({format:'yyyy-mm',startView:1,maxViewMode:1,minViewMode:1});
    		$('.date-picker').datepicker('setDate',new Date());  
    		$('.date-picker').css('width','75px');  		
    	}else if(a=='每天'){
    		$('.date-picker').datepicker('remove');
    		$('.date-picker').datepicker({format:'yyyy-mm-dd',startView:0});  
    		$('.date-picker').datepicker('setDate',new Date());
    		$('.date-picker').css('width','95px');  		
    	}
		$scope.period.startDate=$('.data-date-start').val();
		$scope.period.endDate=$('.data-date-end').val();
    }
    
    $scope.doChangeArea=function(a){
	
    	var levelname='provinces';
    	if(a.areaLevel=='1'){
    		$scope.select.province=a;
    		$scope.province.select=a;
    	}else if(a.areaLevel=='2'){
    		$scope.select.city=a;
    		$scope.city.select=a;
    		levelname='cities';
    	}
    	else if(a.areaLevel=='3'){
    		$scope.select.country=a;
    		$scope.country.select=a;
    		levelname='countries';
    	}
    	
    	
    	var selected_areaCode=$('.search-options-'+levelname+' .search-option-select').attr('data');
    	$('.search-options-'+levelname+' .search-option-select').removeClass('search-option-select');
    	if(a.areaCode!=selected_areaCode){

        	$('.areacode-'+a.areaCode).addClass('search-option-select');
        	
        	var areaLevel=parseInt(a.areaLevel)+1;
            $http.post("findAllArea.action?pareaCode="+a.areaCode+'&areaLevel='+areaLevel).success(function (response) {
            	if(a.areaLevel=='1'){
                	$scope.cities=response;        		
            	}else if(a.areaLevel=='2'){
            		$scope.countries=response;
            	}
            });
            
    	}else{
    		if(a.areaLevel=='1'){
				delete $scope.cities;
				delete $scope.countries;
				delete $scope.select.province;
				delete $scope.select.city;
				delete $scope.select.country;
				delete $scope.province.select;
				delete $scope.city.select;
				delete $scope.country.select;
    		}else if(a.areaLevel=='2'){
				delete $scope.countries;   
				delete $scope.select.city;
				delete $scope.select.country; 	
				delete $scope.city.select;
				delete $scope.country.select;		
    		}else if(a.areaLevel=='3'){
				delete $scope.select.country; 	
				delete $scope.country.select;    			
    		}
    	}

    	console.clear();
    	console.log($scope.select);
    	console.log($scope);
    }

    $scope.doDrawDim=function(dim){
    	var _data=$('.search-options-draw .search-option-select').attr('data');
    	$('.search-options-draw .search-option-select').removeClass('search-option-select');
    	if($scope.select.draw!=null){
    		delete $scope.select.draw.draw;
    	}
    	
    	$scope.select.draw=dim;
    	dim.draw=true;
    	
    	$('.search-options-draw .draw-'+dim.dimCode).addClass('search-option-select');
    }
    

    $scope.doSelectValue=function(val){
    	var _data=$('.search-options-values .search-option-select').attr('data');
    	$('.search-options-values .search-option-select').removeClass('search-option-select');
    	$scope.select.value=val;

    	$('.search-options-values .value-'+val.dimCode).addClass('search-option-select');
    }
    
    $scope.doChangeDim=function(data,dim,index){
    	var _data=$('.search-options-'+dim.dimCode+' .search-option-select').attr('data');
    	$('.search-options-'+dim.dimCode+' .search-option-select').removeClass('search-option-select');
    	
    	if(_data==data.code){
    		delete dim.select;
    	}else{
        	$('.dim-'+dim.dimCode+'-'+data.code).addClass('search-option-select');
        	dim.select=data;
        	dim.select.index=index;
    	}
    	
    	eval('$scope.select.'+dim.dimCode+'=data');
    	
    	console.clear();
    	console.log($scope);
    }
    
    
    $scope.doStatistics=function(){
    	/*if($scope.select.stat_type!=null){
        	$scope.period.startDate=$scope.select.startDate;
        	$scope.period.endDate=$scope.select.endDate;
        	if($scope.select.stat_type=='季度'){
            	$scope.period.startQuarter=$scope.select.startQuarter;
            	if($scope.select.compare_type=='环比'){
                	$scope.period.endQuarter=$scope.select.endQuarter;    		        		
            	}
        	}
    	}  */  	
    	var fields=[];
    	var dims=[]
    	for(var i in $scope.dims){
    		var dim=$scope.dims[i];
    		
    		if(dim.hasOwnProperty('data')){
    			var _dim=JSON.parse(JSON.stringify(dim));
    			delete _dim.data;
    			dims.push(_dim);
    		}else{
    			dims.push(dim);
    		}
    		
    		if(dim.hasOwnProperty("select") && dim.select.areaCode!=null){
    			 dim.select.code=dim.select.areaCode;
    		}
    		
    	}
    	
    	$.scope=$scope;

	      console.log($scope);

    	$.ajax({
    		  url:'statistics.action',
    		  method: 'POST',  
    		  data:{deminsions:JSON.stringify(dims),compareType:$scope.select.compare_type,
    			  statType:$scope.select.stat_type,values:JSON.stringify([$scope.select.value])},
    		  dataType:'json',
    		  success:function(response){

    			  //$scope.doChangeResultTitle(['11','22','33']);
    		    	 
    			  $scope.result=response;
    			  var title=[];
    			  for(var key in response[0]){
    				  title.push(response[0][key]);
    			  }
    			  $scope.result_title=title;

    			  var result=[];
    			  for(var i=1;i<response.length;i++){
    				  var r=[];
        			  for(var key in response[i]){
        				  r.push(response[i][key]);
        			  }
        			  result.push(r);
    			  }
    			  $scope.result=result;

    			  
    			  $scope.$digest();
    			  
    			  $scope.doCreateCharts(response,$scope.select.draw,$scope.select.value);
    			  
    		      console.clear();
    		      console.log($scope);
    		  }
    	});
    	
    	
    	/*$http.post("statistics.action",{deminsions:JSON.stringify($scope.dims),compareType:$scope.select.compare_type}).success(function (response) {

        });
    	
    	$http({method:'post',url:"statistics.action", data:{deminsions:JSON.stringify($scope.dims),compareType:$scope.select.compare_type},headers:{
 	    	'Content-Type': 'application/x-www-form-urlencoded'
 	    }}).success(function (response) {
 	    	
 	    });  
    	*/	   
    	
    }


    
    $scope.doCreateCharts=function(data,xAxis,legend){
    	var legendData=[legend.dimName];
    	
    	var xAxisData=[],seriesData=[];
    	for(var i=1;i<data.length;i++){
    		for(var key in data[i]){
    			if(key==xAxis.dimNamefield){
    	    		xAxisData.push(data[i][key]);
    			}else if(key==legend.dimFieldname){
    	    		seriesData.push(data[i][key]);
    			}    			
    		}
    	}
    	
    	var option={
          		title : {
            		    text: $scope.infoStatistics,
            		    x:'center',
          		    textStyle:{
          		    	fontSize:'12'
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
  			        data:legend,
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
  			    series:[]
		  }
		
		  option.series[0]={
					name:legendData[0],
					type:'bar',
					//stack:'季度',
					data:seriesData
				}
		  
    	$('.charts').empty();
    	$('<div id="chart1"/>').appendTo('.charts').addClass('chart');
		 var myChart = echarts.init(document.getElementById('chart1'),'vintage');  
		 myChart.setOption(option,true);
    }
    

    $scope.$watchCollection('select',function(newValue,oldValue){
    	var str='';

    	if($scope.province!=null && $scope.province.select!=null){
    		str+=$scope.province.select.areaName;
    	}
    	
    	if($scope.city!=null && $scope.city.select!=null){
    		str+=$scope.city.select.areaName;
    	}
    	if($scope.country!=null && $scope.country.select!=null){
    		str+=$scope.country.select.areaName;
    	}
    	
    	if($scope.period.startDate!=null && $scope.period.endDate!=null){
    		str+=' ';
    		if($scope.select.stat_type!='季度'){
        		str+=$scope.period.startDate+'至'+$scope.period.endDate   ; 			
    		}else{
        		str+=$scope.period.startDate+($scope.period.startQuarter!=null?$scope.period.startQuarter:"");
        		str+='至'+$scope.period.endDate+($scope.period.endQuarter!=null?$scope.period.endQuarter:"");
    		}
    	}
    	
    	if($scope.select.stat_type!=null){
    		if($scope.select.stat_type=='季度' || $scope.select.stat_type=='每天'){

    		}else{
        		str+=$scope.select.stat_type;
    		}
    	}

    	if($scope.select.draw!=null){
    		if($scope.select.draw.dimCode=='DATE'){
    			
    		}else{
    			str+=' 各'+$scope.select.draw.dimName;
    		}
    	}
    	

    	for(var i in $scope.dims){
    		var dim =$scope.dims[i];
    		if(dim.select!=null && dim.dimCode!='DATE' && dim.dimCode!='PROVINCE' && dim.dimCode!='CITY' && dim.dimCode!='COUNTRY'
    			&& !dim.draw){
    			str+=' '+dim.select.name;
    		}    		
    	}
    	
    	if($scope.select.value!=null){    		
        	str+=' '+$scope.select.value.dimName;
    	}
    	
    	if($scope.select.compare_type!=null){
    		str+=$scope.select.compare_type;
    	}
    	
    	
    	$scope.infoStatistics=str;
    });
        
}).directive('onFinishRender',['$timeout', '$parse', function ($timeout, $parse) {
    return {
        restrict: 'A',
        link: function (scope, element, attrs) {
            if (scope.$last === true) {
                $timeout(function () {
                    scope.$emit('ngRepeatFinished'); //事件通知
                        var fun = scope.$eval(attrs.onFinishRender);
                        if(fun && typeof(fun)=='function'){  
                            fun();  //回调函数
                        }  
                });
            }
        }
    }
}])
