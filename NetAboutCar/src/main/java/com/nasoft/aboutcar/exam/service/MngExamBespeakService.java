package com.nasoft.aboutcar.exam.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.exam.domain.MngExamBespeak;

public interface MngExamBespeakService {
	/**
	 * 添加驾驶员考试预约
	 * @param sqlId
	 * @param drvExamBespeak
	 * @return 
	 * @throws Exception
	 */
	public int addMngExamBespeak(String sqlId,MngExamBespeak mngExamBespeak) throws Exception;

	public List<MngExamBespeak> findAllExamBespeak(String sqlId,Map<String, Object> map) throws Exception;
	
	public MngExamBespeak finMngExamBespeakById(String sqlId, String bespeakid) throws Exception;
	
	public int updateMngExamBespeak(String sqlId,MngExamBespeak mngExamBespeak) throws Exception;

	public void batchDelMngExamBespeak(String sqlId, String bespeakids) throws Exception;

}
