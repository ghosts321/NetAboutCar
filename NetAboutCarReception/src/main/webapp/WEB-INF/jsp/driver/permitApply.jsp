<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="../system/core.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>许可申请</title>
 </head>
 <style>
 .fontStyle2 {font-family:'Microsoft YaHei';font-size: 18px;color: #2E863E}
 .divStyle {
	width:78%;
	border: 1px solid #E5E5E5;
	text-align: center;
	-webkit-box-shadow: 3px 3px 50px #E5E5E5;
	box-shadow: 3px 3px 50px #E5E5E5;
	margin: 10px 0 10px 5px
 }
 </style>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui-1.10.4.custom.min.css"/>
<script src="<%=request.getContextPath()%>/js/formValidator_min.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=request.getContextPath()%>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=request.getContextPath()%>/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript" charset="UTF-8"></script>
 
<script type="text/javascript">
$(function(){
	
	
	$('select').selectlist({
		zIndex: 10,
		width: 270,
		height: 28
	});
	
	var optionHtml="<select id='nation' name='nation'>";
	$.getJSON("<%=request.getContextPath()%>/js/minzu.json",function(datas){
		
		$.each(datas,function(index,msg){
			optionHtml+="<option value='"+msg.id+"'>"+msg.name+"</option>";
		});
		optionHtml+="</select>";
		$("#minzu").html(optionHtml);
		$('select').selectlist({
			zIndex: 10,
			width: 270,
			height: 28
		});
	});

	
	$("#driverYears").spinner({
		max:50,
		min:1,
		step:1
	});
	
	$('#dd').calendar({
	    trigger: '#dt',
	    zIndex: 999,
		format: 'yyyy-mm-dd',
	    onSelected: function (view, date, data) {
	        console.log('event: onSelected')
	    },
	    onClose: function (view, date, data) {
	        console.log('event: onClose')
	        console.log('view:' + view)
	        console.log('date:' + date)
	        console.log('data:' + (data || 'None'));
	    }
	});
	$('#dd2').calendar({
	    trigger: '#dt2',
	    zIndex: 999,
		format: 'yyyy-mm-dd',
		date: new Date(2000,00,01),
	    onSelected: function (view, date, data) {
	        console.log('event: onSelected')
	    },
	    onClose: function (view, date, data) {
	        console.log('event: onClose')
	        console.log('view:' + view)
	        console.log('date:' + date)
	        console.log('data:' + (data || 'None'));
	    }
	});
	
});
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

$(document).ready(function(){
	$.formValidator.initConfig({formid:"form1",debug:false,submitonce:true,
		onerror:function(msg,obj,errorlist){
			//$.map(errorlist,function(msg1){alert(msg1)});
			alert(msg);
		}
	});
	
	$("#name").formValidator({onshow:"请输入姓名",onfocus:"请输入姓名"}).functionValidator({fun:isChinese});
	$("#idCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
    $("#driveCard").formValidator({onshow:"15或18位的身份证",onfocus:"15或18位的身份证",oncorrect:"输入正确"}).functionValidator({fun:isCardID});
    $("#address").formValidator({onshow:"请输入家庭住址",onfocus:"请输入家庭住址"}).inputValidator({min:1,max:30,onerror:"地址格式有误"});
    $("#driverYears").formValidator({onshow:"请输入驾龄",onfocus:"请输入驾龄"}).functionValidator({fun:isNum});
    $("#tel").formValidator({onshow:"请输入你的手机号码",onfocus:"请输入你的手机号码"}).functionValidator({fun:isPhoneNumber});
});

//禁止输入空格键
function banInputSapce(e){
	var keynum;
	if(window.event) // IE
	{
	  keynum = e.keyCode
	}
	else if(e.which) // Netscape/Firefox/Opera
	{
	  keynum = e.which
	}
	if(keynum == 32){
	  return false;
	}
	  return true;
} 
</script>
<body>
<div class="divStyle">
<form action="addPilotApply.action" method="post" name="form1" id="form1">
            
   <table width="97%"  border="0" cellpadding="5" cellspacing="2">
            <tr height="40">
                <td width="30%" align="right"></td>
			    <td align="center" class="fontStyle2">驾驶员资质业务许可申请</td>
			    <td width="37%" align="left"></td>
			  </tr>
             <tr height="40">
			    <td width="30%" align="right">姓名：</td>
			    <td width="30%" align="left"><input class="reg_input" size="30" name="name" id="name"  type="text" onkeydown="";/></td>
			    <td width="37%" align="left"><span id="nameTip" class="onshow"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">性别：</td>
			    <td width="30%" align="left"><input type="radio" id="Sex_Man" name="sex" value="1" checked="CHECKED" /><label for="Sex_Man"> 男</label>
                                                    <input type="radio" id="Sex_Woman" name="sex" value="0" /><label for="Sex_Woman"> 女</label></td>
			    <td width="37%" align="left"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">民族：</td>
			    <td width="30%" align="left">
				   		<span id="minzu"></span>
				</td>
			    <td width="37%" align="left"></td>
			  </tr>
			    <tr height="40">
			    <td width="30%" align="right">政治背景：</td>
			    <td width="30%" align="left"><input class="reg_input" size="30" name="political" id="political"  type="text" /></td>
			    <td width="37%" align="left"><span id="politicalTip" class="onshow"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">出生年月：</td>
			    <td width="30%" align="left"><input type="text" class="reg_input" name="birth" id="dt" placeholder="请选择日期" size="30">
		        <div id="dd"></div></td>
			    <td width="37%" align="left"></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">身份证号：</td>
			    <td width="30%" align="left"><input class="reg_input" size="30" name="idCard" id="idCard"  type="text" /></td>
			    <td width="37%" align="left"><span id="idCardTip" class="onshow"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">驾驶证号：</td>
			    <td width="30%" align="left"><input class="reg_input" size="30" name="driveCard" id="driveCard"  type="text" /></td>
			    <td width="37%" align="left"><span id="driveCardTip" class="onshow"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">取证时间：</td>
			    <td width="30%" align="left"><input type="text" class="reg_input" name="cardDate" id=dt2 placeholder="请选择日期" size="30">
		        <div id="dd2"></div></td>
			    <td width="37%" align="left"></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">驾龄：</td>
			    <td width="30%" align="left"><input size="30" name="driverYears" id="driverYears"  type="text" value="1"/></td>
			    <td width="37%" align="left"><span id="driverYearsTip" class="onshow"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">家庭地址：</td>
			    <td width="30%" align="left"><textarea class="reg_input" rows="5"  cols="30" name="address" id="address"></textarea></td>
			    <td width="37%" align="left"><span id="addressTip" class="onshow"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">手机号：</td>
			    <td width="30%" align="left"><input class="reg_input" size="30" name="tel" id="tel"  type="text" /></td>
			    <td width="37%" align="left"><span id="telTip" class="onshow"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">紧急联系人：</td>
			    <td width="30%" align="left"><input class="reg_input" size="30" name="contacts" id="contacts"  type="text" /></td>
			    <td width="37%" align="left"><span id="contactsTip" class="onshow"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">紧急联系人工作单位：</td>
			    <td width="30%" align="left"><input class="reg_input" size="30" name="contactsEmploy" id="contactsEmploy"  type="text" /></td>
			    <td width="37%" align="left"><span id="contactsEmployTip" class="onshow"></span></td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">紧急联系电话：</td>
			    <td width="30%" align="left"><input class="reg_input" size="30" name="contactsTel" id="contactsTel"  type="text" /></td>
			    <td width="37%" align="left"><span id="contactsTelTip" class="onshow"></span></td>
			  </tr>
			   <tr height="40">
			    <td width="30%" align="right">家庭社会背景：</td>
			    <td width="30%" align="left"><input class="reg_input" size="30" name="familyBg" id="familyBg"  type="text" /></td>
			    <td width="37%" align="left"><span id="familyBgTip" class="onshow"></span></td>
			  </tr>
			   <tr height="40">
			    <td width="30%" align="right">学历：</td>
			    <td width="30%" align="left">
			     <select id="educationbg" name="educationbg">
				  <option value="0">初中</option>
				  <option value="1">高中</option>
				  <option value="2">中技</option>
				  <option value="3">中专</option>
				  <option value="4">大专</option>
				  <option value="5">本科</option>
				  <option value="6">硕士</option>
				  <option value="7">博士</option>
				  <option value="8">博士后</option>
				  <option value="9">教授</option>
				</select>			    </td>
			    <td width="37%" align="left"></td>
			  </tr>
			   <tr height="40">
			    <td width="30%" align="right">服务网约车平台公司：</td>
			    <td width="30%" align="left" colspan="2">
				     <input type="checkbox" id="checkbox_a1" name="company" value="1" class="chk_1" checked /><label for="checkbox_a1">滴滴出行</label>
				     <input type="checkbox" id="checkbox_a2" name="company" value="2" class="chk_1" /><label for="checkbox_a2">Uber中国</label>
				     <input type="checkbox" id="checkbox_a3" name="company" value="3" class="chk_1"  /><label for="checkbox_a3">神州专车</label>
				     <input type="checkbox" id="checkbox_a4" name="company" value="4" class="chk_1" /><label for="checkbox_a4">首汽约车</label>
				     <input type="checkbox" id="checkbox_a5" name="company" value="5" class="chk_1"  /><label for="checkbox_a5">易到</label>
				</td>
			  </tr>
			  <tr height="40">
			    <td width="30%" align="right">身份证照片：</td>
			    <td colspan="2" align="left">
				    <div class="box">
					     <input type="text" name="shenfenzhengText"  class="textbox" />
					     <a href="javascript:void(0);"  class="upload_link">浏览</a>
					     <input type="file"   class="uploadFile" name="shenfenzheng"
					     onchange="getFile(this,'shenfenzhengText')" />
			    </div>			      </td>
		      </tr>
			  <tr height="40">
			    <td width="30%" align="right">驾驶证照片：</td>
			    <td colspan="2" align="left">
			         <div class="box">
					     <input type="text" name="jiashizhengText"  class="textbox" />
					     <a href="javascript:void(0);"  class="upload_link">浏览</a>
					     <input type="file"   class="uploadFile" name="jiashizheng"
					     onchange="getFile(this,'jiashizhengText')" />
				    </div>		          </td>
		      </tr>
		      <tr height="40">
			    <td width="30%" align="right">备注：</td>
			    <td colspan="2" align="left"><input class="reg_input" size="40" name="remark" id="remark"  type="text" />			      </span></td>
		      </tr>
			  <tr>
			     <td width="30%"></td>
			     <td colspan="2"><input id="button" name="button" type="submit" value="确认办理" class="r_button"/></td>
		      </tr>
</table>
			<br><br>
        </form>     
 </div>                         
</body>
</html>