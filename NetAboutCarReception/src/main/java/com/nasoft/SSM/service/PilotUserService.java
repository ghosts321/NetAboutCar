package com.nasoft.SSM.service;

import java.util.List;

import com.nasoft.SSM.domain.PilotUser;

public interface PilotUserService {

	public void addPilotUser(String sqlId,PilotUser pilotUser) throws Exception; 
	
    public List<PilotUser> loginPilotUser(String sqlId,PilotUser pilotUser) throws Exception;
}
