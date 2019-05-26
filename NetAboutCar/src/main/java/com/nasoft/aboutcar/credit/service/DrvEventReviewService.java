package com.nasoft.aboutcar.credit.service;

import java.util.List;

import com.nasoft.aboutcar.base.service.BaseService;
import com.nasoft.aboutcar.credit.domain.ComEventReview;
import com.nasoft.aboutcar.credit.domain.ComScoreRecord;
import com.nasoft.aboutcar.credit.domain.DrvEventReview;
import com.nasoft.aboutcar.credit.domain.DrvScoreRecord;

public interface DrvEventReviewService extends BaseService {

	public void addDrvEventReview(String sqlId,DrvEventReview drvEventReview) throws Exception;

	public void drvEventReview(DrvEventReview drvEventReview, List<DrvScoreRecord> scoreRecordList,String scoreSum) throws Exception;

	public DrvEventReview findByEventNo(String sqlId, String event_no) throws Exception;
	
	public void drvEventReview(List<DrvEventReview> drvEventReviews,
			List<DrvScoreRecord> scoreRecordList,
			List<ComEventReview> comEventReviews,
			List<ComScoreRecord> comScoreRecordList) throws Exception;

}
