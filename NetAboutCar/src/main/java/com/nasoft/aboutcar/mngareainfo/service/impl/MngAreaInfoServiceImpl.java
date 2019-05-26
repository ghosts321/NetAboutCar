package com.nasoft.aboutcar.mngareainfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.mngareainfo.domain.MngAreaInfo;
import com.nasoft.aboutcar.mngareainfo.service.MngAreaInfoService;

@Service("mngAreaInfoService")
public class MngAreaInfoServiceImpl implements MngAreaInfoService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public List<MngAreaInfo> findAreaList(String sqlId, Map<String,Object> map) {
		try {
			List<MngAreaInfo> areaInfoList = (List<MngAreaInfo>) baseDaoSupport.findForList(sqlId, map);
			return areaInfoList;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	
	

	
}