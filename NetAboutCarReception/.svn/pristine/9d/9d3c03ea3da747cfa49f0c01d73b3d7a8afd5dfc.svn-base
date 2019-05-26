package com.nasoft.SSM.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.MsgNotice;
import com.nasoft.SSM.service.MsgNoticeService;

@Service("MsgNoticeService")
public class MsgNoticeServiceImpl implements MsgNoticeService {
	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addMsgNotice(String sqlId, MsgNotice msgNotice) throws Exception {
		baseDaoSupport.save(sqlId, msgNotice);
	}
	@Override
	public List<MsgNotice> selectAll(String sqlId,String certno) throws Exception {
		return (List<MsgNotice>) baseDaoSupport.findForList(sqlId, certno);
	}
	@Override
	public int selectMsgCount(String sqlId,String certno) throws Exception {
		return (Integer) baseDaoSupport.findForObject(sqlId, certno);
	}
	@Override
	public void readMsg(String sqlId, String certno) throws Exception {
		baseDaoSupport.update(sqlId, certno);
	}

}
