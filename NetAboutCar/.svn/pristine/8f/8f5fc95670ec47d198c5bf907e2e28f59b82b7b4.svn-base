<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
 function doSubmit(){
	 var roles = $('input[name=form-field-checkbox]');
	 var roleIdStr = "";
	 for(var i=0;i<roles.length;i++){
		 if(roles[i].checked){
			 roleIdStr += roles[i].value+",";
		 }
	 }
	 $("input[name=roleIds]").val(roleIdStr);
	 $("#roleForm").submit();
	 $("#zhongxin").hide();
	 
 }
</script>
<body style="background-color: white">
  <form name="roleForm" action="assignRole.action" method="post">
   <div id="zhongxin" align="center" style="padding-top:15px">
       <div class="span5" style="padding:18px">
		<label class="control-label">角色列表</label>
		<input type="hidden" name="roleIds">
		<input type="hidden" name="selectUserId" value="${selectUserId }">
		<div class="controls">
			<c:forEach var="roleInfo" items="${roleList }" >
				<label>
					<input name="form-field-checkbox" value="${roleInfo.roleId }" class="ace-checkbox-2" type="checkbox" /><span class="lbl">${roleInfo.roleName }</span>
				</label>
			</c:forEach>
		</div>
	   </div>
	   <div class="form-actions center" style="height: 100px;">
		 <button onclick="doSubmit()" class="btn btn-small btn-success">提交</button>
	   </div>
   </div>
  </form>
<script type="text/javascript">
  $(function(){
	  var roleIdstr = ${roleIds};
	  var roles = $('input[name=form-field-checkbox]');
	  for(var i=0;i<roles.length;i++){
		 if((roleIdstr+"").indexOf(roles[i].value) >= 0){
			 roles[i].checked = true;
		 }
	  }
  })
</script>
</body>
</html>