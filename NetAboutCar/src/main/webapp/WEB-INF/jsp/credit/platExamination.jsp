<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
 #fontStyle{
 	size:20px;
 	padding-left:20px
 }
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
</style>
<script type="text/javascript">
$(function() {
    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();
    $('#search').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    }); 
    $('#record').click(function () {  
    	$('#tradeList').bootstrapTable('refresh');
    }); 
    
	var yearHtml="<select id='year' name='year'>";
	//机构下拉框赋值
	$.ajax({
        type: "post",
        url: "findAllYear.action",
        success: function (data) {
        	var codeJson = eval(data);
    		if(codeJson != ""){
    			for(var i=0;i<codeJson.length;i++){
    				yearHtml += "<option value='"+codeJson[i].year+"'>"+codeJson[i].year+"</option>";
    			}
    		}else{
    			yearHtml+="<option value='0'>---请选择年份---</option>";
    		}
    		yearHtml+="</select>";
    		$("#year").html(yearHtml);
			$("select").selectlist({
				zIndex: 10,
				width: 180,
				height: 25
			});
        }
    });

    
    
});

var TableInit = function () {
	var oTableInit = new Object();
	//初始化Table
	oTableInit.Init = function () {
	    $('#tradeList').bootstrapTable({
	        url: 'platExamination.action',         //请求后台的URL（*）
	        method: 'post',                      //请求方式（*）
	        dataType: "json",
	        contentType: 'application/x-www-form-urlencoded',
	        striped: true,                      //是否显示行间隔色
	        cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
	        pagination: true,                   //是否显示分页（*）
	        search: false,  //是否启用查询 
	        sortable: true,                     //是否启用排序
	        buttonsAlign:'right',
	        toolbarAlign:'left',
	   
	        //toolbar: '#toolbar',
	        sortOrder: "asc",                   //排序方式
	        queryParams: function queryParams(params) {   //设置查询参数  
	        	var param = {
	        			comname:$("#comname").val(),
	        			year:$('#year').val()
	          	};
	          	return param; 
	            alert(year);                 
	        },
	        
	        clickToSelect: true,                //是否启用点击选中行
	        height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
	        uniqueId: "certno",                     //每一行的唯一标识，一般为主键列
	       /*  pageNumber:1,                       //初始化加载第一页，默认第一页
	        strictSearch: true,
	        cardView: false,                    //是否显示详细视图
	        detailView: false,                   //是否显示父子表 */
	        columns: [{
            	checkbox:true
            },{
	            field: 'index',
	            align: 'center',
	            title: '序号',
                formatter:function(value, row, index){
                	return index+1;
                }
	        },{
	            field: 'year',
	            align: 'center',
	            title: '年份'
	        },{
	            field: 'comname',
	            align: 'center',
	            title: '平台名称'
	        },{
	            field: 'score',
	            align: 'center',
	            title: '记分'
	        },
            {
                field: 'handle',
                align: 'center',
                title: '计分明细',
                formatter:function(value, row, index){
                	var html = "<button type='button' class='btn btn-default' onclick='showDetail(\"" + row.com_license + "\")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>详细</button>&nbsp;";
                	html += "<button type='button' class='btn btn-default' onclick='showDrivers(\"" + row.com_license + "\")'><span class='glyphicon glyphicon-wrench' aria-hidden='true' ></span>查看驾驶员考核</button>&nbsp;";
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


function showDrivers(comLicense){
	location.href="${path}/credit/platform/drivers.action?comLicense="+comLicense;
}

function showDetail(comLicense){
	var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="驾驶员考核计分明细";
	 diag.URL = '<%=basePath%>credit/toShowPlatDetail.action?comLicense=' + comLicense ;
	 diag.Width = 1000;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
		
		diag.close();
	 };
	 diag.show();
}
</script>
</head>
<body>

	<div class="panel-body">
		<div class="page-header">
			<h1 style="font-size:15px;">
			诚信考核
				<small style="font-size: 15px">
					<i class="icon-double-angle-right"></i>
					平台诚信考核查询
				</small>
			</h1>
		</div>
		<br/>
		<div class="panel panel-default">
            <div class="panel-body">
            	<span class="title">查询条件</span>
                <form id="formSearch" class="form-horizontal">
                    <div class="form-group" style="margin-top:15px">
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">平台</label>
                        <div class="col-sm-2" style="padding-right: 5px;padding-left: 0px">
                            <input type="text" id="comname" name="comname" value="" class="form-control" />
                        </div>
                        <label class="control-label col-sm-1" style="font-weight: normal;" for="txt_search_departmentname">年份</label>
                        <div class="col-sm-1" style=" float:left; display:inline;">
                            <select id="year" name="year">
					            <option value="">全部</option>
					            <option value="2017">2017</option>
					            <option value="2016">2016</option>
					            <option value="2018">2018</option>
				        	</select>
                        </div>
                        <div class="col-sm-3" style="text-align:left; padding-left:0px">
                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
		<table id="tradeList">
   		</table>
</body>
</html>