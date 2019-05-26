package com.nasoft.aboutcar.credit.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.base.service.impl.BaseServiceImpl;
import com.nasoft.aboutcar.credit.domain.ComAnnualWork;
import com.nasoft.aboutcar.credit.domain.ComEventReview;
import com.nasoft.aboutcar.credit.domain.ComScoreRecord;
import com.nasoft.aboutcar.credit.domain.CxkhDrvAnnualWork;
import com.nasoft.aboutcar.credit.domain.DrvEventReview;
import com.nasoft.aboutcar.credit.domain.DrvScoreRecord;
import com.nasoft.aboutcar.credit.domain.Events;
import com.nasoft.aboutcar.credit.service.DrvEventReviewService;
import com.nasoft.util.DateTime;
import com.nasoft.util.DateUtil;

@Service("DrvEventReviewService")
public class DrvEventReviewServiceImpl extends BaseServiceImpl implements DrvEventReviewService {
	
	@Override
	public void addDrvEventReview(String sqlId, DrvEventReview drvEventReview)throws Exception {
		baseDaoSupport.save(sqlId, drvEventReview);	
	}
	
	@Override
	public DrvEventReview findByEventNo(String sqlId,String event_no) throws Exception {
		return (DrvEventReview) baseDaoSupport.findForObject(sqlId, event_no);
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void drvEventReview(DrvEventReview drvEventReview,List<DrvScoreRecord> scoreRecordList,String score) throws Exception {
		//驾驶员失信事件审核表
		addDrvEventReview("com.nasoft.aboutcar.DrvEventReview.addDrvEventReview", drvEventReview);
		//驾驶员失信记分表
		if(scoreRecordList.size() > 0){
			for(DrvScoreRecord drvScoreRecord : scoreRecordList){
				drvScoreRecord.setReview_no(drvEventReview.getReview_no());
				baseDaoSupport.save("com.nasoft.aboutcar.DrvScoreRecord.addDrvScoreRecord", drvScoreRecord);
			}
		}
		//修改失信事件状态
		Events events = new Events();
		events.setEvent_no(drvEventReview.getEvent_no());
		events.setEvent_status("已处理");
		baseDaoSupport.update("com.nasoft.aboutcar.Events.updateStatus", events);
		//驾驶员年度考核表
		Map map = new HashMap();
		map.put("drvLicense", drvEventReview.getDrv_license());
		map.put("nowDate", DateUtil.format(new Date()));
		CxkhDrvAnnualWork drvAnnualWork = (CxkhDrvAnnualWork) baseDaoSupport.findForObject("com.nasoft.aboutcar.CxkhDrvAnnualWork.selectDrvByDate", map);
		if(null != drvAnnualWork){
			drvAnnualWork.setScore(drvAnnualWork.getScore()+Integer.valueOf(score));
			drvAnnualWork.setUpdateTime(new Date());
			baseDaoSupport.update("com.nasoft.aboutcar.CxkhDrvAnnualWork.updateDrvScore", drvAnnualWork);
		}else{
			drvAnnualWork = new CxkhDrvAnnualWork();
			drvAnnualWork.setDrvLicense(drvEventReview.getDrv_license());
			drvAnnualWork.setScore(Integer.valueOf(score));
			drvAnnualWork.setCreateTime(new Date());
			drvAnnualWork.setStartDate(DateUtil.getDate());
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			drvAnnualWork.setYear(String.valueOf(cal.get(Calendar.YEAR)));
			cal.add(Calendar.YEAR,1);
			drvAnnualWork.setEndDate(cal.getTime());
			baseDaoSupport.save("com.nasoft.aboutcar.CxkhDrvAnnualWork.addDrvAnnualWork", drvAnnualWork);
		}
	}
	

	@Override
	@Transactional(rollbackFor=Exception.class)
	public void drvEventReview(List<DrvEventReview> drvEventReviews,List<DrvScoreRecord> scoreRecordList,
			List<ComEventReview> comEventReviews,
			List<ComScoreRecord> comScoreRecordList) throws Exception {
		
		for(DrvEventReview drvEventReview : drvEventReviews){
			//驾驶员失信事件审核表
			addDrvEventReview("com.nasoft.aboutcar.DrvEventReview.addDrvEventReview", drvEventReview);
			
			//修改失信事件状态
			Events events = new Events();
			events.setEvent_no(drvEventReview.getEvent_no());
			events.setEvent_status("已处理");
			baseDaoSupport.update("com.nasoft.aboutcar.Events.updateStatus", events);
			//驾驶员年度考核表
			CxkhDrvAnnualWork cdaw=new CxkhDrvAnnualWork();
			cdaw.setIsCurr("1");
			cdaw.setDrvLicense(drvEventReview.getDrv_license());
			CxkhDrvAnnualWork drvAnnualWork = findForObject2("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.selectList", cdaw);
			if(null != drvAnnualWork){
				drvAnnualWork.setScore(drvAnnualWork.getScore()+drvEventReview.getScore());
				drvAnnualWork.setUpdateTime(new Date());
				baseDaoSupport.update("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.updateDrvScore", drvAnnualWork);
			}else{
				cdaw=new CxkhDrvAnnualWork();
				cdaw.setDrvLicense(drvEventReview.getDrv_license());
				List<CxkhDrvAnnualWork> drvAnnualWorks = findForList2("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.selectList", cdaw);
				String year="";

				if(drvAnnualWorks.size()>0){
					year=drvAnnualWorks.get(0).getYear();
					DateTime dt=new DateTime(year+"-01-01");
					year=dt.add(1, DateTime.YEAR).format("yyyy");
				}else{
					year=new DateTime().format("yyyy");
				}
					
				drvAnnualWork = new CxkhDrvAnnualWork();
				drvAnnualWork.setDrvLicense(drvEventReview.getDrv_license());
				drvAnnualWork.setScore(drvEventReview.getScore());
				drvAnnualWork.setCreateTime(new Date());
				drvAnnualWork.setYear(year);
				DateTime dt=new DateTime();
				drvAnnualWork.setStartDate(dt.turnIntoDate());
				drvAnnualWork.setEndDate(dt.add(1, DateTime.YEAR).delOneDay().turnIntoDate());
				drvAnnualWork.setIsCurr("1");
				baseDaoSupport.save("com.nasoft.aboutcar.CxkhDrvAnnualWorkMapper.insertIfNotnull", drvAnnualWork);
			}
		}
		
		//驾驶员失信记分表
		for(DrvScoreRecord drvScoreRecord : scoreRecordList){
			baseDaoSupport.save("com.nasoft.aboutcar.DrvScoreRecord.addDrvScoreRecord", drvScoreRecord);
		}
		
		//平台失信事件审核表
		for(ComEventReview comEventReview : comEventReviews){
				baseDaoSupport.save("com.nasoft.aboutcar.ComEventReview.addComEventReview", comEventReview);	
				
				//修改失信事件状态
				Events events = new Events();
				events.setEvent_no(comEventReview.getEvent_no());
				events.setEvent_status("已处理");
				baseDaoSupport.update("com.nasoft.aboutcar.Events.updateStatus", events);
				//平台年度考核表
				ComAnnualWork caw=new ComAnnualWork();
				caw.setIs_curr("1");
				caw.setCom_license(comEventReview.getCom_license());
				ComAnnualWork comAnnualWork = findForObject2("com.nasoft.aboutcar.ComAnnualWork.selectComByDate2", caw);
				if(null != comAnnualWork){
					comAnnualWork.setScore(comAnnualWork.getScore()+comEventReview.getScore());
					comAnnualWork.setUpdate_time(new Date());
					baseDaoSupport.update("com.nasoft.aboutcar.ComAnnualWork.updateComScore", comAnnualWork);
				}else{
					caw=new ComAnnualWork();
					caw.setCom_license(comEventReview.getCom_license());
					List<ComAnnualWork> comAnnualWorks = findForList2("com.nasoft.aboutcar.ComAnnualWork.selectComAnnualWork", caw);
					String year="";

					if(comAnnualWorks.size()>0){
						year=comAnnualWorks.get(0).getYear();
						DateTime dt=new DateTime(year+"-01-01");
						year=dt.add(1, DateTime.YEAR).format("yyyy");
					}else{
						year=new DateTime().format("yyyy");
					}						
					
					comAnnualWork = new ComAnnualWork();
					comAnnualWork.setCom_license(comEventReview.getCom_license());
					comAnnualWork.setScore(comEventReview.getScore());
					comAnnualWork.setCreate_time(new Date());
					comAnnualWork.setYear(year);
					DateTime dt=new DateTime();					
					comAnnualWork.setStart_date(dt.turnIntoDate());
					comAnnualWork.setEnd_date(dt.add(1, DateTime.YEAR).delOneDay().turnIntoDate());
					comAnnualWork.setIs_curr("1");
					baseDaoSupport.save("com.nasoft.aboutcar.ComAnnualWork.addComAnnualWork", comAnnualWork);
				}
		}

		for(ComScoreRecord comScoreRecord : comScoreRecordList){
			baseDaoSupport.save("com.nasoft.aboutcar.ComScoreRecord.addComScoreRecord", comScoreRecord);
		}
	}

	
}
