package com.nasoft.aboutcar.yyjgOutinAreaSet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.yyjgOutinAreaSet.domain.OutinAreaSet;
import com.nasoft.aboutcar.yyjgOutinAreaSet.service.OutinAreaSetService;

@Controller
@RequestMapping("/outinArea")
public class OutinAreaSetController extends BaseController {
	@Autowired
	private OutinAreaSetService outinAreaSetService;
	
	/**
	 * 违规车辆，回显禁止区域
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("/findOutinAreaList")
	public List<OutinAreaSet> findOutinAreaList(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("isUse", request.getParameter("isUse"));
		List<OutinAreaSet> outinAreaSetList = new ArrayList<OutinAreaSet>();
		
		try {
			outinAreaSetList = outinAreaSetService.findAllOutinArea("com.nasoft.aboutcar.OutinAreaSetMapper.getOutinAreaSetList", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return outinAreaSetList;
	}
}
