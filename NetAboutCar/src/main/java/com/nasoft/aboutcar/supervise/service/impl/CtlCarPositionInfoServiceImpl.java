package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.supervise.domain.CtlCarPositionInfo;
import com.nasoft.aboutcar.supervise.service.CtlCarPositionInfoService;

@Service("CtlCarPositionInfoService")
public class CtlCarPositionInfoServiceImpl implements CtlCarPositionInfoService {
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<CtlCarPositionInfo> selectAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<CtlCarPositionInfo>) baseDaoSupport.findForList(sqlId,map);
	}

	@Override
	public List<CtlCarPositionInfo> findAllCarNewPosition(String sqlId) throws Exception {
		
		return (List<CtlCarPositionInfo>) baseDaoSupport.findForList(sqlId,null);
	}

	@Override
	public List<CtlCarPositionInfo> selectAlarmCar(String sqlId, Map map) throws Exception {
		return (List<CtlCarPositionInfo>) baseDaoSupport.findForList(sqlId,map);
	}

	@Override
	public List<CtlCarPositionInfo> findAllCarPositionInfoH(String sqlId, Map map) throws Exception {
		
		return (List<CtlCarPositionInfo>) baseDaoSupport.findForList(sqlId,map);
	}

	@Override
	public int addCarPosition(String sqlId, CtlCarPositionInfo ctlCarPositionInfo) throws Exception {
		return (Integer) baseDaoSupport.save(sqlId, ctlCarPositionInfo);
	}
	
	/**
	 * 特定车辆追踪
	 * @param sqlId
	 * @return
	 * @throws Exception
	 */
	public CtlCarPositionInfo getSpecificCar(String sqlId, String vehicleNo) throws Exception {
		return (CtlCarPositionInfo) baseDaoSupport.findForObject(sqlId,vehicleNo);
	}

	@Override
	public CtlCarPositionInfo getCarInfoToid(String sqlId, String id) throws Exception {
		return (CtlCarPositionInfo) baseDaoSupport.findForObject(sqlId,id);
	}
}
