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
.file {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
 a:hover{color:white;text-decoration:none;}
 table{border-collapse:separate;}
</style>
<script type="text/javascript">
function quxiao(){
	window.location.href="<%=basePath %>exam/training.action";
}
function getFileName(inputName){
	var obj = document.getElementById(inputName);
	var length = obj.files.length;
	var fileName ="";
	for(var i=0;i<obj.files.length;i++){
		var temp = obj.files[i].name;
		fileName += temp+"<br>"
	}
	$("#"+inputName+"Name").html(fileName);
}
</script>
</head>
<body>
	<div class="page-content">
		<div class="page-header">
			<h1 style="font-size:25px;font-weight: lighter;color: #2679b5">
				考试培训
				<small style="font-size: 19px">
					<i class="icon-double-angle-right"></i>
					培训管理
				</small>
			</h1>
		</div>
		<form action="" method="post" name="form" id="form">
		   <table width="60%" align="center" border="0" cellpadding="5" cellspacing="2">
		             <tr height="40">
					    <td align="left">学习主题：
					    	<input  class="form-control" size="30" name="name" id="name"  type="text"/>
					    	 关联课程：<select id="educationlbg" name="educationlbg">
							  <option value="0"></option>
							  <option value="1">XXXXXX课程</option>
							</select>	
					    </td>
					 </tr>
					 <tr height="40">
					    <td align="left">课程时长：
					    	<input  class="form-control" size="30" name="name" id="name"  type="text"/>
					    	 授课讲师：<input  class="form-control" size="30" name="name" id="name"  type="text"/>
					    </td>
					 </tr>
					 <tr height="40">
					    <td align="left">授课方式：
					    	<select id="educationlbg" name="educationlbg">
							  <option value="0">线上</option>
							  <option value="1">线下</option>
							</select>	
					    </td>
					 </tr>
		             <tr height="40">
					    <td align="left">学习目标：
					    	<textarea style="width:500px;height:100px;" name="mubiao"></textarea>
					    </td>
					  </tr>
		             <tr height="40">
					    <td align="left">课程大纲：
					    	<textarea style="width:500px;height:100px;" name="dagang"></textarea>
					    </td>
					  </tr>
					  <tr height="40">
					    <td align="left">相关附件：
							<a href="javascript:;" class="file">&nbsp;&nbsp;+上传&nbsp;&nbsp;
							    <input type="file" multiple="multiple" onchange="getFileName('fujian')" name="" id="fujian">
							</a>	
					    </td>
				      </tr>
				      <tr><td style="padding-left:80px;"><span id="fujianName"></span></td></tr>
					  <tr height="40">
					    <td align="left">相关视频：
							<a href="javascript:;" class="file">&nbsp;&nbsp;+上传&nbsp;&nbsp;
							    <input type="file" multiple="multiple" onchange="getFileName('shipin')" name="" id="shipin">
							</a>	
					    </td>
				      </tr>
				      <tr><td style="padding-left:80px;"><span id="shipinName"></span></td></tr>
					  <tr height="40">
					    <td align="left">相关链接：
							<a href="javascript:;" class="file">&nbsp;&nbsp;+上传&nbsp;&nbsp;
							    <input type="file" multiple="multiple" onchange="getFileName('lianjie')" name="" id="lianjie">
							</a>	
					    </td>
				      </tr>
				      <tr><td style="padding-left:80px;"><span id="lianjieName"></span></td></tr>
					  <tr>
					     <td align="center">
					     	<button type="button" class='btn btn-default btn-info' onclick='submit()'>确定</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					     	<button type="button" class='btn btn-default' onclick='quxiao()'>取消</button>
					     </td>
				      </tr>
			</table>
        </form>     
	</div>
</body>
</html>