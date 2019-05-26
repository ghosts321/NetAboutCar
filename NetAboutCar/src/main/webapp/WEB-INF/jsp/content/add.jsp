<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../../../common.jsp" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
$(function(){
	
})
//保存校验
function save(){
	if($("#title").val()==""){
		$("#title").tips({
			side:3,
            msg:'请输入标题',
            bg:'#AE81FF',
            time:2
        });
		$("#title").focus();
		return false;
	}
	if($("#tip").html()==""){
		alert("请先提交编辑的内容！");
		return false;
	}
	$("#contentForm").submit();
	/* $("#zhongxin").hide();
	$("#zhongxin2").show(); */
}

<%-- function tobianji(){
	var title=$("#title").val();
	$("#aa").attr("href","<%=basePath2 %>/kindeditor/jsp/demo.jsp?title="+title+"&time="+getNowFormatDate());
} --%>
function getNowFormatDate(){
    var day = new Date();
    var Year = 0;
    var Month = 0;
    var Day = 0;
    var hour=0;
    var minu=0;
    var mill=0;
    var secodes=0;
    var CurrentDate = "";
    Year= day.getFullYear();//支持IE和火狐浏览器.
    Month= day.getMonth()+1;
    Day = day.getDate();
    hour=day.getHours();
    minu=day.getMinutes();
    secodes=day.getSeconds();
    mill=day.getMilliseconds();
    
    CurrentDate += Year+"-";
    if (Month >= 10 ){
     CurrentDate += Month+"-";
    }
    else{
     CurrentDate += "0" + Month+"-";
    }
    if (Day >= 10 ){
     CurrentDate += Day+" ";
    }
    else{
     CurrentDate += "0" + Day+" ";
    }
    if(hour>=10){
      CurrentDate += hour+":";
    }else{
      CurrentDate += "0" + hour+":";
    }
    if(minu>=10){
	  CurrentDate += minu+":";
	  }else{
	  CurrentDate += "0" + minu+":";
	}
    if(secodes>=10){
		  CurrentDate += secodes;
	  }else{
	  CurrentDate += "0" + secodes;
	}
    return CurrentDate;
 } 
</script>
<style>
select,textarea{
	margin-bottom: 8px;
}
textarea{
  width: 260px;
}
body{
line-height: 5px;
}
</style>
</head>
<body>
<div class="container">
<form  action="add.action" name="contentForm" id="contentForm" method="post" >
		<div id="zhongxin">
		<table>
		    <tr>
		        <td>&nbsp;</td>
		        <td>&nbsp;</td>
		    </tr>
			<tr>
				<td style="text-align: right;">标题：</td>
				<td><input type="text" style="width: 290px;" name=title id="title" value="" title="标题"/></td>
			</tr>
			<tr style="padding-top: 10px;">
			    <td style="text-align: right;">类型：</td>
				<td>
				    <select name="type" id="type">
				        <option value="0">图片新闻 </option>
				        <option value="1">信息咨讯</option>
				        <option value="2">信息公告</option>
				        <option value="3">政策法规</option>
				        <option value="4">诚信信息</option>
				        <option value="5">投诉披露 </option>
				    </select>
				</td>
			</tr>
			<tr>
			    <td style="text-align: right;padding-top: 10px;">内容：<input type="hidden" name="formValue" id="formValue" value=""/></td>
				<!-- <td style="padding-top: 10px;"><a id="aa" href="javascript:void(0)" onclick='tobianji()' target="_blank">去编辑内容</a>&nbsp;</td> -->
				<td style="padding-top: 10px;">
					<iframe style="width: 850px;height: 500px" src="<%=basePath2 %>/kindeditor/jsp/demo.jsp?title='请在此编辑标题'&time="+getNowFormatDate()></iframe>
					<span id="tip"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align: center; padding-top: 10px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="history.go(-1)">取消</a>
				</td>
			</tr>
		</table>
		</div>
	</form>
	</div>
</body>
</html>