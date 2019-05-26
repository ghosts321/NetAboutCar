package com.nasoft.aboutcar.supervise.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.administrativePenalty.domain.DrvPlantCaseInfo;
import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.supervise.domain.CarActionInfo;
import com.nasoft.aboutcar.supervise.domain.CarIllegalInfo;
import com.nasoft.aboutcar.supervise.domain.CtlIllegalCarMonitor;
import com.nasoft.aboutcar.supervise.domain.DrvActionInfo;
import com.nasoft.aboutcar.supervise.domain.DrvIllegalInfo;
import com.nasoft.aboutcar.supervise.service.CtlIllegalCarMonitorService;
@Service("CtlIllegalCarMonitorService")
public class CtlIllegalCarMonitorServiceImpl implements CtlIllegalCarMonitorService {
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public List<CtlIllegalCarMonitor> selectAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<CtlIllegalCarMonitor>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Transactional
	@Override
	public void disposeDel(String sqlId, String id) throws Exception {
		baseDaoSupport.delete(sqlId, id);
	}
	
	@Override
	public CtlIllegalCarMonitor findIllegalCarById(String sqlId, String id) throws Exception {
		
		return (CtlIllegalCarMonitor) baseDaoSupport.findForObject(sqlId, id);
	}

	@Override
	public List<DrvIllegalInfo> DrvIllegalInfofindAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<DrvIllegalInfo>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public DrvIllegalInfo DrvIllegalInfofindById(String sqlId, String drv_illegal_id)
			throws Exception {
		return (DrvIllegalInfo) baseDaoSupport.findForObject(sqlId, drv_illegal_id);
	}
	
	@Override
	public void insertDetermine(String sqlId , DrvIllegalInfo drvIllegalInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , drvIllegalInfo);
	}
	
	@Override
	public void updateDetermine(String sqlId , DrvIllegalInfo drvIllegalInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , drvIllegalInfo);
	}
	
	@Override
	public List<DrvIllegalInfo> driverexamineFindAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<DrvIllegalInfo>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public void updateExamine(String sqlId , DrvIllegalInfo drvIllegalInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , drvIllegalInfo);
	}
	
	@Override
	public void addDriverwzwf(String sqlId , DrvIllegalInfo drvIllegalInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , drvIllegalInfo);
	}
	
	@Override
	public List<DrvActionInfo> driverlawaddFindAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<DrvActionInfo>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public void DriverlawInsert(String sqlId , DrvActionInfo drvActionInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , drvActionInfo);
	}
	
	@Override
	public List<CarIllegalInfo> CarIllegalInfofindAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<CarIllegalInfo>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public CarIllegalInfo CarIllegalInfofindById(String sqlId, String car_illegal_id)
			throws Exception {
		return (CarIllegalInfo) baseDaoSupport.findForObject(sqlId, car_illegal_id);
	}
	
	@Override
	public void updatecarDetermine(String sqlId , CarIllegalInfo carIllegalInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , carIllegalInfo);
	}
	
	@Override
	public void addCarwzwf(String sqlId , CarIllegalInfo carIllegalInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , carIllegalInfo);
	}
	
	@Override
	public List<CarIllegalInfo> carexamineFindAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<CarIllegalInfo>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public void updatecarExamine(String sqlId , CarIllegalInfo carIllegalInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , carIllegalInfo);
	}
	
	@Override
	public List<CarActionInfo> carlawaddFindAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<CarActionInfo>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public void CarlawInsert(String sqlId , CarActionInfo carActionInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , carActionInfo);
	}
	
	@Override
	public List<DrvIllegalInfo> zfjcillegalFindAll(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<DrvIllegalInfo>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public List<DrvIllegalInfo> drvillegalSearch(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<DrvIllegalInfo>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public List<CarIllegalInfo> carillegalSearch(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<CarIllegalInfo>) baseDaoSupport.findForList(sqlId,map);
	}
	
	@Override
	public Map drvCanalysisInfo(String sqlId,Map map) throws Exception {
		return (Map) baseDaoSupport.findForObject(sqlId, map);

	}
	
	@Override
	public Map carCanalysisInfo(String sqlId,Map map) throws Exception {
		return (Map) baseDaoSupport.findForObject(sqlId, map);

	}
	
	@Override
	public void insertdrvcaseinfo(String sqlId , DrvPlantCaseInfo drvCaseInfo) throws Exception {
		 baseDaoSupport.findForObject(sqlId , drvCaseInfo);
	}
	
	@Override
	public List<Map> findXzspCertno(String sqlId) throws Exception {
		 return (List<Map>)baseDaoSupport.findForList(sqlId , null);
	}
	
	@Override
	public int saveIllCar(String sqlId, CtlIllegalCarMonitor illCar) throws Exception {
		return  (Integer) baseDaoSupport.save(sqlId, illCar);
	}
	
	@Override
	public List<CtlIllegalCarMonitor> findIllegaCar(String sqlId, Map<String, Object> map) throws Exception {
		return  (List<CtlIllegalCarMonitor>) baseDaoSupport.findForList(sqlId,map);
	}
}

