package com.nasoft.SSM.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.DrvChangeapply;
import com.nasoft.SSM.domain.DrvPermitapply;
import com.nasoft.SSM.domain.DrvUserinfo;
import com.nasoft.SSM.service.DrvChangeapplyService;

@Service("DrvChangeapplyService")
public class DrvChangeapplyServiceImpl implements DrvChangeapplyService {
	
	@Resource
	private BaseDao baseDaoSupport;
	
	@Override
	public DrvChangeapply selectByApplyid(String sqlId, int applyId) throws Exception {
		return (DrvChangeapply) baseDaoSupport.findForObject(sqlId, applyId);
	}
	
	@Override
	public DrvChangeapply selectByCertno(String sqlId, String certno) throws Exception {
		return (DrvChangeapply) baseDaoSupport.findForObject(sqlId, certno);
	}
	
	@Override
	public void addDrvChangeapply(String sqlId,DrvChangeapply drvChangeapply) throws Exception {
		baseDaoSupport.save(sqlId, drvChangeapply);
	}
	
	@Override
	public void updateDrvChangeapply(String sqlId,DrvChangeapply drvChangeapply) throws Exception {
		baseDaoSupport.update(sqlId, drvChangeapply);
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public void addChangeApply(DrvUserinfo drvUserinfo,DrvChangeapply drvChangeapply) throws Exception {
		//驾驶员基本信息
		baseDaoSupport.update("com.nasoft.SSM.DrvUserinfo.updateDrvUserinfo", drvUserinfo);
		//驾驶员变更申请信息
		DrvChangeapply changeapply = (DrvChangeapply) baseDaoSupport.findForObject("com.nasoft.SSM.DrvChangeapply.selectByCertno", drvUserinfo.getCertno());
		if(null == changeapply){
			if(StringUtils.isBlank(drvChangeapply.getPhoto()) || StringUtils.isBlank(drvChangeapply.getCertphoto()) || StringUtils.isBlank(drvChangeapply.getDrivecardphoto())){
				List<DrvPermitapply> permitapplyList = (List<DrvPermitapply>) baseDaoSupport.findForList("com.nasoft.SSM.DrvPermitapply.selectByCertno", drvUserinfo.getCertno());
				if(permitapplyList.size() > 0){
					drvChangeapply.setCheckstatus(permitapplyList.get(0).getCheckstatus());
					if(StringUtils.isBlank(drvChangeapply.getPhoto())){
						drvChangeapply.setPhoto(permitapplyList.get(0).getPhoto());
					}
					if(StringUtils.isBlank(drvChangeapply.getCertphoto())){
						drvChangeapply.setCertphoto(permitapplyList.get(0).getCertphoto());
					}
					if(StringUtils.isBlank(drvChangeapply.getDrivecardphoto())){
						drvChangeapply.setDrivecardphoto(permitapplyList.get(0).getDrivecardphoto());
					}
				}
			}
			addDrvChangeapply("com.nasoft.SSM.DrvChangeapply.addDrvChangeapply", drvChangeapply);
		}else{
			drvChangeapply.setAppstatus("0");
			drvChangeapply.setUpddatetime(new Date());
			if(StringUtils.isBlank(drvChangeapply.getPhoto())){
				drvChangeapply.setPhoto(changeapply.getPhoto());
			}
			if(StringUtils.isBlank(drvChangeapply.getCertphoto())){
				drvChangeapply.setCertphoto(changeapply.getCertphoto());
			}
			if(StringUtils.isBlank(drvChangeapply.getDrivecardphoto())){
				drvChangeapply.setDrivecardphoto(changeapply.getDrivecardphoto());
			}
			updateDrvChangeapply("com.nasoft.SSM.DrvChangeapply.updateDrvChangeapply", drvChangeapply);
		}
		
	}
}
