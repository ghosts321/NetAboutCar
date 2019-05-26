<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>                                                                                
                                                                                                                                                                      
<%@ include file="../../../common.jsp" %>                                                                                                                             
                                                                                                                                                                      
<!DOCTYPE>                                                                                                                                                            
<html>                                                                                                                                                                
<head>                                                                                                                                                                
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">                                                                                                   
</head>                                                                                                                                                               
<script type="text/javascript">                                                                                                                                       
$(function(){                                                                                                                                                         
	var oTable = new TableInit();                                                                                                                                       
	oTable.Init();                                                                                                                                                      
	 $('#search').click(function () {                                                                                                                                    
    	$('#tradeList').bootstrapTable('refresh');                                                                                                                      
    });                                                                                                                                                                
	                                                                                                                                                                    
});                                                                                                                                                                   
                                                                                                                                                                      
var TableInit = function () {                                                                                                                                         
    var oTableInit = new Object();                                                                                                                                    
    //初始化Table                                                                                                                                                     
    oTableInit.Init = function () {                                                                                                                                   
        $('#tradeList').bootstrapTable({                                                                                                                              
            url:  '<%=basePath%>orderSet/carList.action',         //请求后台的URL（*）                                                                             
            method: 'post',                      //请求方式（*）                                                                                                      
            dataType: "json",                                                                                                                                         
            contentType: 'application/x-www-form-urlencoded',                                                                                                         
            striped: true,                      //是否显示行间隔色                                                                                                    
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）                                                   
            pagination: true,                   //是否显示分页（*） 
            pageSize:8,
            sortable: false,                     //是否启用排序                                                                                                       
            buttonsAlign:'right',                                                                                                                                     
            toolbarAlign:'left',
            toolbar:'#toolbar',
            sortOrder: "asc",                   //排序方式 
            queryParams: function queryParams(params) {   //设置查询参数     
            	var param = {   
            			applyid:$("#nav-search-input").val(),                                                                                                                
              	};                                                                                                                                                    
              	return param;                                                                                                                                         
            },                                                                                                                                                        
            clickToSelect: true,                //是否启用点击选中行                                                                                                  
            height: 420,                        //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度                                                      
            uniqueId: "driver_bespeak_id",                     //每一行的唯一标识，一般为主键列                                                                       
           /*  pageNumber:1,                       //初始化加载第一页，默认第一页                                                                                     
            strictSearch: true,                                                                                                                                       
            cardView: false,                    //是否显示详细视图                                                                                                    
            detailView: false,                   //是否显示父子表 */                                                                                                  
            columns: [{                                                                                                                                               
                field: 'car_bespeak_id',                                                                                                                           
                align: 'center',                                                                                                                                        
                title: '预约代码'                                                                                                                                     
            }, {                                                                                                                                                      
                field: 'carnum',                                                                                                                                      
                align: 'center',                                                                                                                                      
                title: '车牌号'                                                                                                                                     
            }, {                                                                                                                                                      
                field: 'username',                                                                                                                                      
                align: 'center',                                                                                                                                      
                title: '姓名'                                                                                                                                     
            }, {                                                                                                                                                      
                field: 'telno',                                                                                                                                      
                align: 'center',                                                                                                                                      
                title: '电话'                                                                                                                                     
            }, {                                                                                                                                                      
                field: 'carid',                                                                                                                                      
                align: 'center',                                                                                                                                      
                title: '车辆编号'                                                                                                                                     
            }, {                                                                                                                                                      
                field: 'bespeak_id',                                                                                                                                  
                align: 'center',                                                                                                                                      
                title: '预约号'                                                                                                                                       
            },{                                                                                                                                                       
                field: 'bespeak_time',                                                                                                                                
                align: 'center',                                                                                                                                      
                title: '预约时段',                                                                                                                                    
                formatter:function(value, row, index){                                                                                                                
                	if(row.bespeak_time=="1"){                                                                                                                          
                		var html="上午";                                                                                                                                  
                	}else{                                                                                                                                              
                		var html="下午";                                                                                                                                  
                	}                                                                                                                                                   
					return html;                                                                                                                                                
            }                                                                                                                                                         
            },{                                                                                                                                                       
                field: 'applyid',                                                                                                                                     
                align: 'center',                                                                                                                                      
                title: '申请编号'                                                                                                                                     
            } ]                                                                                                                                                       
        });                                                                                                                                                           
    };                                                                                                                                                                
    //得到查询的参数                                                                                                                                                  
    return oTableInit;                                                                                                                                                
};                                                                                                                                                                    
</script>                                                                                                                                                             
<body>                                                                                                                                                                
<div class="panel-body">                                                                                                                                            
						<div class="page-header">                                                                                                                                 
							<h1 style="font-size:15px;">                                                                                         
								业务审核                                                                                                                                              
								<small style="font-size: 15px">                                                                                                                       
									<i class="icon-double-angle-right"></i>                                                                                                             
									车辆预约查询                                                                                                                                    
								</small>                                                                                                                                              
							</h1>                                                                                                                                                   
						</div>                                                                                                                                                    
		<!-- 	<table border='0'>    -->                                                                                                                                           
			<!-- <tbody>                                                                                                                                                         
				<tr>                                                                                                                                                          
				<tr>                                                                                                                                                          
					<td><p id="fontStyle">根据条件查询：</p></td>                                                                                                               
					<td>                                                                                                                                                        
						<span class="input-icon">                                                                                                                                 
						<input  autocomplete="off" id="nav-search-input" type="text" data-date-format="yyyy-mm-dd" name="applyid" value="" placeholder="申请编号" />          
						</span>                                                                                                                                                   
					</td>                                                                                                                                                       
				<td style="vertical-align:top;"><button id="search" class="btn btn-mini btn-light" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
			  </tbody>   -->
			  <div class="panel panel-default">
				<div class="panel-body">
	            	<span class="title">查询条件</span>
	                <form id="formSearch" class="form-horizontal">
	                    <div class="form-group" style="margin-top:15px">
	                        <label class="control-label col-sm-1" style="font-weight: normal;"  >申请编号</label>
                        <div class="col-sm-3" style="padding-right: 5px;padding-left: 0px">
							<input   autocomplete="off" id="nav-search-input" type="text"  />
                        </div>
	                        <div class="col-sm-4" style="text-align:left; padding-left:0px">
	                            <button type="button" style="margin-left:5px" id="search" class="btn btn-primary">查询</button>
	                        </div>
	                    </div>
	                </form>
	            </div>
			</div> 
			                                                                                                                                                    
			<!-- </table> -->                                                                                                                                                        
			<table id="tradeList" >                                                                                   
			 </table>				                                                                                                                                                
</div>                                                                                                                                                                
</body>                                                                                                                                                               
</html>                                                                                                                                                               