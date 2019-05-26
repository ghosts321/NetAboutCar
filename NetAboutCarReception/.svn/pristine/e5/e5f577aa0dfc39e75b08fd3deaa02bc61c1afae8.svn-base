<%@page import="java.util.Properties"%>
<%@page import="java.io.FileInputStream"%>
<%
  	 String services_path = "";
	 Properties pro = new Properties();  
	 String realpath = request.getRealPath("/WEB-INF/classes");  
	 try{  
		 //读取配置文件
		 FileInputStream in = new FileInputStream(realpath+"/jdbc.properties");  
		 pro.load(in);  
	 }catch(Exception e){  
	     out.println(e);  
	 }
	//通过key获取配置文件
	 services_path = pro.getProperty("services.ip"); 
 
%>
