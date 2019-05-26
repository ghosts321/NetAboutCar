package com.nasoft.aboutcar.drvuserinfo.service;

import java.util.List;
import java.util.Map;

import com.nasoft.aboutcar.drvuserinfo.domain.DrvUserinfo;
import com.nasoft.aboutcar.drvuserinfo.domain.DrvUserreg;

public interface DrvUserInfoService {
	/**
	 * 查询驾驶员的列表信息
	 * @param string
	 * @return
	 */
	List<DrvUserinfo> findDrvUserList(String sqlId,Map<String,String> map) throws Exception;
	/**
	 * 通过certno查询驾驶员信息
	 * @param string
	 * @param certno
	 * @return
	 */
	DrvUserreg findDrvUserByCertno(String sqlId, String certno) throws Exception;
	/**
	 * 通过certno修改驾驶员密码
	 * @param string
	 * @param certno
	 */
	void updateDrvUserByCertno(String sqlId, Map<String,String> map)throws Exception;

}
