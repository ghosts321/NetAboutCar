<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../../common.jsp" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<style type="text/css">
.form-actions{
 margin-top: 78px;
 margin-bottom: 0px;
}
</style>
<link rel="stylesheet" href="<%=basePath %>plugins/zTree/3.5.24/css/demo.css" type="text/css">
<link rel="stylesheet" href="<%=basePath %>plugins/zTree/3.5.24/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="<%=basePath %>plugins/zTree/3.5.24/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/zTree/3.5.24/js/jquery.ztree.core.js"></script>
<script type="text/javascript" src="<%=basePath %>plugins/zTree/3.5.24/js/jquery.ztree.excheck.js"></script>
<SCRIPT type="text/javascript">
	var setting = {
		check: {
			enable: true
		},
		data: {
			simpleData: {
				enable: true
			}
		}
	};
	var zNodes =${job};
	var code;
	function setCheck() {
		var zTree = $.fn.zTree.getZTreeObj("treeDemo");
		zTree.setting.check.chkboxType = { "Y" : "ps", "N" : "ps" };
	}
	$(document).ready(function(){
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		var treeObj = $.fn.zTree.getZTreeObj("treeDemo");
		var menuIdstr = ${menuIds};
	    var menuIds = menuIdstr.split(",");
	    for(var i=0;i<menuIds.length;i++){
	    	var node = treeObj.getNodeByParam("id",menuIds[i],null);
    		node.checked = true;
    		treeObj.updateNode(node); 
		    //treeObj.selectNode();
	    }
		setCheck();
	});
</SCRIPT>
<body style="background-color: white">
   <form name="menuForm" action="assignPermis.action" method="post">
   <div id="zhongxin">
		<label class="control-label" style="font-weight: bold;font-size: 20px;margin-top: 5px;margin-left: 5px">菜单列表</label>
		<input type="hidden" name="menuIds">
		<input type="hidden" name="btnPermis">
		<input type="hidden" name="selectRoleId" value="${selectRoleId }">
		
		<div class="content_wrap">
			<div class="zTreeDemoBackground left">
				<ul id="treeDemo" class="ztree"></ul>
			</div>
		</div>
	   <div class="form-actions center">
		 <button onclick="doSubmit()" class="btn btn-small btn-success">提  交</button>
	   </div>
   </div>
  </form>
 <script type="text/javascript">
 function doSubmit(){
	 var treeObj=$.fn.zTree.getZTreeObj("treeDemo"),
     nodes=treeObj.getCheckedNodes(true),
     menuIdv = "",
	 btnPermisv = "";
     for(var i=0;i<nodes.length;i++){
    	 menuIdv += nodes[i].id + ",";
    	 btnPermisv += nodes[i].urls + ",";
     }
     $("input[name=menuIds]").val(menuIdv);
     $("input[name=btnPermis]").val(btnPermisv);
     //$("#menuForm").submit();
	 //$("#zhongxin").hide();
 }
</script>
</body>
</html>