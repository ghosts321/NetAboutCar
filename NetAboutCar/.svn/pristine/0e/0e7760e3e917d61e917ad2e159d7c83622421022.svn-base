package com.nasoft.aboutcar.credit.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.base.service.impl.BaseServiceImpl;
import com.nasoft.aboutcar.credit.domain.CxkhCarBlacklist;
import com.nasoft.aboutcar.credit.domain.CxkhComPunRecord;
import com.nasoft.aboutcar.credit.domain.CxkhDrvAnnualWork;
import com.nasoft.aboutcar.credit.domain.CxkhDrvBlacklist;
import com.nasoft.aboutcar.credit.domain.CxkhDrvPunRecord;
import com.nasoft.aboutcar.credit.service.CreditService;
import com.nasoft.util.DateTime;
@Service
public class CreditServiceImpl extends BaseServiceImpl implements CreditService{
//	@Resource
//	private BaseDao baseDaoSupport;
//	
	@Override
	public List<Map> findCreditDriverPunishmentList(String sqlId,
			Map<String, String> map) throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public List<Map> findCxhDrvPunListByListNo(String sqlId, String listNo)
			throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId,listNo);
	}
	@Override
	public void addCxkhDrvPunRecord(String sqlId, CxkhDrvPunRecord record)
			throws Exception {
		baseDaoSupport.save(sqlId,record);
		
	}
	@Override
	public List<Map> findDrvExaminationList(String sqlId,
			Map<String, String> map) throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public List<CxkhDrvAnnualWork> findAllYear(String sqlId) throws Exception {
		
		return( List<CxkhDrvAnnualWork>) baseDaoSupport.findForList(sqlId,"");
	}
	@Override
	public List<Map> findCreditDriverByDrivecardno(String sqlId,
			String drivecardno) throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, drivecardno);
	}
	@Override
	public void updateCxkhDrvPunListByListNo(String sqlId, Map<String,String> map)
			throws Exception {
		baseDaoSupport.update(sqlId, map);
		
	}
	@Override
	public List<Map> findCreditPlatListByComName(String sqlId, Map<String,String> map)
			throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public List<Map> findCxhkPlatPunListByListNo(String sqlId, String listNo)
			throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, listNo);
	}
	@Override
	public void addCxkhPlatPunRecord(String sqlId, CxkhComPunRecord record)
			throws Exception {
		baseDaoSupport.save(sqlId, record);
		
	}
	@Override
	public void updateCxkhPlatPunListByListNo(String sqlId,
			Map<String, String> map) throws Exception {
	baseDaoSupport.update(sqlId, map);
		
	}
	@Override
	public List<Map> findPlatExaminationList(String sqlId,
			Map<String, String> map) throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, map);
	}
	@Override
	public List<Map> findCreditPlatByCreditcode(String sqlId, String comLicense)
			throws Exception {
		
		return (List<Map>) baseDaoSupport.findForList(sqlId, comLicense);
	}

	
	@Override
	public List<String> removeDrvBlByExpired() throws Exception{
		
		List<String> msgs=new ArrayList<String>();

		try{
			
	    	DateTime dt=new DateTime(new DateTime().delOneDay().getTextDate()).addOneDay().delSecond(1);
	    	msgs.add("["+new DateTime().getText()+"]:系统开始检查并从驾驶员黑名单中移除到期驾驶员");
	    	
	    	CxkhDrvBlacklist cdbl=new CxkhDrvBlacklist();
	    	cdbl.setPreRemoveDateEnd(dt.turnIntoDate());
	    	cdbl.setStatus("0");
	    	
	    	List<CxkhDrvBlacklist> list=baseDaoSupport.findForList2("com.nasoft.aboutcar.CxkhDrvBlacklistMapper.selectList", cdbl);
    	
	    	int i=0,j=0;
	    	for(CxkhDrvBlacklist c:list){
	    		try{
	    			i++;
		    		c.setRemoveDate(new Date());
		    		c.setStatus("1");
		    		c.setRemoveReason("到期移除");
		    		baseDaoSupport.update2("com.nasoft.aboutcar.CxkhDrvBlacklistMapper.updateIfNotnull", c);		    					    			
		    		msgs.add("["+new DateTime().getText()+"]:"+c.getDrvName()+"移除成功");		   
	    		}catch(Exception ex){
	    			j++;
					msgs.add("["+new DateTime().getText()+"]:移除"+c.getDrvName()+"失败");
					ex.printStackTrace();
	    		}
	    	}
    		msgs.add("["+new DateTime().getText()+"]:共到期驾驶员"+list.size()+"名，"+i+"名成功移除，"+j+"名移除失败。");		   				
		}catch(Exception e){
			throw new Exception("驾驶员黑名单移除到期驾驶员失败",e);
		}finally{
			for(String msg:msgs){
				System.out.println(msg);
			}
		}
		
		return msgs;
	}
	
	@Override
	public List<String> removeCarBlByExpired() throws Exception{
		
		List<String> msgs=new ArrayList<String>();

		try{
			
	    	DateTime dt=new DateTime(new DateTime().delOneDay().getTextDate()).addOneDay().delSecond(1);
	    	msgs.add("["+new DateTime().getText()+"]:系统开始检查并从车辆黑名单中移除到期车辆");
	    	
	    	CxkhCarBlacklist ccbl=new CxkhCarBlacklist();
	    	ccbl.setPreRemoveDateEnd(dt.turnIntoDate());
	    	ccbl.setStatus("0");
	    	
	    	List<CxkhCarBlacklist> list=baseDaoSupport.findForList2("com.nasoft.aboutcar.CxkhCarBlacklistMapper.selectList", ccbl);
    	
	    	int i=0,j=0;
	    	for(CxkhCarBlacklist c:list){
	    		try{
	    			i++;
		    		c.setRemoveDate(new Date());
		    		c.setStatus("1");
		    		c.setRemoveReason("到期移除");
		    		baseDaoSupport.update2("com.nasoft.aboutcar.CxkhCarBlacklistMapper.updateIfNotnull", c);		    					    			
		    		msgs.add("["+new DateTime().getText()+"]:"+c.getCarnum()+"移除成功");		   
	    		}catch(Exception ex){
	    			j++;
					msgs.add("["+new DateTime().getText()+"]:移除"+c.getCarnum()+"失败");
					ex.printStackTrace();
	    		}
	    	}
    		msgs.add("["+new DateTime().getText()+"]:共到期车辆"+list.size()+"名，"+i+"成功移除，"+j+"移除失败。");		   				
		}catch(Exception e){
			throw new Exception("车辆黑名单移除到期车辆失败",e);
		}finally{
			for(String msg:msgs){
				System.out.println(msg);
			}
		}
		
		return msgs;
	}
	
}
