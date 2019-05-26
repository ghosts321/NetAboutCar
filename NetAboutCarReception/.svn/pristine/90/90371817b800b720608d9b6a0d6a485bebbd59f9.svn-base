package com.nasoft.SSM.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.nasoft.SSM.domain.ComAppealD;
import com.nasoft.SSM.domain.ComAppeals;
import com.nasoft.SSM.domain.ComScoreRecord;
import com.nasoft.SSM.domain.Platform;
import com.nasoft.SSM.domain.PlatformApply;
import com.nasoft.SSM.domain.PlatformPermitcert;

/**
 * 平台资质业务申请
 * @author 周鹏飞
 *
 */
public interface PlatformApplyService {

	public void addPlatform(String sqlId,Platform platform) throws Exception;
	
	public void updatePlatform(String sqlId,Platform platform) throws Exception;
	
	public void addPlatformtApply(String sqlId,PlatformApply platformApply) throws Exception;
	
	public List<PlatformApply> findPlatformtApplyByNo(String sqlId,String creditCode) throws Exception;
	
	public Platform findPlatformByCreditCode(String sqlId,String creditCode) throws Exception;

	public void deletePlatformByCreditCode(String sqlId,String creditCode) throws Exception;
	
	public void deletePermitApplyByApplyId(String sqlId,String applyId) throws Exception;

	public List<Platform> selectAllPlatForm(String sqlId) throws Exception;
	
	public PlatformPermitcert selectByCondition(String sqlId,Map<String,String> map) throws Exception;


	public PlatformApply findComPermitApplyByApplyid(String sqlId, String applyId) throws Exception;

	public PlatformApply findComChangeApplyByApplyid(String sqlId, String applyId) throws Exception;
	
	public PlatformApply findComPermitApplyByMap(String sqlId, HashMap<String, Object> map) throws Exception;

	public List<Map<String,Object>> findPunishInfo(String sqlId, String creditcode) throws Exception;

	public List<ComScoreRecord> findComScoreRecord(String sqlId, String creditCode) throws Exception;

	public void addComAppealD(String sqlId, ComAppealD comAppealD) throws Exception;

	public void addComAppeals(String sqlId, ComAppeals comAppeals) throws Exception;

	public ComAppeals findComAppealsByCreditcode(String sqlId, String creditcode) throws Exception;

	public void updateComScoreRecord(String sqlId, Map map) throws Exception;

}
