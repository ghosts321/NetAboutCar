package com.nasoft.aboutcar.pilotapply.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamplan;
import com.nasoft.aboutcar.pilotapply.domain.DrvExamresult;
import com.nasoft.aboutcar.pilotapply.domain.DrvPermitapply;
import com.nasoft.aboutcar.pilotapply.service.DrvExamplanService;

@Service("DrvExamplanService")
public class DrvExamplanServiceImpl implements DrvExamplanService {

	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public void addDrvExamplan(String sqlId, DrvExamplan drvExamplan) throws Exception {
		baseDaoSupport.save(sqlId, drvExamplan);
	}

	@Override
	public List<DrvExamplan> findAll(String sqlId,Map<String, Object> map) {
		try {
			List<DrvExamplan> list = (List<DrvExamplan>) baseDaoSupport.findForList(sqlId, map);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public DrvExamplan findById(String sqlId, int planid) throws Exception {
		return (DrvExamplan) baseDaoSupport.findForObject(sqlId, planid);
	}

	@Override
	public void updateExamstatus(String sqlId, DrvExamplan drvExamplan) throws Exception {
		baseDaoSupport.update(sqlId, drvExamplan);
	}

	@Override
	public List<DrvExamplan> findStatusByCertno(String sqlId, String certno) throws Exception {
		// TODO Auto-generated method stub
		return (List<DrvExamplan>) baseDaoSupport.findForList(sqlId, certno);
	}

}
