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
import com.nasoft.aboutcar.credit.domain.ComAnnualWork;
import com.nasoft.aboutcar.credit.domain.ComEventReview;
import com.nasoft.aboutcar.credit.domain.ComScoreRecord;
import com.nasoft.aboutcar.credit.domain.CxkhDrvAnnualWork;
import com.nasoft.aboutcar.credit.domain.Events;
import com.nasoft.aboutcar.credit.service.ComEventReviewService;
import com.nasoft.util.DateUtil;

@Service("ComEventReviewService")
public class ComEventReviewServiceImpl implements ComEventReviewService {
	
	@Resource
	private BaseDao baseDaoSupport;

	@Override
	public void addComEventReview(String sqlId, ComEventReview comEventReview)throws Exception {
		baseDaoSupport.save(sqlId, comEventReview);	
	}
	
	@Override
	public ComEventReview findByEventNo(String sqlId,String event_no) throws Exception {
		return (ComEventReview) baseDaoSupport.findForObject(sqlId, event_no);
	}
	
	@Override
	@Transactional(rollbackFor=Exception.class)
	public void comEventReview(ComEventReview comEventReview,List<ComScoreRecord> scoreRecordList,String score) throws Exception {
		//平台失信事件审核表
		addComEventReview("com.nasoft.aboutcar.ComEventReview.addComEventReview", comEventReview);
		//平台失信记分表
		if(scoreRecordList.size() > 0){
			for(ComScoreRecord comScoreRecord : scoreRecordList){
				comScoreRecord.setReview_no(comEventReview.getReview_no());
				baseDaoSupport.save("com.nasoft.aboutcar.ComScoreRecord.addComScoreRecord", comScoreRecord);
			}
		}
		//修改失信事件状态
		Events events = new Events();
		events.setEvent_no(comEventReview.getEvent_no());
		events.setEvent_status("已处理");
		baseDaoSupport.update("com.nasoft.aboutcar.Events.updateStatus", events);
		//平台年度考核表
		Map map = new HashMap();
		map.put("comLicense", comEventReview.getCom_license());
		map.put("nowDate", DateUtil.format(new Date()));
		ComAnnualWork comAnnualWork = (ComAnnualWork) baseDaoSupport.findForObject("com.nasoft.aboutcar.ComAnnualWork.selectComByDate", map);
		if(null != comAnnualWork){
			comAnnualWork.setScore(comAnnualWork.getScore()+Integer.valueOf(score));
			comAnnualWork.setUpdate_time(new Date());
			baseDaoSupport.update("com.nasoft.aboutcar.ComAnnualWork.updateComScore", comAnnualWork);
		}else{
			comAnnualWork = new ComAnnualWork();
			comAnnualWork.setCom_license(comEventReview.getCom_license());
			comAnnualWork.setScore(Integer.valueOf(score));
			comAnnualWork.setCreate_time(new Date());
			comAnnualWork.setStart_date(DateUtil.getDate());
			Calendar cal = Calendar.getInstance();
			cal.setTime(new Date());
			comAnnualWork.setYear(String.valueOf(cal.get(Calendar.YEAR)));
			cal.add(Calendar.YEAR,1);
			comAnnualWork.setEnd_date(cal.getTime());
			baseDaoSupport.save("com.nasoft.aboutcar.ComAnnualWork.addComAnnualWork", comAnnualWork);
		}
	}
	
}
