package com.nasoft.SSM.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.SSM.base.dao.BaseDao;
import com.nasoft.SSM.domain.DrvPermitapply;
import com.nasoft.SSM.domain.DrvUserinfo;
import com.nasoft.SSM.service.DrvPermitapplyService;

@Service("DrvPermitapplyService")
public class DrvPermitapplyServiceImpl implements DrvPermitapplyService {

	
	@Resource
	private BaseDao baseDaoSupport;
	@Override
	public void addDrvPermitapply(String sqlId,DrvPermitapply drvPermitapply) throws Exception {
		baseDaoSupport.save(sqlId, drvPermitapply);
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void addDrvApply(DrvUserinfo drvUserinfo,DrvPermitapply drvPermitapply) throws Exception {
		//驾驶员基本信息
		DrvUserinfo userinfo = (DrvUserinfo) baseDaoSupport.findForObject("com.nasoft.SSM.DrvUserinfo.selectByCertno", drvUserinfo.getCertno());
		if(null == userinfo){
			baseDaoSupport.save("com.nasoft.SSM.DrvUserinfo.addDrvUserinfo", drvUserinfo);
		}else{
			baseDaoSupport.update("com.nasoft.SSM.DrvUserinfo.updateDrvUserinfo", drvUserinfo);
		}
		//驾驶员申请信息
		List<DrvPermitapply> permitapplyList = selectByCertno("com.nasoft.SSM.DrvPermitapply.selectByCertno", drvUserinfo.getCertno());
		if(permitapplyList.size() <= 0){
			addDrvPermitapply("com.nasoft.SSM.DrvPermitapply.addDrvPermitapply", drvPermitapply);
		}else{
			drvPermitapply.setApplyid(permitapplyList.get(0).getApplyid());
			drvPermitapply.setApplytype(permitapplyList.get(0).getApplytype());
			if(StringUtils.isBlank(drvPermitapply.getPhoto())){
				drvPermitapply.setPhoto(permitapplyList.get(0).getPhoto());
			}
			if(StringUtils.isBlank(drvPermitapply.getCertphoto())){
				drvPermitapply.setCertphoto(permitapplyList.get(0).getCertphoto());
			}
			if(StringUtils.isBlank(drvPermitapply.getDrivecardphoto())){
				drvPermitapply.setDrivecardphoto(permitapplyList.get(0).getDrivecardphoto());
			}
			updateDrvPermitapply("com.nasoft.SSM.DrvPermitapply.updateDrvPermitapply", drvPermitapply);
		}
	}
	
	@Override
	public void updateDrvPermitapply(String sqlId,DrvPermitapply drvPermitapply) throws Exception {
		baseDaoSupport.update(sqlId, drvPermitapply);
	}
	@Override
	public void deleteByApplyid(String sqlId, int applyId) throws Exception {
		baseDaoSupport.delete(sqlId, applyId);
	}
	@Override
	public DrvPermitapply selectByApplyid(String sqlId, int applyId) throws Exception {
		return (DrvPermitapply) baseDaoSupport.findForObject(sqlId, applyId);
	}
	@Override
	public List<DrvPermitapply> selectByCertno(String sqlId, String certno) throws Exception {
		return (List<DrvPermitapply>) baseDaoSupport.findForList(sqlId, certno);
	}

}
