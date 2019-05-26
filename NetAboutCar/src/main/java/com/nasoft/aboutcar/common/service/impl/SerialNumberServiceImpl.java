package com.nasoft.aboutcar.common.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.service.impl.BaseServiceImpl;
import com.nasoft.aboutcar.common.domain.MngSerialnumber;
import com.nasoft.aboutcar.common.service.SerialNumberService;

 
@Service
public class SerialNumberServiceImpl extends BaseServiceImpl implements SerialNumberService{ 
	
	/**
	 * 
	 * @param id
	 * @param circleParam 循环参数，若参数与库里参数发生变化则重置
	 * @return
	 * @throws Exception 
	 */
	 public MngSerialnumber getCurrNoProcess(String id,String circleParam,int updateDate) throws Exception{
		MngSerialnumber sn= getSerialNumber(id);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		System.out.println(df.format(new Date()));
		
		if(circleParam!=null && !circleParam.equals("")){
			if(!sn.getCircleParam().equals(circleParam)){
				sn.setCurrNo(0);
				sn.setCircleParam(circleParam);
			}
		}
		
//		sn.setCurrNo(sn.getCurrNo()+sn.getStep());
		sn.setCurrNo(sn.getCurrNo()+updateDate);
		if(sn.getCurrNo()<sn.getMinNo())sn.setCurrNo(sn.getMinNo());
		if(sn.getCurrNo()>sn.getMaxNo()){
			if(sn.getIsCircle()==null || sn.getIsCircle().equals("") 
					|| sn.getIsCircle().equals("0")){
				throw new Exception("序列号已经达到了最大值");
			}else{
				sn.setCurrNo(sn.getMinNo());
			}
		}
		sn.setUpdateDate(new Date());
		updateSerialNumber(sn);
//		if(i<1)throw new Exception("序列号更新失败");		
		return sn;
	}
	 

		/**
		 * 
		 * @param id
		 * @param circleParam 循环参数，若参数与库里参数发生变化则重置
		 * @return
		 * @throws Exception 
		 */
	 @Override
	 public MngSerialnumber getCurrNoProcess(String id,String circleParam) throws Exception{
		 MngSerialnumber sn= getSerialNumber(id);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//System.out.println(df.format(new Date()));
			
			if(circleParam!=null && !circleParam.equals("")){
				if(!sn.getCircleParam().equals(circleParam)){
					sn.setCurrNo(0);
					sn.setCircleParam(circleParam);
				}
			}
			
			sn.setCurrNo(sn.getCurrNo()+sn.getStep());
			if(sn.getCurrNo()<sn.getMinNo())sn.setCurrNo(sn.getMinNo());
			if(sn.getCurrNo()>sn.getMaxNo()){
				if(sn.getIsCircle()==null || sn.getIsCircle().equals("") 
						|| sn.getIsCircle().equals("0")){
					throw new Exception("序列号已经达到了最大值");
				}else{
					sn.setCurrNo(sn.getMinNo());
				}
			}
			sn.setUpdateDate(new Date());
			updateSerialNumber(sn);
//			if(i<1)throw new Exception("序列号更新失败");		
			return sn;
		}
	 
	 /**
		 * 
		 * @param id
		 * @param circleParam 循环参数，若参数与库里参数发生变化则重置
		 * @return
		 * @throws Exception 
		 */
	 @Override
		 public MngSerialnumber getCurrNoProcess(String id) throws Exception{
		 MngSerialnumber sn= getSerialNumber(id);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
						
			sn.setCurrNo(sn.getCurrNo()+sn.getStep());
			if(sn.getCurrNo()<sn.getMinNo())sn.setCurrNo(sn.getMinNo());
			if(sn.getCurrNo()>sn.getMaxNo()){
				if(sn.getIsCircle()==null || sn.getIsCircle().equals("") 
						|| sn.getIsCircle().equals("0")){
					throw new Exception("序列号已经达到了最大值");
				}else{
					sn.setCurrNo(sn.getMinNo());
				}
			}
			sn.setUpdateDate(new Date());
			updateSerialNumber(sn);
//			if(i<1)throw new Exception("序列号更新失败");		
			return sn;
		}

	@Override
	public MngSerialnumber getSerialNumber(String id) throws Exception {
		MngSerialnumber  serialNumber  = findForObject2("com.nasoft.aboutcar.MngSerialnumberMapper.selectById", id);
		return serialNumber;
	}

	@Override
	public void updateSerialNumber(MngSerialnumber serialNumber) throws Exception {
		update2("com.nasoft.aboutcar.MngSerialnumberMapper.updateIfNotnull",serialNumber);
	}



	
}
