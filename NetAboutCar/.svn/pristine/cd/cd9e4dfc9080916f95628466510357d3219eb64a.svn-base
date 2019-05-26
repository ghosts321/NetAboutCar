package com.nasoft.aboutcar.credit.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.nasoft.aboutcar.credit.domain.DrvBlacklist;
import com.nasoft.aboutcar.pilotapply.domain.DrvUserinfo;

public interface DrvBlacklistService {
	public ArrayList<DrvBlacklist> selectAllDrvBlacklist(String sql,HashMap<String,Object> map) throws Exception;

	public DrvBlacklist selectOneById(String sql, String type_code) throws Exception;
	
	public int addDrvBlacklist(String sql, DrvBlacklist drvBlacklist) throws Exception;
	
	public int updateDrvBlacklist(String sql, DrvBlacklist drvBlacklist) throws Exception;

	public List<DrvUserinfo> getDrvNameList(String string, Object object) throws Exception;
}
