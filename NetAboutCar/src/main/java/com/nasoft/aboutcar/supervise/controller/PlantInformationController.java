package com.nasoft.aboutcar.supervise.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.supervise.service.PlantInformationService;


@Controller
@RequestMapping("/PlantInformationController")
public class PlantInformationController extends BaseController{
		
	
	@Resource
	private PlantInformationService plantInformationService;
	
	/**
	 * 平台综合信息查询
	 * @return
	 */
	@RequestMapping("/plantindex")
	public String plantIndex(){
		return "supervise/plantIndex";
	}
			
	
	/**
	 *
	打开案件列表
	@return
	*
	**/
	@RequestMapping("/plantInformationlist")
	public void plantInformationlist(HttpServletRequest request, HttpServletResponse response){
		Map<String, Object> map = new HashMap<String, Object>();
		String platformname = request.getParameter("platformname");
		String creditcode = request.getParameter("creditcode");
		
		map.put("platformname", platformname);
		map.put("creditcode", creditcode);
		
		List<Map> PlantInformationList = new ArrayList<Map>();
		try {
			PlantInformationList = (List<Map>)plantInformationService.findAllPlantInformation("com.nasoft.aboutcar.PlantInformationMapper.findAllPlantInformationInfo",map);
			


		} catch (Exception e) {
			e.printStackTrace();
		}
		JSONArray array = JSONArray.fromObject(PlantInformationList.toArray());
		writer(response, array+"");
	}
}
