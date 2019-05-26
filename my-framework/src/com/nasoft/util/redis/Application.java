package com.nasoft.util.redis;

import java.util.List;

public class Application {
	private String name = "NONE_DEFINE";
	private String code = "NONE_DEFINE";
	private String desc = "NONE_DEFINE";
	
	private static Application instance;
	
	private IdWorker idWorker;
	
	private String ip;
	
	private int port;
	
	
	public IdWorker getIdWorker() {
		return idWorker;
	}

	public void setIdWorker(IdWorker idWorker) {
		this.idWorker = idWorker;
	}

	public static Application getInstance() {
		if(instance == null) {
			instance = new Application();
		}
		
		return instance;
	}
	
	private Application() {
		
	}
	
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public static void main(String[] args) {
//		System.out.println(Enum.valueOf(Application.RETURN_CODE.class, "SUCCESS"));
	}
	
	public String getCoreLogger() {
		return this.getName() + "-core";
	}
		
	public String getRuntimeLogger() {
		return this.getName() + "-runtime";
	}
	
	public String getErrorLogger() {
		return this.getName() + "-error";
	}
		
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}
	
	
}
