<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function getFile(obj,inputName){
	var file_name = $(obj).val();
	
	
	var houzhui=file_name.split(".");
	
	var last=houzhui[houzhui.length-1];
	var tp ="jpg,jpeg,gif,bmp,png,JPG,JPEG,GIF,BMP,PNG";
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
//保存校验
function save(){
	if($("#title1").val()==""){
		$("#title1").tips({
			side:3,
            msg:'请输入标题',
            bg:'#AE81FF',
            time:2
        });
		$("#title1").focus();
		return false;
	}
	if("" == $("input[name='pic1photoText']").val() ||　null == $("input[name='pic1photoText']").val()){
		 $("#pic1photoText").tips({
				side:3,
	            msg:'请选择一个图片',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#pic1photoText").focus();
			return false;
	}
	if(contentForm.url1.value==""){
		alert("请先到 《首页内容维护》 添加一项图片新闻");
		return false;
	}
	$("#contentForm").submit();
	$("#zhongxin").hide();
	$("#zhongxin2").show();
}
</script>
<style>
input.file_textbox{
  height: 30px;
  width: 207px;
}

</style>
</head>
<body>
<div class="container">
<form  action="addLunBo.action" name="contentForm" id="contentForm" method="post" enctype="multipart/form-data">
		<div id="zhongxin" align="center" style="padding-top:30px">
		<table >
		    <tr>
			    <td colspan="2" align="left">&nbsp;请至少添加一个轮播图</td>
			    <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align: right;">标题1：</td>
				<td align="left"><input type="text" name="title" id="title1" value="" title="标题"/></td>
			</tr>
			<tr>
				<td style="text-align: right;">图片1：</td>
				<td align="left">
					<div class="box">
						<input type="text" id="pic1photoText" name="pic1photoText" class="file_textbox" />
						<a href="javascript:void(0);" class="upload_link">浏览</a>
						<input type="file" class="uploadFile" id="pic1" name="files" onchange="getFile(this,'pic1photoText')" />
					</div>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">选择内容：</td>
				<td align="left">
				    <select name="url" id="url1">
				      <c:forEach var="content" items="${list }">
				        <option value="${content.url}">${content.title }</option>
				      </c:forEach>
				    </select>
				</td>
			</tr>
			<tr>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align: right;">标题2：</td>
				<td align="left"><input type="text" name="title" id="title2" value="" title="标题"/></td>
			</tr>
			<tr>
				<td style="text-align: right;">图片2：</td>
				<td align="left">
					<div class="box">
						<input type="text" id="pic2photoText" name="pic2photoText" class="file_textbox" />
						<a href="javascript:void(0);" class="upload_link">浏览</a>
						<input type="file" class="uploadFile" id="pic2" name="files" onchange="getFile(this,'pic2photoText')" />
					</div>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">选择内容：</td>
				<td align="left">
				    <select name="url" id="url2">
				        <c:forEach var="content" items="${list }">
				        <option value="${content.url}">${content.title }</option>
				      </c:forEach>
				    </select>
				</td>
			</tr>
			<tr>
			    <td>&nbsp;</td>
			    <td>&nbsp;</td>
			</tr>
			<tr>
				<td style="text-align: right;">标题3：</td>
				<td align="left"><input type="text" name="title" id="title3" value="" title="标题"/></td>
			</tr>
			<tr>
				<td style="text-align: right;">图片3：</td>
				<td align="left">
					<div class="box">
						<input type="text" id="pic3photoText" name="pic3photoText" class="file_textbox" />
						<a href="javascript:void(0);" class="upload_link">浏览</a>
						<input type="file" class="uploadFile" id="pic3" name="files" onchange="getFile(this,'pic3photoText')" />
					</div>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;">选择内容：</td>
				<td align="left">
				    <select name="url" id="url3">
				        <c:forEach var="content" items="${list }">
				        <option value="${content.url}">${content.title }</option>
				      </c:forEach>
				    </select>
				</td>
			</tr>
			
			<tr>
			    
				<td colspan="2" style="text-align: center; padding-top: 30px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
	</div>
</body>
</html>