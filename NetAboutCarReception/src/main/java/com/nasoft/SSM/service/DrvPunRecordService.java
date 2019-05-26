package com.nasoft.SSM.service;

import java.util.List;
import java.util.Map;

import com.nasoft.SSM.domain.DrvAppeals;

public interface DrvPunRecordService {
	//获取申诉信息
	List<Map> findAllRecord(String string, String certno)throws Exception ;
	//获取处分详情
	List<Map> findAllRecord(String sqlId, Map<String, String> map)throws Exception;
	//获取指标分类
	List<Map> findAllIndicType(String sqlId, String certno)throws Exception;
	//添加申诉记录
	void addAppeal(String sqlId, DrvAppeals drvAppeals)throws Exception;

}
