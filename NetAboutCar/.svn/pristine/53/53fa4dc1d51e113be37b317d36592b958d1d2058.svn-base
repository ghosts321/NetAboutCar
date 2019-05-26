package com.nasoft.aboutcar.credit.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.base.service.BaseService;
import com.nasoft.aboutcar.credit.domain.CxkhComPunRecord;
import com.nasoft.aboutcar.credit.domain.CxkhDrvAnnualWork;
import com.nasoft.aboutcar.credit.domain.CxkhDrvPunRecord;

public interface CreditService extends BaseService {
	//查找驾驶员处罚
	List<Map> findCreditDriverPunishmentList(String sqlId,
			Map<String, String> map) throws Exception;
	//通过单号查找驾驶员
	List<Map> findCxhDrvPunListByListNo(String sqlId, String listNo) throws Exception;
	//添加驾驶员公布名单
	void addCxkhDrvPunRecord(String sqlId, CxkhDrvPunRecord record)throws Exception;
	//查找驾驶员诚信处分考核
	List<Map> findDrvExaminationList(String sqlId, Map<String, String> map)throws Exception;
	//查询所有的年份
	List<CxkhDrvAnnualWork> findAllYear(String sqlId)throws Exception;
	//通过驾驶证查询详细
	List<Map> findCreditDriverByDrivecardno(String sqlId, String drivecardno)throws Exception;
	//设置公式状态
	void updateCxkhDrvPunListByListNo(String sqlId, Map<String,String> map)throws Exception;
	//通过平台名查询平台处罚列表
	List<Map> findCreditPlatListByComName(String string, Map<String,String> map)throws Exception;
	//通过订单号去查询平台处分表
	List<Map> findCxhkPlatPunListByListNo(String sqlId, String listNo)throws Exception;
	//公布名单
	void addCxkhPlatPunRecord(String sqlId, CxkhComPunRecord record)throws Exception;
	//修改名单状态
	void updateCxkhPlatPunListByListNo(String sqlId, Map<String, String> map)throws Exception;
	//查找平台处分列表
	List<Map> findPlatExaminationList(String sqlId, Map<String, String> map)throws Exception;
	//查询平台的详细
	List<Map> findCreditPlatByCreditcode(String sqlId, String comLicense)throws Exception;
	List<String> removeDrvBlByExpired() throws Exception;
	List<String> removeCarBlByExpired() throws Exception;

}
