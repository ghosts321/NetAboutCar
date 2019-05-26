package com.nasoft.aboutcar.platform.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.car.domain.CarApprove;
import com.nasoft.aboutcar.car.domain.CarPermitApply;
import com.nasoft.aboutcar.car.domain.CarPermitcert;
import com.nasoft.aboutcar.instInfo.domain.InstInfo;
import com.nasoft.aboutcar.platform.domain.Platform;
import com.nasoft.aboutcar.platform.domain.PlatformApply;
import com.nasoft.aboutcar.platform.domain.PlatformApprove;
import com.nasoft.aboutcar.platform.domain.PlatformPermitcert;

public interface PlatformService {

	List<Platform> findAllPlatform(String sqlId, String flag) throws Exception;
	
	Platform findPlatformById(String sqlId, String creditCode) throws Exception;
	
	List<PlatformApply> findAllPlatformApply(String sqlId, Map<String, Object> map) throws Exception;
	
	PlatformApply findPlatformApplyById(String sqlId, String creditCode) throws Exception;
	
	public void updateApplyStatus(String sqlId,PlatformApply pa) throws Exception;
	
	public PlatformApprove findApproveById(String sqlId,String creditCode) throws Exception;

	public void addPlatformApprove(String sqlId,PlatformApprove platformApprove) throws Exception;

	public void addPlatformPermitcert(String sqlId, PlatformPermitcert platformPermitcert) throws Exception;
	
	//修改车辆证书表状态
	public void updateCertByApplyid(String sqlId,PlatformPermitcert platformPermitcert) throws Exception;
	//查询证书列表信息
	public List<Map> selectAllCertInfo(String sqlId,Map<String, Object> map) throws Exception;
	//查询汽车经营许可证
	PlatformPermitcert findPermitcertByCredCode(String string, String creditCode) throws Exception ;

	List<Map> findInstByCreditcode(String string, String creditCode)throws Exception;

	List<Map> findApproveListByApplyId(String sqlId, String applyId)throws Exception ;

	PlatformApply findPlatformApplyByMap(String string, Map<String, Object> map) throws Exception;

}
