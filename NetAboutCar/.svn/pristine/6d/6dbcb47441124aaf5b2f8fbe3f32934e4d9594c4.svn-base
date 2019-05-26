package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.exam.domain.MngExamBespeak;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamresult;
import com.nasoft.aboutcar.pilotapply.service.DrvExamresultService;

@Service("DrvExamresultService")
public class DrvExamresultServiceImpl implements DrvExamresultService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addDrvExamresult(String sqlId, DrvExamresult drvExamresult) throws Exception {
		// TODO Auto-generated method stub
		baseDaoSupport.save(sqlId, drvExamresult);
	}
	
	@Override
	public List<DrvExamresult> findByCertno(String sqlId, String certno) {
		try {
			List<DrvExamresult> list = (List<DrvExamresult>) baseDaoSupport.findForList(sqlId, certno);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void updateDrvExamresult(String sqlId, DrvExamresult examresult) throws Exception {
		
		baseDaoSupport.update(sqlId, examresult);
	}

	@Override
	public List<DrvExamresult> findByExamdate(String sqlId, Map<String, Object> map) throws Exception {
		
		return (List<DrvExamresult>) baseDaoSupport.findForList(sqlId,map);
	}

	@Override
	public List<Map> examSystemByCertno(String sqlId, String certno) throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, certno);
	}


}
