package com.nasoft.SSM.service;

import java.util.HashMap;
import java.util.List;

import com.nasoft.SSM.domain.BespeakSum;
import com.nasoft.SSM.domain.DrvExamBespeak;

public interface DrvExamBespeakService {
	/**
	 * 添加驾驶员考试预约
	 * @param sqlId1 添加驾驶员预约信息
	 * @param sqlId2 更新监控平台中预约设置的预约人数
	 * @param drvExamBespeak
	 * @throws Exception
	 */
	public void addDrvExamBespeak(String sqlId1,String sqlId2, DrvExamBespeak drvExamBespeak) throws Exception;

	/**
	 * 获取预约年月
	 * @param sqlId
	 * @param drvExamBespeak
	 * @throws Exception
	 */
	public List<DrvExamBespeak> getBespeakYear(String sqlId,DrvExamBespeak drvExamBespeak) throws Exception;

	/**
	 * 获取监控平台的预约设置
	 * @param sqlId
	 * @param drvExamBespeak
	 * @return
	 * @throws Exception
	 */
	public DrvExamBespeak getBespeakData(String sqlId, DrvExamBespeak drvExamBespeak) throws Exception;

	/**
	 * 根据身份证查询考试预约
	 * @param sqlId
	 * @param certno
	 * @return
	 * @throws Exception
	 */
	public DrvExamBespeak selectByCertno(String sqlId, String certno) throws Exception;

	public List<DrvExamBespeak> getDrvBespeakSum(String sqlId, HashMap<String, Object> map) throws Exception;

	public List<DrvExamBespeak> findDrvExamBespeakById(String sqlId, Integer bespeak_id) throws Exception;

}
