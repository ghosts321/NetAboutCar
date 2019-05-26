package com.nasoft.aboutcar.msgnotice.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.msgnotice.domain.MsgNotice;
import com.nasoft.aboutcar.msgnotice.service.MsgNoticeService;

@Service("MsgNoticeService")
public class MsgNoticeServiceImpl implements MsgNoticeService {
	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addMsgNotice(String sqlId, MsgNotice msgNotice) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, msgNotice);
	}

}
