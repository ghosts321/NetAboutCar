package com.nasoft.aboutcar.credit.service;

import com.nasoft.aboutcar.credit.domain.ComAppeals;


public interface ComAppealsService {

	public ComAppeals findByAppealNo(String sqlId, String appeal_no) throws Exception;

	public void updateComAppeals(String sqlId, ComAppeals comAppeals) throws Exception;

}
