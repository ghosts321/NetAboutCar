<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html ng-app='wyc'>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
angular.module('wyc',[]).controller('WycController',function($http,$scope){
	$scope.sjzl={exec_period:'single'};
	$scope.periodtypes=[{text:'仅一次',value:'single'},{text:'每年',value:'year'},{text:'每季',value:'quarter'},
	                    {text:'每月',value:'month'},{text:'每天',value:'day'}];
	

    $http({method:'post',url:"findDataCatalog.action?dataCode=${entity.dataCode}", data:{dataCode:'${entity.dataCode}'},headers:{
    	'Content-Type': 'application/x-www-form-urlencoded'
    }}).success(function (response) {
    	$scope.sjzl=response;
    });
});

//保存校验
function save(){
	$("#contentForm").submit();
}


$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    //2.初始化Button的点击事件
    /* var oButtonInit = new ButtonInit();
    oButtonInit.Init(); */
});
var TableInit = function () {
    var oTableInit = new Object();
    
    //初始化Table
    oTableInit.Init = function () {
    	oTableInit.queryParams = function (params) {
        	return {
        		dataCode:'${entity.dataCode}'	
        	}    	
        }
    	
        $('#dims').bootstrapTable({
            url: 'findAllDeminsion.action',        //请求后台的URL（*）
            contentType:'application/x-www-form-urlencoded',
            method: 'post',                      //请求方式（*）
            dataType: "json",
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: false,                   //是否显示分页（*）
//            pageSize:8,							//每页显示数据条数
            sortable: false,                    //是否启用排序
            buttonsAlign:'right',
            toolbarAlign:'right',
            toolbar:toolbar,
            sortOrder: "asc",                   //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            clickToSelect: true,                //是否启用点击选中行
            //height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            toolbar: '#toolbar',                //工具按钮用哪个容器
           /*  pageNumber:1,                    //初始化加载第一页，默认第一页
            strictSearch: true,
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表 */
            columns: [{
                field: 'fieldType',
                align: 'center',
                title: '字段类型',
                formatter:function(value){
                	if(value=='DEMINSION'){
                		return '维度字段';
                	}else {
                		return '值字段';
                	}
                }
            },{
                field: 'dimCode',
                align: 'center',
                title: '维度代码'
            }, {
                field: 'dimName',
                align: 'center',
                title: '维度名',
            }, {
                field: 'dimFieldname',
                align: 'center',
                title: '维度字段'
            }, {
                field: 'dimType',
                align: 'center',
                title: '维度类型'
            },{
                field: 'dimPics',
                align: 'center',
                title: '适用图形'
            },{
                field: 'handle',
                align: 'center',
                title: '操作',
                formatter:function(value, row, index){
					var html ="<button type='button' class='btn btn-default' onclick='toUpdate(\""+row.dimCode+"\")'><span class='glyphicon glyphicon-edit'></span> 修改</button>";
				    html += "<button type='button' class='btn btn-default' onclick='del(\""+row.id+"\")'><span class='glyphicon glyphicon-trash'></span> 删除</button>";
					   
				    return html;
                }
            }]
        });
    };
    /* $('#button').click(function () {  
        $table.bootstrapTable('refresh', {url: '../json/data1.json'});  
    }); */
    //得到查询的参数
    return oTableInit;
};


function toUpdate(dimCode){
	 location.href = '${path}/jcfx/xgwddy.action?dataCode=${entity.dataCode}&dimCode='+dimCode;
}

function del(id){
	var flag;
	if(confirm("确定要删除该记录？")){

		var url = "${path}/jcfx/scwddy.action?id="+id+"&guid="+new Date().getTime();
		$.get(url,function(data){
			if(data=='success'){
				document.location.reload();				
			}else{
				alert('删除失败:'+data);
			}
		});
	}

}
</script>
<style>
input[type=text]{
  width: 550px;
}

textarea{
	width:550px;
	height:400px;
}

.sql-comment{
display: block;
width: 100%;
border: 1px dotted #D0BD93;
padding: 5px;
color: rgb(207, 114, 37);
background-color: #F9F3CC;
}

.data-sql{
	margin-top:30px;
}

#zhongxin2{
	margin-top:30px;
}

</style>
</head>
<body >
<div class="panel-body" ng-controller="WycController">
			<div>维度定义: {{sjzl.dataTitle}}</div>
  	   <div id="toolbar" class="btn-group">
			<div>
            	<a id="btn_add" type="button" class="btn btn-default" href="${path }/jcfx/tjwddy.action?dataCode={{sjzl.dataCode}}">
	                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
	            </a>
            </div>
        </div>        
		<div id="zhongxin2" class="center">
			<table id="dims"></table>			
			<div class="sql-comment">标准维度代码（大写英文或数字）：日期-DATE、地区代码-AREACODE、地区名-AREANAME。</div>
			<div class='data-sql'><div>参考SQL：</div><div>{{sjzl.dataSql}}</div></div>
		</div>
	</div>
</body>
</html>