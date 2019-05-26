package com.nasoft.aboutcar.setAssemblePlace.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.mngoperating.domain.MngOperatingTimeSet;
import com.nasoft.aboutcar.setAssemblePlace.domain.SetAssemblePlace;
import com.nasoft.aboutcar.setAssemblePlace.service.SetAssemblePlaceService;

@Service
public class SetAssemblePlaceServiceImpl  implements SetAssemblePlaceService {
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public List<SetAssemblePlace> findAllAssemblePlaceSet(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (List<SetAssemblePlace>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public int setState(String sqlId, Map<String, Object> map) throws Exception {
		
		return  (Integer) baseDaoSupport.update(sqlId, map);
	}

	@Transactional
	@Override
	public void batchDelAssemblePlace(String sqlId, String operatingids) throws Exception {
		String[] mngOperatingids = operatingids.split(",");
		for(String id : mngOperatingids){
			baseDaoSupport.delete(sqlId, id);
		}
	}

	@Override
	public List<SetAssemblePlace> selectAssemblePlaceIsHave(String sqlId, Map<String, Object> map) throws Exception {
		return (List<SetAssemblePlace>) baseDaoSupport.findForList(sqlId, map);
	}

	@Override
	public int addAssemblePlaceSet(String sqlId, SetAssemblePlace setAssemblePlace) throws Exception {
		return  (Integer) baseDaoSupport.save(sqlId, setAssemblePlace);
	}

	@Override
	public int updateAssemblePlace(String sqlId, SetAssemblePlace setAssemblePlace) throws Exception {
		return (Integer) baseDaoSupport.update(sqlId, setAssemblePlace);
	}

	@Override
	public SetAssemblePlace findAssemblePlaceById(String sqlId, Map<String, Object> map) throws Exception {
		return (SetAssemblePlace) baseDaoSupport.findForObject(sqlId, map);
	}
	
}
