package com.nasoft.aboutcar.bnsAbnPriceAnal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.bnsAbnPriceAnal.service.BnsAbnPriceAnalService;
import com.nasoft.aboutcar.bnsAbnPriceAnal.vo.BnsAbnPriceAnalVo;

@Controller
@RequestMapping("/bnsAbnPriceAnal")
public class BnsAbnPriceAnalController extends BaseController {
	@Autowired
	private BnsAbnPriceAnalService bnsAbnPriceAnalService;
	
	/**
	 * 打开列表页面
	 * @return
	 */
	@RequestMapping("/bnsAbnPriceAnalList")
	public String bnsAbnPriceAnalList(){
		return "bnsAbnPriceAnal/bnsAbnPriceAnalList";
	}
	
	/**
	 * 获取异常运价分析数据列表
	 * @param request
	 * @param response
	 */
	@RequestMapping("/getBnsAbnPriceAnalList")
	public void getBnsAbnPriceAnalList(HttpServletRequest request,HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String comname = request.getParameter("comname");
		String onArea = request.getParameter("onArea");
		String beginTime = request.getParameter("beginTime");
		String endTime = request.getParameter("endTime");
		map.put("comname", comname); 
		map.put("onArea", onArea); 
		map.put("beginTime", beginTime);
		map.put("endTime", endTime);
		List<BnsAbnPriceAnalVo> bnsAbnPriceAnalList = new ArrayList<BnsAbnPriceAnalVo>();
		try {
			bnsAbnPriceAnalList = bnsAbnPriceAnalService.findAllBnsAbnPriceAnalList("com.nasoft.aboutcar.bnsAbnPriceAnal.findAllBnsAbnPriceAnal",map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(bnsAbnPriceAnalList.toArray());
		writer(response, array.toString());
	}
}
