<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
.table{
width:100%;
border:1px solid #cad9ea;
empty-cells:show;
border-collapse: collapse;
margin:0 auto;
color:#666;
margin-bottom: 10px;
margin-top: 10px;
}
.table th {
background-repeat:repeat-x;
height:30px;
}
.table td,.table th{
border:1px solid #cad9ea;
padding:5px 0.5em 0;
}
.table tr.alter{
background-color:#f5fafe;
}
textarea{
 margin-bottom: 4px;
}
.inp{
   width: 40px;
}
</style>
<script>
function changeStyle(item){
	   $("#mc"+item).attr("disabled",false);
	   $("#bz"+item).attr("disabled",false);
	   $("#bc"+item).show();
	   $("#add"+item).hide();
	   $("#xg"+item).hide();
}

function changeStyle2(item){
	 $("#mc"+item).attr("disabled",true);
	 $("#bz"+item).attr("disabled",true);
	 $("#add"+item).hide();
	 $("#bc"+item).hide();
	 $("#sc"+item).hide();
	 $("#xg"+item).show();
}
//修改子项
function updateChildDic(item){
	   var pdataCode=$("#pdataCode").val();
	   var bm=$("#bm"+item).val();
	   var mc=$("#mc"+item).val();   
	   var bz=$("#bz"+item).val();
	   
	   
	   if(mc=="" || bz=="" ){
		   alert("请完善数据");
		   return false;
	   }
	   $.ajax({
		    type:"POST",
		    async:false,
		    url:"<%=basePath%>dataDic/updateDic.action",
		    data:{dataCode:bm,dataName:mc,remark:bz,pdataCode:pdataCode},		
		    success:function(returnValue){
		    	if(returnValue=="success"){
		    		alert("修改成功");
		    		changeStyle2(item);
		    	}else{
		    		alert("修改失败");
		    	}
		    }
	   })
}
//添加行
function addRow(){
	   var tab =document.getElementById("trStr");
	   var rowIndex=tab.rows.length+1;
	   
	   var nowId=rowIndex;
	  
	   var lastBm=rowIndex;
	   
	   //添加一行
	   var tr=tab.insertRow();
	   
	   var td1=tr.insertCell();
	   var td2=tr.insertCell();
	   var td3=tr.insertCell();
	   var td4=tr.insertCell();
	   var td5=tr.insertCell();
	   var td6=tr.insertCell();
	   var td7=tr.insertCell();
	   
	   td1.style.textAlign='right';
	   td3.style.textAlign='right';
	   td5.style.textAlign='right';
	   td7.style.valign='middle';
	   //设置内容
	   td1.innerHTML="编码：";
	   td2.innerHTML="<input type='text' id='bm"+nowId+"' class='inp' value='"+lastBm+"' readonly='readonly'>";
	   td3.innerHTML="名称：";
	   td4.innerHTML="<input type='text' id='mc"+nowId+"' class='inp' style='width:100px;'>";
	   td5.innerHTML="备注：";
	   td6.innerHTML="<input type='text' id='bz"+nowId+"' >";
	   td7.innerHTML="<a href='javascript:void(0)' onclick='addChildDic("+nowId+")' id='add"+nowId+"' style='display:block'>保存</a><a href='javascript:void(0)' onclick='updateChildDic("+nowId+")' id='bc"+nowId+"' style='display:none'>保存</a><a href='javascript:void(0)' id='sc"+nowId+"' onclick='delRow(this)'>删除</a><a id='xg"+nowId+"' href='javascript:void(0)' onclick='changeStyle("+nowId+")' style='display:none'>修改</a>";
	   //初始化行;  
   	   initRows(tab);  
	   
}
function initRows(tab){  
    var tabRows = tab.rows.length;  
    for(var i = 0;i<tabRows.length;i++){  
           tab.rows[i].cells[0].firstChild.value=i;  
   }  
}  
//添加指标子项
function addChildDic(item){
	   
	   var pdataCode=$("#pdataCode").val();
	   var bm=$("#bm"+item).val();
	   var mc=$("#mc"+item).val();   
	   var bz=$("#bz"+item).val();
	   
	   
	   if(mc=="" || bz=="" ){
		   alert("请完善数据");
		   return false;
	   }
	   if(mc.length>10 || bz.length>10 ){
		   alert("数据过长");
		   return false;
	   }
	   $.ajax({
		    type:"POST",
		    async:false,
		    url:"<%=basePath%>dataDic/insertDic.action",
		    data:{dataCode:bm,dataName:mc,remark:bz,pdataCode:pdataCode},		
		    success:function(returnValue){
		    	if(returnValue=="success"){
		    		alert("添加成功");
		    		changeStyle2(item);
		    	}else{
		    		alert("添加失败");
		    	}
		    }
	   })
}
function delRow(obj){
	var tab = $('#trStr');  
	//获取tr对象;  
    var tr = obj.parentNode.parentNode;  
  
    tr.parentNode.removeChild(tr);
	
}
</script>
</head>
<body>
<div class="container">
		<div id="zhongxin">
		<table border="1" class="table" id="trStr">
		      <input type="hidden" value="${pdataCode }" id="pdataCode">
		      <!-- &nbsp;&nbsp;<a href="javascript:void(0)" onclick="addRow()" id="tj">添加</a> -->
		      <br>
		      <button id="btn_add" type="button" class="btn btn-default" onclick="addRow();">
                <span class="glyphicon glyphicon-plus" aria-hidden="true" ></span>新增
            </button>
		      *注：点击"修改"即可修改当前项，"编码"不可修改
		      
		    <c:forEach var="dataDic" items="${list }" varStatus="status">
				<tr id="${status.index }">
					<th style="text-align: right;width: 10%;">编码：</td>
					<td style="width:50px;"><input type="text" id="bm${status.index }" class="inp" disabled=true value="${dataDic.dataCode}"></td>
				    <th style="text-align: right;width: 10%;">名称：</td>
					<td style="width:50px;"><input type="text" id="mc${status.index }" style="width:100px;" disabled=true value="${dataDic.dataName}"></td>
					<th style="text-align: right;width: 10%;">备注：</td>
					<td style="width:80px;"><input type="text" id="bz${status.index }" disabled=true value="${dataDic.remark}"></td>
					<td style="width:50px;">
					
					     <a id="xg${status.index }" href="javascript:void(0)" onclick="changeStyle(${status.index})">修改</a>
					     <a id="bc${status.index }" href='javascript:void(0)' onclick="updateChildDic(${status.index})"  style='display:none'>保存</a>
					</td>
				</tr>
		    </c:forEach>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</div>
</body>
</html>