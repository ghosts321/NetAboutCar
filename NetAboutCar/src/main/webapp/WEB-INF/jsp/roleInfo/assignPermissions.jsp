<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function doSubmit(){
	 var menus = $('input[name=form-field-checkbox]');
	 var menuIdStr = "";
	 for(var i=0;i<menus.length;i++){
		 if(menus[i].checked){
			 menuIdStr += menus[i].value+",";
		 }
	 }
	 $("input[name=menuIds]").val(menuIdStr);
	 $("#menuForm").submit();
	 $("#zhongxin").hide();
	 
}
</script>


<body style="background-color: white">
   <form name="menuForm" action="assignPermis.action" method="post">
   <div id="zhongxin">
       <div class="span5" style="padding:18px">
		<label class="control-label">菜单列表</label>
		<input type="hidden" name="menuIds">
		<input type="hidden" name="selectRoleId" value="${selectRoleId }">
		<div class="controls">
			<c:forEach var="menuInfo" items="${menuList }" >
				<label>
					<c:if test="${menuInfo.menuLevel ==2 }">&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
					<c:if test="${menuInfo.menuLevel == '' }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
					<input name="form-field-checkbox" value="${menuInfo.menuId }" class="ace-checkbox-2" type="checkbox" />
					<span class="lbl"> ${menuInfo.menuName }</span>
				</label>
			</c:forEach>
		</div>
	   </div>
	   <div class="form-actions center" style="height: 100px;">
		 <button onclick="doSubmit()" class="btn btn-small btn-success">Submit</button>
	   </div>
   </div>
  </form>
 <script type="text/javascript">
 $(function(){
  var menuIdstr = ${menuIds};
  var menus = $('input[name=form-field-checkbox]');
  for(var i=0;i<menus.length;i++){
	 if((menuIdstr+"").indexOf(menus[i].value) >= 0){
		 menus[i].checked = true;
	 }
  }
 })
</script>
</body>
</html>