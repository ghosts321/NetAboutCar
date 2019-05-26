package com.nasoft.SSM.service;

import java.util.List;

import com.nasoft.SSM.domain.BespeakSum;
import com.nasoft.SSM.domain.CarPermitApply;
import com.nasoft.SSM.domain.PilotBespeak;

public interface PilotBespeakService {
	public void addDrvSpeak(String sqlId,PilotBespeak ds) throws Exception;
	public List<BespeakSum> selectbespeak(String sqlId,String date) throws Exception;
	public Integer updateOrderInfo(String sqlId, BespeakSum bespeakSum) throws Exception;
	public List<CarPermitApply> selectCarInfo(String sqlId,String certno) throws Exception;
	public List<BespeakSum> selectByDistinctDate(String sqlId,BespeakSum bespeakSum) throws Exception;


}
