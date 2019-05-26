package com.nasoft.aboutcar.survey.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.aboutcar.base.controller.BaseController;

@Controller
@RequestMapping("/survey")
public class SurveyController extends BaseController{
	
	@RequestMapping("kcjgImport")
	public String index(){
		return "survey/index";
	}
	

}
