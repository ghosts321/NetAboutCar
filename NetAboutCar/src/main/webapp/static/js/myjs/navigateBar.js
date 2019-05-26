$(function(){
	var pathname = window.location.pathname;
    var path = pathname.substr(pathname.indexOf("/",11)+1);
    $.post(getRealPath()+"/menuInfo/selectMenuName.action",{path:path},function(data){
    	var arr = [];
    	var htm = "";
    	if(data != null){
    		arr = data.split(",");
    		for(var i=arr.length-1;i>=0;i--){
    			htm+=arr[i];
    			if(i>0){
    				htm+="<i class=\"icon-double-angle-right\"/>";
    			}
    		}
    		$("h1").html(htm);
    	}
    })
})
function getRealPath() {

	var localObj = window.location;
	var contextPath = localObj.pathname.split("/")[1];
	var basePath = localObj.protocol + "//" + localObj.host + "/" + contextPath;
	return basePath;

}