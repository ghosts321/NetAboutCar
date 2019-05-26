package com.nasoft.SSM.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.PilotUser;
import com.nasoft.SSM.service.PilotUserService;

@Service("pilotUserService")
public class PilotUserServiceImpl implements PilotUserService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addPilotUser(String sqlId,PilotUser pilotUser) throws Exception {
		// TODO Auto-generated method stub
        baseDaoSupport.save(sqlId, pilotUser);
	}

	@Override
	public List<PilotUser> loginPilotUser(String sqlId,PilotUser pilotUser) throws Exception  {
		// TODO Auto-generated method stub
		List<PilotUser> puList=(List<PilotUser>)baseDaoSupport.findForList(sqlId, pilotUser);
		return puList;
	}

}
