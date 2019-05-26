package com.nasoft.aboutcar.vehicle.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.vehicle.domain.Vehicle;
import com.nasoft.aboutcar.vehicle.service.VehicleService;

@Controller
@RequestMapping("/vehicle")
public class VehicleController extends BaseController {

	@Resource
	private VehicleService vehicleService;
	
	//业务审核
	@RequestMapping("index")
	public String index(HttpServletRequest request,Model model){
		return "vehicle/index";
	}
	//证书管理
	@RequestMapping("certificate")
	public String certificate(HttpServletRequest request,Model model){
		return "vehicle/certificate";
	}
	@RequestMapping("vehicleList")
	public void getvehicleList(HttpServletRequest request,HttpServletResponse response){
		List<Vehicle> vehicleList = vehicleService.findAllVehicle("com.nasoft.aboutcar.VehicleMapper.searchAll", null);
		JSONArray array = JSONArray.fromObject(vehicleList);
		System.out.println(array);
		writer(response, array+"");
	}
	
	@RequestMapping("getVehicle")
	public String getvehicleById(Vehicle vehicle,HttpServletRequest request,HttpServletResponse response){
		Vehicle vehicle_ = vehicleService.searchById("com.nasoft.aboutcar.VehicleMapper.searchById", vehicle);
		request.setAttribute("vehicle_", vehicle_);
		return "vehicle/detail";
	}
	//车辆资质验证列表
	@RequestMapping("validate")
	public String validateList(){
		return "vehicle/validate";
	}
	//车辆申请信息验证
	@RequestMapping("applyValidate")
	public String applyValidateList(){
		return "vehicle/applyValidate";
	}
}
