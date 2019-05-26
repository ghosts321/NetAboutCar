<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">

$(function(){ 
  	//日期框
	$('.date-picker').datepicker();
	 
})
//保存校验
function save(){
	$("#addForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}

               function getFile(obj,inputName){
				var file_name = $(obj).val();
				var houzhui=file_name.split(".");
				var last=houzhui[houzhui.length-1];
				var tp ="jpg,gif,bmp,png,JPG,GIF,BMP,PNG";
				var rs=tp.indexOf(last);
				
				//如果返回的结果大于或等于0，说明包含允许上传的文件类型
				if(rs>=0){
					 $("input[name='"+inputName+"']").val(file_name);
					 return true;
				}else{
					 alert("您选择的上传文件不是有效的图片文件！");
					 $("input[name='"+inputName+"']").val("");
					 return false;
				}
			} 
			

</script>
<style>
table{
	table-layout:fixed;
	empty-cells:show;
	border-collapse: collapse;
	margin:0 auto;
}
.table{
border:1px solid #cad9ea;
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
width:100px
}
.table tr.alter{
background-color:#f5fafe;
}
img{
margin-bottom:0.5em;
width: 220px;
height: 150px;
}

select,textarea{
	margin-bottom: 8px;
}
textarea{
  width: 220px;
}
</style>
</head>
<body>
<div class="container">
<form  action="comitcomp.action" name="addForm" id="addForm" method="post" enctype="multipart/form-data" >
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table border="1" class="table">	      
			<tr>
				<td style="text-align: center; width: 180px"><strong>处理时间</strong></td><td style="text-align:center; width: 130px"><strong>处理部门</strong></td><td style="text-align:center;width: 91px; "><strong>处理人</strong></td>
				 <td style="text-align: center;width: 130px"><strong>处理内容</strong></td> <td style="text-align:center;width: 130px"><strong>处理意见</strong></td>
			</tr>
	         <tr><td style="text-align: center;width:130px" >${comcomplaintinfo.create_time}</td>
	             <td style="text-align: center;">录入部门</td>
	             <td style="text-align: center;">${comcomplaintinfo.create_user}</td>
	             <td style="text-align: center;">投诉录入</td>
	             <td style="text-align: center;"></td>
	         </tr>
	         <tr>
	             <td style="text-align: center;">${complaindistribute.distri_time}</td>
	             <td style="text-align: center;">受理部门</td>
	             <td style="text-align: center;">${complaindistribute.distri_peo}</td>
	             <td style="text-align: center;">投诉受理</td>
	             <td style="text-align: center;">${complaindistribute.distri_idea}</td>
	         </tr>
	           <c:if test="${ comcomplaintinfo.compn_state=='4' || comcomplaintinfo.compn_state=='5' || comcomplaintinfo.compn_state=='6' || comcomplaintinfo.compn_state=='7'
		                   || comcomplaintinfo.compn_state=='8'  }">
	         <tr>
	             <td style="text-align: center;">${comcomplaindispose.idea_time}</td>
	             <td style="text-align: center;">处理部门</td>
	             <td style="text-align: center;">${comcomplaindispose.idea_peo}</td>
	             <td style="text-align: center;">投诉处理</td>
	             <td style="text-align: center;">${comcomplaindispose.dis_idea}</td>
	         </tr>
	         </c:if>
	            <c:if test="${comcomplaintinfo.compn_state=='5' || comcomplaintinfo.compn_state=='6' || comcomplaintinfo.compn_state=='7' }">
	         <tr>
	             <td style="text-align: center;">${comcomplainappeal.appl_time}</td>
	             <td style="text-align: center;">投诉对象</td>
	             <td style="text-align: center;">${comcomplainappeal.appl_peo}</td>
	             <td style="text-align: center;">投诉申诉</td>
	             <td style="text-align: center;">${comcomplainappeal.appl_content}</td>
	         </tr>
	         </c:if>
	          <c:if test="${comcomplaintinfo.compn_state=='7'}">
	         <tr>
	             <td style="text-align: center;">${comcomplaindispose.appl_idea_time}</td>
	             <td style="text-align: center;">处理部门</td>
	             <td style="text-align: center;">${comcomplaindispose.appl_idea_peo}</td>
	             <td style="text-align: center;">申诉处理</td>
	             <td style="text-align: center;">${comdisappeal.disappeal_idea}</td>
	         </tr>
	         </c:if>
	            <c:if test="${ comcomplaintinfo.compn_state=='8' }">
	              <c:if test="${comcomplaindispose.appl_idea_peo!=null}">
	           <tr>
	             <td style="text-align: center;">${comcomplainappeal.appl_time}</td>
	             <td style="text-align: center;">投诉对象</td>
	             <td style="text-align: center;">${comcomplainappeal.appl_peo}</td>
	             <td style="text-align: center;">投诉申诉</td>
	             <td style="text-align: center;">${comcomplainappeal.appl_content}</td>
	         </tr>
	            <tr>
	             <td style="text-align: center;">${comcomplaindispose.appl_idea_time}</td>
	             <td style="text-align: center;">处理部门</td>
	             <td style="text-align: center;">${comcomplaindispose.appl_idea_peo}</td>
	             <td style="text-align: center;">申诉处理</td>
	             <td style="text-align: center;">${comdisappeal.disappeal_idea}</td>
	           </tr>
	            </c:if>
	         </c:if>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>