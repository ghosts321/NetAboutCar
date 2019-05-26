package com.nasoft.aboutcar.totalMap.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.totalMap.domain.vo.CountAuditCarVo;
import com.nasoft.aboutcar.totalMap.domain.vo.CountOnlineCarVo;
import com.nasoft.aboutcar.totalMap.domain.vo.CountPeopleVo;
import com.nasoft.aboutcar.totalMap.service.CarCountService;

@Controller
@RequestMapping("/totalMap")
public class TotalMapController extends BaseController {
	@Resource
	private CarCountService carCountService;
	
	/**
	 * 新增-打开地图页面
	 * @return
	 */
	@RequestMapping("/openMap")
	public String openMap(HttpServletRequest request){
		return "totalMap/totalMap";
	}
	
	/**
	 * total地图中，网约车统计：页面打开
	 * 
	 */
	@RequestMapping("openCount")
	public String openCount(HttpServletRequest request, String tabType){
		request.getSession().setAttribute("tabType", tabType);
		return "totalMap/interCarCount/interCarCount";
	}
	
	/**
	 * total地图中，网约车统计：统计每个平台有多少申请通过的车辆，以及多少在线车辆
	 * 
	 */
	@ResponseBody
	@RequestMapping("countAuditCar")
	public List<CountAuditCarVo> countAuditCar(HttpServletRequest request){
		List<CountAuditCarVo> countAuditCarList = null;
		
		try {
			//获取申请通过车辆统计list
			countAuditCarList = carCountService.getCountAuditCarList("com.nasoft.aboutcar.CarCountMapper.countAuditCar");
			//获取在线车辆统计list
			List<CountOnlineCarVo> countOnlineCarList = carCountService.getCountOnlineCarList("com.nasoft.aboutcar.CarCountMapper.countOnlineCar");
			
			//封装车辆统计list
			for(CountAuditCarVo countAuditCar : countAuditCarList){
				for(CountOnlineCarVo countOnlineCar : countOnlineCarList){
					if(countOnlineCar.getCompanyId().equals(countAuditCar.getCreditcode())){
						countAuditCar.setOnlineCount(countOnlineCar.getOnlineCount());
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countAuditCarList;
	}
	
	/**
	 * total地图中，网约车统计：统计每个平台有多少审批通过的驾驶员
	 * 
	 */
	@ResponseBody
	@RequestMapping("countPeople")
	public List<CountPeopleVo> countPeople(HttpServletRequest request){
		List<CountPeopleVo> countPeopleList = null;
		try {
			//获取审批通过驾驶员统计list
			countPeopleList = carCountService.getCountPeople("com.nasoft.aboutcar.CarCountMapper.countPeople");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countPeopleList;
	}
}
