package com.nasoft.aboutcar.common.service;

import com.nasoft.aboutcar.base.service.BaseService;
import com.nasoft.aboutcar.common.domain.MngSerialnumber;



/**
 * 
 * @author 
 * @version1.0
 * 
 *   
 */
public interface SerialNumberService extends BaseService {
       
	MngSerialnumber   getSerialNumber(String id) throws Exception;
	void  updateSerialNumber(MngSerialnumber  serialNumber) throws Exception;
	MngSerialnumber getCurrNoProcess(String id,String circleParam,int updateDate) throws Exception;
	MngSerialnumber getCurrNoProcess(String id, String circleParam)
			throws Exception;
	MngSerialnumber getCurrNoProcess(String id) throws Exception;
}
