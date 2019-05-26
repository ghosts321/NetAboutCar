package com.nasoft.aboutcar.menuinfo.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.menuinfo.domain.MenuInfo;
import com.nasoft.aboutcar.menuinfo.service.MenuInfoService;
@Service("menuInfoService")
public class MenuInfoServiceImpl implements MenuInfoService {

	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public List<MenuInfo> findMenuInfo(String sqlId, Map<String, Object> map) {
		try {
			return (List<MenuInfo>) baseDaoSupport.findForList(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public MenuInfo searchById(String sqlId, Map<String, Object> map) {
		try {
			return (MenuInfo) baseDaoSupport.findForObject(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int insert(String sqlId, MenuInfo menuInfo) {
		try {
			return (Integer) baseDaoSupport.save(sqlId, menuInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int update(String sqlId, MenuInfo menuInfo) {
		try {
			return (Integer) baseDaoSupport.update(sqlId, menuInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int delete(String sqlId, Map<String, Object> map) {
		try {
			return (Integer) baseDaoSupport.delete(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int updateMenuStatus(String sqlId, Map<String, Object> map) {
		try {
			return (Integer) baseDaoSupport.update(sqlId, map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
