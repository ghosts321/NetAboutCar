package com.nasoft.SSM.controller.infoquery;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.SSM.base.controller.BaseController;
import com.nasoft.SSM.domain.CarInfo;
import com.nasoft.SSM.domain.CarPermitcert;
import com.nasoft.SSM.domain.DrvPermitcert;
import com.nasoft.SSM.domain.DrvUserinfo;
import com.nasoft.SSM.domain.Platform;
import com.nasoft.SSM.domain.PlatformPermitcert;
import com.nasoft.SSM.service.CarPilotApplyService;
import com.nasoft.SSM.service.DrvPermitcertService;
import com.nasoft.SSM.service.DrvUserinfoService;
import com.nasoft.SSM.service.InstInfoService;
import com.nasoft.SSM.service.PlatformApplyService;

/**
 * 信息查询
 * @author user
 *
 */
@Controller
@RequestMapping("/infoquery")
public class InfoQueryController extends BaseController {
	
	private static Logger logger = Logger.getLogger(InfoQueryController.class);
	
	@Resource
	DrvPermitcertService drvPermitcertService;
	@Resource
	CarPilotApplyService carPilotApplyService;
	@Resource
	PlatformApplyService platformApplyService;
	@Resource
	DrvUserinfoService drvUserinfoService;
	@Resource 
	InstInfoService instInfoService;
	/**
	 * 信息查询首页
	 * @return
	 */
	@RequestMapping("/openInfoQuery")
	public String openInfoQuery(){
		logger.debug("firstpage");
		return "infoquery/infoQueryMain";
	} 
	
	@RequestMapping("searchDriver")
	public ModelAndView searchDriver(HttpServletRequest request){
		ModelAndView modelAndView =new ModelAndView();
		String  certno = request.getParameter("certno");
		if (certno!=null && certno.length()!=0  ){
			Map<String, String> map = new HashMap<String,String>();
			map.put("certno", certno);
			
			try {
				DrvPermitcert drvPermitcert =	(DrvPermitcert)drvPermitcertService.selectByCondition("com.nasoft.SSM.DrvPermitcert.selectByCondition", map);
				List<String> s  = instInfoService.findInstNameByInstid("com.nasoft.SSM.instInfo.findInstInfoByInstid", drvPermitcert.getInstid());
				
				DrvUserinfo drvuserinfo = (DrvUserinfo)drvUserinfoService.selectByCertno("com.nasoft.SSM.DrvUserinfo.selectByCertno", certno);
				String carType = null;
				if(drvuserinfo.getCardrivingtype().equals("0")){
					carType="小型车";
				}else if (drvuserinfo.getCardrivingtype().equals("1")){
					carType="中型车";
				}else if (drvuserinfo.getCardrivingtype().equals("1")){
					carType="大型车";
				}
				if(drvPermitcert!=null && drvPermitcert.getStatus()!="2"||drvPermitcert.getStatus()!="3"){
					if(!s.isEmpty()){
						modelAndView.addObject("instname",s.get(0));
					}
					modelAndView.addObject("drvuserinfo",drvuserinfo);
					modelAndView.addObject("carType",carType);
					modelAndView.addObject("drvPermitcert",drvPermitcert);
					modelAndView.setViewName("infoquery/queryDrv");
				}
			} catch (Exception e) {
				e.printStackTrace();
				modelAndView.setViewName("infoquery/none");

			}
			
		}else{ 
			modelAndView.setViewName("infoquery/none");
		}
		return modelAndView;
	}
	
	
	@RequestMapping("searchCar")
	public ModelAndView searchCar(HttpServletRequest request){
		ModelAndView modelAndView =new ModelAndView();
		String  carnum = request.getParameter("carnum");
		try {
			carnum = new String(carnum.getBytes("iso-8859-1"),"UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		if (carnum!=null && carnum.length()!=0){
			Map<String, String> map = new HashMap<String,String>();
			map.put("carnum", carnum);
			//map.put("enginenum", enginenum);
			
			try {
				CarPermitcert drvPermitcert =	(CarPermitcert)carPilotApplyService.selectByCondition("com.nasoft.aboutcar.carMapper.selectByCondition", map);
				List<String> s  = instInfoService.findInstNameByInstid("com.nasoft.SSM.instInfo.findInstInfoByInstid", drvPermitcert.getInstId());
				CarInfo carinfo =	carPilotApplyService.findCarInfoByCertNo("com.nasoft.aboutcar.carMapper.findCarByCertNo", drvPermitcert.getCertNo());
				if(drvPermitcert!=null && Integer.toString(drvPermitcert.getStatus())  !="2"||Integer.toString(drvPermitcert.getStatus())  !="3"){
					modelAndView.addObject("drvPermitcert",drvPermitcert);
					modelAndView.addObject("carinfo",carinfo);
					if(!s.isEmpty()){
						modelAndView.addObject("instname",s.get(0));
					}

					modelAndView.setViewName("infoquery/queryCar");
				}
			} catch (Exception e) {
				modelAndView.setViewName("infoquery/none");
				e.printStackTrace();
			}
			
		}else{
			modelAndView.setViewName("infoquery/none");
		}
		return modelAndView;
	}
	
	
	@RequestMapping("searchPlatform")
	public ModelAndView searchPlatform(HttpServletRequest request){
		ModelAndView modelAndView =new ModelAndView();
		String  creditcode = request.getParameter("creditcode");
		if (creditcode!=null && creditcode.length()!=0 ){
			Map<String, String> map = new HashMap<String,String>();
			map.put("creditcode", creditcode);
			try {
				PlatformPermitcert drvPermitcert =	(PlatformPermitcert)platformApplyService.selectByCondition("com.nasoft.aboutcar.PlatformMapper.selectByCondition", map);
				List<String> s  = instInfoService.findInstNameByInstid("com.nasoft.SSM.instInfo.findInstInfoByInstid", drvPermitcert.getInstid());
				Platform platform  = (Platform)platformApplyService.findPlatformByCreditCode("com.nasoft.aboutcar.PlatformMapper.findPlatformByCreditCode", creditcode);
				if(drvPermitcert!=null && drvPermitcert.getStatus()!="2"||drvPermitcert.getStatus()!="3"){
					modelAndView.addObject("drvPermitcert",drvPermitcert);
					if(!s.isEmpty()){
						modelAndView.addObject("instname",s.get(0));
					}
					modelAndView.addObject("platform",platform);

					modelAndView.setViewName("infoquery/queryPer");
				}
			} catch (Exception e) {
				modelAndView.setViewName("infoquery/none");
				e.printStackTrace();
			}
			
		}else{
			modelAndView.setViewName("infoquery/none");
		}
		return modelAndView;
	}
}
