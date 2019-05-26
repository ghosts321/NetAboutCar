package com.nasoft.aboutcar.credit.service;

import java.util.List;

import com.nasoft.aboutcar.credit.domain.ComScoreRecord;


public interface ComScoreRecordService {

	public void addComScoreRecord(String sqlId,ComScoreRecord comScoreRecord) throws Exception;

	public List<ComScoreRecord> selectByEventNo(String sqlId, String event_no) throws Exception;

}
