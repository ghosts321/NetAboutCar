package com.nasoft.SSM.service;

import java.util.List;

import com.nasoft.SSM.domain.BespeakSum;
import com.nasoft.SSM.domain.DrvBespeak;
import com.nasoft.SSM.domain.DrvPermitapply;

public interface DrvBespeakService {
	public void addDrvSpeak(String sqlId,DrvBespeak ds) throws Exception;
	public List<BespeakSum> selectbespeak(String sqlId,String date) throws Exception;
	public Integer updateOrderInfo(String sqlId, BespeakSum bespeakSum) throws Exception;
	public List<DrvPermitapply> selectDrvApply(String sqlId,String certno) throws Exception;
	public List<BespeakSum> selectByDistinctDate(String sqlId,BespeakSum bespeakSum) throws Exception;


}
