package com.nasoft.aboutcar.common.task;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.nasoft.aboutcar.base.dao.BaseDao;
import com.nasoft.aboutcar.credit.service.CreditService;
import com.nasoft.aboutcar.supervise.service.CtlCarPositionInfoService;

@Component("QueryDataTask")
public class QueryDataTask {

	@Resource
	private BaseDao baseDaoSupport;
	@Resource
	private CtlCarPositionInfoService ctlCarPositionInfoService;
	@Resource
	private CreditService creditService;
	
	/**
	 * 固定每30秒执行
	 */
	@Scheduled(cron = "*/30 * * * * ?")
	public void doJob1(){
		/*try {
//			baseDaoSupport.findForList("com.nasoft.aboutcar.MngUserInfoMapper.execProce", "1");
			
			CtlCarPositionInfo ctlCarPositionInfo = new CtlCarPositionInfo();
			ctlCarPositionInfo.setCreate_time(DateUtil.dateToString(new Date(), "yyyy-MM-dd hh:mm:ss"));
			ctlCarPositionInfo.setCompany_id("420607198612070010");
	        Random random = new Random();
	        Integer s = random.nextInt(4000)%(4000-3000+1) + 3000;
	        Integer e = random.nextInt(9000)%(9000-8000+1) + 8000;
			ctlCarPositionInfo.setVehicle_no("京AH"+s.toString());
			ctlCarPositionInfo.setVehicle_region_code(410183);
			ctlCarPositionInfo.setLongitude(new BigDecimal("116."+s.toString()));
			ctlCarPositionInfo.setLatitude(new BigDecimal("39."+e.toString()));
			ctlCarPositionInfo.setWarnStatus(0);
			ctlCarPositionInfo.setOrder_id(s.toString());
			ctlCarPositionInfoService.addCarPosition("com.nasoft.aboutcar.CtlCarPositionInfoMapper.addCarPosition", ctlCarPositionInfo);
		} catch (Exception e) {
			e.printStackTrace();
		}*/
		System.out.println("正在执行定时任务。。。。。   当前时间为：" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ").format(new Date()));
	}
	
	/**
	 * 固定每1秒执行
	 */
//	@Scheduled(cron = "*/1 * * * * ?")
//	public void doJob2(){
//		try {
//			baseDaoSupport.findForList("com.nasoft.aboutcar.CtlCarPositionInfoMapper.execGetCarPro", null);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("正在执行定时任务。。。。。   当前时间为：" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ").format(new Date()));
//	}
//	
//	/**
//	 * 固定每10秒执行
//	 */
//	@Scheduled(cron = "*/10 * * * * ?")
//	public void deleteJob(){
//		try {
//			//如果yyjg_car_position_info是空，则清空yyjg_car_position_info_h、yyjg_car_position_info_temp2
//			List positionInfoList = (List) baseDaoSupport.findForList("com.nasoft.aboutcar.CtlCarPositionInfoMapper.getPositionInfoList", null);
//			if(positionInfoList.size() == 0){
//				List positionInfoHList = (List) baseDaoSupport.findForList("com.nasoft.aboutcar.CtlCarPositionInfoMapper.getPositionInfoHList", null);
//				List positionInfoTemp2List = (List) baseDaoSupport.findForList("com.nasoft.aboutcar.CtlCarPositionInfoMapper.getPositionInfoTemp2List", null);
//				baseDaoSupport.delete("com.nasoft.aboutcar.CtlCarPositionInfoMapper.deletePositionInfoH", positionInfoHList);
//				baseDaoSupport.delete("com.nasoft.aboutcar.CtlCarPositionInfoMapper.deletePositionInfoTemp2", positionInfoTemp2List);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		System.out.println("正在执行定时任务(清空表数据)。。。。。   当前时间为：" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ").format(new Date()));
//	}
	
	/**
	 * 固定每天凌晨01点执行
	 */
	@Scheduled(cron = "0 0 1 * * ?")
	public void doUnoperatingDriverJob() {
		try {
			baseDaoSupport.findForList("com.nasoft.aboutcar.MngUnoperatingDriverMapper.execUnoperatingDriverPro", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("正在执行定时任务（长时间未营运驾驶员情况）。。。。。   当前时间为：" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ").format(new Date()));
	}
	
	/**
	 * 固定每天凌晨02点执行
	 */
	@Scheduled(cron = "0 0 2 * * ?")
	public void doComViolationJob() {
		try {
			baseDaoSupport.findForList("com.nasoft.aboutcar.BnsCompanyViolationMapper.execComViolationPro", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("正在执行定时任务（经营者违规行为监测）。。。。。   当前时间为：" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ").format(new Date()));
	}
	
	/**
	 * 固定每天凌晨03点执行
	 */
	@Scheduled(cron = "0 0 3 * * ?")
	public void doComOperateCarJob() {
		try {
			baseDaoSupport.findForList("com.nasoft.aboutcar.BnsNotOperateCarMapper.execOperateCarPro", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("正在执行定时任务（长期未运营车辆监测）。。。。。   当前时间为：" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ").format(new Date()));
	}
	
	@Scheduled(cron = "30 * * * * ?")//支付表和设定表对比结果存入到检测表
	public void doJobSetViolationPriceMonitor(){
		try {
			baseDaoSupport.save("com.nasoft.aboutcar.MngAbnormityPriceSet.BnsViolationPriceMonitor", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("正在执行定时任务setViolationPriceMonitor   当前时间为：" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ").format(new Date()));
	}
	
	/**
	 * 每10分钟执行一次，将报警车辆插入报警车辆监测表
	 */
	@Scheduled(cron = "0 10 * * * ?")
	public void alarmCarMonitor(){
		try {
			baseDaoSupport.findForList("com.nasoft.aboutcar.CtlCarPositionInfoMapper.alarmCarMonitor", null);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("正在执行定时任务（报警车辆监测）。。。。。   当前时间为：" + new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ").format(new Date()));
	}
	

	/**
	 * 固定每天凌晨04点执行
	 */
	@Scheduled(cron = "0 0 4 * * ?")
	public void doBlRemoveAtExpired(){
		try{
			List<String> msgs=creditService.removeDrvBlByExpired();		
			msgs.addAll(creditService.removeCarBlByExpired());
			for(String msg:msgs){
				System.out.println(msg);
			}			
		}catch(Exception e){
			new Exception("定时黑名单移除操作失败",e).printStackTrace();
		}
	}
	
}
