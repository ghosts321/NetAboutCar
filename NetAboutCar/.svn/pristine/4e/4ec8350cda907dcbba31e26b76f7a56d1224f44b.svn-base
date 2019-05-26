package com.nasoft.aboutcar.report.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mysql.jdbc.StringUtils;
import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.mngareainfo.domain.MngAreaInfo;
import com.nasoft.aboutcar.report.domain.JcfxData;
import com.nasoft.aboutcar.report.domain.JcfxDataCatalog;
import com.nasoft.aboutcar.report.domain.JcfxDataDeminsion;
import com.nasoft.aboutcar.report.domain.JcfxTask;
import com.nasoft.aboutcar.report.service.PolicyAnalysisService;
import com.nasoft.aboutcar.supervise.domain.BnsOperationPay;
import com.nasoft.util.DateTime;

/**
 * 决策分析
 */
@Controller
@RequestMapping("/jcfx")
public class PolicyAnalysisController extends BaseController {

	@Resource private PolicyAnalysisService policyAnalysisService;
	
	@Autowired private Properties globalProperties;
	
	

	/**
	 * 营运里程
	 * @return
	 */
	@RequestMapping("cksj")
	public String toQueryData(HttpServletRequest request,HttpServletResponse response,JcfxDataCatalog entity){
		
		request.setAttribute("jdc", entity);
		return "policyAnalysis/queryData";
	}

	/**
	 * 营运里程
	 * @return
	 */
	@RequestMapping("yylctj")
	public void serviceMile(HttpServletRequest request,HttpServletResponse response){
		
		writer(response,"success");
	}
	
	/**
	 * 综合分析
	 * @return
	 */
	@RequestMapping("/zhfx")
	public String policyAnalysis(HttpServletRequest request ,HttpServletResponse response,String date,String cityCode){
		if(StringUtils.isNullOrEmpty(date)){
			date=String.valueOf( new DateTime().getTextDate());
		}
		request.setAttribute("date", date);
		request.setAttribute("cityCode",cityCode);
		return "policyAnalysis/zhfx";
	}
	
	/**
	 * 数据目录
	 * @return
	 */
	@RequestMapping("/sjml")
	public String dataCatalog(){
				
		return "policyAnalysis/listDataCatalog";
	}
	

	@RequestMapping("/rw")
	public String listTask(){
				
		return "policyAnalysis/listTask";
	}
	
	@RequestMapping("/tjsjzl")
	public String toAddCatalog(){
		return "policyAnalysis/addCatalog";
	}
	

	@RequestMapping("/tjwddy")
	public String toAddDeminsion(HttpServletRequest request ,HttpServletResponse response, JcfxDataCatalog entity){
		request.setAttribute("jdc", entity);
		return "policyAnalysis/addDeminsion";
	}
	
	@RequestMapping("/xgwddy")
	public String toEditDeminsion(HttpServletRequest request ,HttpServletResponse response, JcfxDataDeminsion entity){
		request.setAttribute("jdd", entity);
		return "policyAnalysis/editDeminsion";
	}


	@RequestMapping("/xgsjzl")
	public String toEditCatalog(HttpServletRequest request ,HttpServletResponse response, JcfxDataCatalog entity){
		request.setAttribute("entity", entity);
		return "policyAnalysis/editCatalog";
	}

	@RequestMapping("/wddy")
	public String toListDeminsion(HttpServletRequest request ,HttpServletResponse response, JcfxDataCatalog entity){
		request.setAttribute("entity", entity);
		return "policyAnalysis/listDeminsion";
	}

	@RequestMapping("/bcwddy")
	public String addDeminsion(HttpServletRequest request ,HttpServletResponse response, JcfxDataDeminsion entity) throws Exception{
		
		entity.setCreateTime(new Date());
		policyAnalysisService.insert2("com.nasoft.aboutcar.JcfxDataDeminsionMapper.insertIfNotnull", entity);
		
		return "redirect:wddy.action?dataCode="+entity.getDataCode();
	}
	

	@RequestMapping("/bcsjzl")
	public void addDataCatalog(HttpServletRequest request ,HttpServletResponse response, JcfxDataCatalog entity) throws Exception{
		
		entity.setCreateTime(new Date());
		policyAnalysisService.insert2("com.nasoft.aboutcar.JcfxDataCatalogMapper.insertIfNotnull", entity);

		writer(response,"success");
	}
	

	@RequestMapping("/gxsjzl")
	public void updateDataCatalog(HttpServletRequest request ,HttpServletResponse response, JcfxDataCatalog entity) throws Exception{
		
		JcfxDataCatalog _entity=new JcfxDataCatalog();
		_entity.setDataCode(entity.getDataCode());
		_entity=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataCatalogMapper.selectList", _entity);
		if(_entity!=null){
			entity.setUpdateTime(new Date());
			policyAnalysisService.update2("com.nasoft.aboutcar.JcfxDataCatalogMapper.updateIfNotnull", entity);			
		}

		writer(response,"success");
	}

	@RequestMapping("/scsjzl")
	public void deleteDataCatalog(HttpServletRequest request ,HttpServletResponse response, JcfxDataCatalog entity) throws Exception{
		
		JcfxDataCatalog _entity=new JcfxDataCatalog();
		_entity.setDataCode(entity.getDataCode());
		_entity=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataCatalogMapper.selectList", _entity);
		if(_entity!=null){
			policyAnalysisService.delete2("com.nasoft.aboutcar.JcfxDataCatalogMapper.deleteById", entity);			
		}else{
			writer(response,"没有找到记录");			
		}
		writer(response,"success");

	}
	
	

	@RequestMapping("/findAllDeminsion")
	public void findAllDeminsion(HttpServletRequest request ,HttpServletResponse response, JcfxDataDeminsion entity) throws Exception{
		List<JcfxDataDeminsion> list=policyAnalysisService.findForList2("com.nasoft.aboutcar.JcfxDataDeminsionMapper.selectList", entity);
		writer(response,list);
	}

	@RequestMapping("/findDataDeminsion")
	public void findDataDeminsion(HttpServletRequest request ,HttpServletResponse response, JcfxDataDeminsion entity) throws Exception{
		JcfxDataDeminsion jdd=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataDeminsionMapper.selectList", entity);
		writer(response,jdd);
	}
	

	@RequestMapping("/scwddy")
	public void deleteDataDeminsion(HttpServletRequest request ,HttpServletResponse response, JcfxDataDeminsion entity) throws Exception{
		
		JcfxDataDeminsion _entity=new JcfxDataDeminsion();
		_entity.setId(entity.getId());
		_entity=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataDeminsionMapper.selectList", _entity);
		if(_entity!=null){
			policyAnalysisService.delete2("com.nasoft.aboutcar.JcfxDataDeminsionMapper.deleteById", _entity);			
		}else{
			writer(response,"没有找到记录");			
		}
		writer(response,"success");

	}
	

	@RequestMapping("/gxwddy")
	public String updateDataDeminsion(HttpServletRequest request ,HttpServletResponse response, JcfxDataDeminsion entity) throws Exception{

		JcfxDataDeminsion _entity=new JcfxDataDeminsion();
		_entity.setDataCode(entity.getDataCode());
		_entity.setDimCode(entity.getDimCode());
		_entity=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataDeminsionMapper.selectList", _entity);
		if(_entity!=null){
			entity.setUpdateTime(new Date());
			entity.setId(_entity.getId());
			policyAnalysisService.update2("com.nasoft.aboutcar.JcfxDataDeminsionMapper.updateIfNotnull", entity);			
		}

		return "redirect:wddy.action?dataCode="+entity.getDataCode();
	}
	
	/**
	 * 数据目录读取
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/findAllDataCatalog")
	public void findAllDataCatalog(HttpServletRequest request ,HttpServletResponse response, JcfxDataCatalog entity) throws Exception{
		List<JcfxDataCatalog> list=policyAnalysisService.findForList2("com.nasoft.aboutcar.JcfxDataCatalogMapper.selectList", entity);
		writer(response,list);
	}
	

	@RequestMapping("/findDataCatalog")
	public void findDataCatalog(HttpServletRequest request ,HttpServletResponse response, JcfxDataCatalog entity) throws Exception{
		JcfxDataCatalog jdc=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataCatalogMapper.selectList", entity);
		writer(response,jdc);
	}


	@RequestMapping("/createTask")
	public void createTask(HttpServletRequest request ,HttpServletResponse response, JcfxTask entity) throws Exception{
		JcfxDataCatalog jdc=new JcfxDataCatalog();
		jdc.setDataCode(entity.getDataCode());
		jdc=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataCatalogMapper.selectList", jdc);
		if(jdc!=null){
			entity.setCreateTime(new Date());
			entity.setParams(jdc.getExecTime());
			policyAnalysisService.insert2("com.nasoft.aboutcar.JcfxTaskMapper.insertIfNotnull", entity);
			writer(response,"success");
		}else{
			writer(response,"没有找到数据种类定义");
		}
	}
	


	@RequestMapping("/findAllTask")
	public void findAllTask(HttpServletRequest request ,HttpServletResponse response, JcfxTask entity) throws Exception{
		List<JcfxTask> list=policyAnalysisService.findForList2("com.nasoft.aboutcar.JcfxTaskMapper.selectList", entity);
		writer(response,list);
	}
	
	@RequestMapping("/findAllArea")
	public void findAllArea(HttpServletRequest request ,HttpServletResponse response, MngAreaInfo entity) throws Exception{

		List<MngAreaInfo> areas=policyAnalysisService.findForList2("com.nasoft.aboutcar.MngAreaInfoMapper.findLikeCode", entity);
		
		writer(response,areas);
	}

	@RequestMapping("/delTask")
	public void deleteTask(HttpServletRequest request ,HttpServletResponse response, JcfxTask entity) throws Exception{
		policyAnalysisService.delete2("com.nasoft.aboutcar.JcfxTaskMapper.deleteById", entity);
		writer(response,"success");
	}

	@RequestMapping("/findAllCompany")
	public void findAllCompany(HttpServletRequest request ,HttpServletResponse response) throws Exception{
		List<Map> list=policyAnalysisService.findForList2("com.nasoft.aboutcar.JcfxTaskMapper.findCompany", new HashMap());
		writer(response,list);
	}
	
	@RequestMapping("/statistics")
	public void statistics(HttpServletRequest request ,HttpServletResponse response,String compareType,String statType,String deminsions,
			String values) throws Exception{
		System.out.println(request.getParameterValues("deminsions"));
		JSONArray ja=JSONArray.fromObject(deminsions);
		List<JcfxDataDeminsionModel> dems=new ArrayList<JcfxDataDeminsionModel>();
				
		JcfxDataDeminsionModel date=null,province=null,city=null,country=null;
		for(int i=0;i<ja.size();i++){
			JcfxDataDeminsionModel jdd=(JcfxDataDeminsionModel)JSONObject.toBean(JSONObject.fromObject(ja.get(i)),JcfxDataDeminsionModel.class);
			
			if(jdd.getDimCode().equals("DATE")){
				date=jdd;			
			}else{
				dems.add(jdd);
			}
		}
		

		

		JSONObject title=new JSONObject();
		
		List<JcfxDataModel> jdms=new ArrayList<JcfxDataModel>();
		
		DateTime sdt=new DateTime();
		
		String fields="";
		String groupby="";
		String where=" where data_code='"+dems.get(0).getDataCode()+"'";
		String orderby="";
		if(!StringUtils.isNullOrEmpty(compareType) && !StringUtils.isNullOrEmpty(statType)){
			
			if(compareType.equals("环比") && date!=null ){			
				if(statType.equals("年度")){
					JcfxDataModel jdm=new JcfxDataModel();
					sdt=new DateTime(date.getStartDate()+"-01-01");
					jdm.setStartDate(sdt.getTextDate());
					sdt=new DateTime(date.getEndDate()+"-12-31");
					jdm.setEndDate(sdt.getTextDate());
									
					fields+=" substr("+date.getDimFieldname()+",1,4) "+date.getDimFieldname();
					where+=" and "+date.getDimFieldname()+">='"+jdm.getStartDate()+"' and "+date.getDimFieldname()+"<='"+jdm.getEndDate()+"'";
					groupby+=" substr("+date.getDimFieldname()+",1,4)";
					orderby+=" substr("+date.getDimFieldname()+",1,4)";
					
					title.put(date.getDimFieldname(), statType);
				}else if(statType.equals("月度")){
					JcfxDataModel jdm=new JcfxDataModel();
					sdt=new DateTime(date.getStartDate()+"-01");
					jdm.setStartDate(sdt.getTextDate());
					sdt=new DateTime(date.getEndDate()+"-01").addOneMonth().delOneDay();
					jdm.setEndDate(sdt.getTextDate());

					fields+=" substr("+date.getDimFieldname()+",1,7) "+date.getDimFieldname();
					where+=" and "+date.getDimFieldname()+">='"+jdm.getStartDate()+"' and "+date.getDimFieldname()+"<='"+jdm.getEndDate()+"'";
					groupby+=" substr("+date.getDimFieldname()+",1,7)";
					orderby+=" substr("+date.getDimFieldname()+",1,7)";
					
					title.put(date.getDimFieldname(), statType);
				}else if(statType.equals("每天")){

					fields+=date.getDimFieldname();
					where+=" and "+date.getDimFieldname()+">='"+date.getStartDate()+"' and "+date.getDimFieldname()+"<='"+date.getEndDate()+"'";
					groupby+=date.getDimFieldname();
					orderby+=date.getDimFieldname();
					
					title.put(date.getDimFieldname(), statType);
				}
			}
		}		

		for(JcfxDataDeminsionModel j:dems){
			if(j.getSelect()!=null && !j.isDraw()){
				where+=" and "+j.getDimFieldname()+"='"+j.getSelect().getCode()+"'";
			}
			
			if(j.isDraw()){
				fields+=(fields.equals("")?" ":",")+j.getDimFieldname()+(StringUtils.isNullOrEmpty(j.getDimNamefield())?"":(","+j.getDimNamefield()));
				groupby+=(groupby.equals("")?" ":",")+j.getDimFieldname()+(StringUtils.isNullOrEmpty(j.getDimNamefield())?"":(","+j.getDimNamefield()));
				orderby+=(orderby.equals("")?" ":",")+j.getDimFieldname();
				title.put(j.getDimFieldname(), j.getDimName());
				title.put(j.getDimNamefield(), j.getDimName()+"名称");
			}
		}	
		
		List<JcfxDataDeminsionModel> vals=new ArrayList<JcfxDataDeminsionModel>();
		JSONArray jav=JSONArray.fromObject(values);
		for(Object jo:jav){
			JcfxDataDeminsionModel value=(JcfxDataDeminsionModel)JSONObject.toBean(JSONObject.fromObject(jo),JcfxDataDeminsionModel.class);
			vals.add(value);
			fields+=" ,sum("+value.getDimFieldname()+") "+value.getDimFieldname();
			title.put(value.getDimFieldname(), value.getDimName());
		}

		String sql="select "+fields+" from jcfx_data "+where+" group by "+groupby+" order by "+orderby;
		System.out.println(sql);
		Map<String,String> param=new HashMap<String,String>();
		param.put("sql", sql);
		
		List<Map> list=policyAnalysisService.findForList2("com.nasoft.aboutcar.JcfxTaskMapper.selectSql", param);
		Map _title=(HashMap) JSONObject.toBean(title,HashMap.class);
		list.add(0,_title);
		
		writer(response,list);
	}


	@RequestMapping("/statistics2")
	public void statistics2(HttpServletRequest request ,HttpServletResponse response,String contrastType,
			String periodType,String dimCode,String dataCode,
			String valueCodes) throws Exception{
		String fields="";
		String groupby="";
		String orderby="";
		String where=" where data_code='"+dataCode+"'";

//		System.out.println(request.getParameterValues("deminsions"));
		JcfxDataDeminsion _dem=new JcfxDataDeminsion();
		_dem.setDimCode(dimCode);
		_dem.setDataCode(dataCode);
		JcfxDataDeminsion deminsion=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataDeminsionMapper.selectList", _dem);
		fields+=deminsion.getDimFieldname()+(StringUtils.isNullOrEmpty(deminsion.getDimNamefield())?"":(","+deminsion.getDimNamefield()))+" "+dimCode;
		groupby+=deminsion.getDimFieldname()+(StringUtils.isNullOrEmpty(deminsion.getDimNamefield())?"":(","+deminsion.getDimNamefield()));
		//orderby+=deminsion.getDimFieldname()+(StringUtils.isNullOrEmpty(deminsion.getDimNamefield())?"":(","+deminsion.getDimNamefield()));
		
		//List<JcfxDataDeminsion> values=new ArrayList<JcfxDataDeminsion>();
		for(String valueCode:valueCodes.split(",")){
			if(!StringUtils.isNullOrEmpty(valueCode)){
				_dem=new JcfxDataDeminsion();
				_dem.setDataCode(dataCode);
				_dem.setDimCode(valueCode);
				_dem=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataDeminsionMapper.selectList", _dem);
				//values.add(_dem);
				fields+=" ,sum("+_dem.getDimFieldname()+") "+_dem.getDimCode();		
				orderby+=(orderby.equals("")?"":",")+"sum("+_dem.getDimFieldname()+") desc ";
			}
		}

		String sql="select "+fields+" from jcfx_data "+where+" group by "+groupby+" order by "+orderby;
		System.out.println(sql);
		Map<String,String> param=new HashMap<String,String>();
		param.put("sql", sql);
		
		List<Map> list=policyAnalysisService.findForList2("com.nasoft.aboutcar.JcfxTaskMapper.selectSql", param);
	
		writer(response,list);
	}

	
	@RequestMapping("/orderfortest/create")
	public void orderfortest(HttpServletRequest request ,HttpServletResponse response,int max,String price,
			String areaCode,String areaLevel,String startDate,String endDate) throws Exception{

		DateTime sdt=new DateTime();
		DateTime edt=new DateTime();

		if(StringUtils.isNullOrEmpty(areaCode))areaCode="410";
		if(StringUtils.isNullOrEmpty(areaLevel))areaLevel="3";
		if(!StringUtils.isNullOrEmpty(startDate))sdt=new DateTime(startDate);
		if(!StringUtils.isNullOrEmpty(endDate))edt=new DateTime(endDate);
		while(sdt.compare(edt)<0){
			createOrder(price,areaCode,areaLevel,sdt.turnIntoDate(),max);			
			sdt.addOneDay();
		}
		
		writer(response,"success");
	}
	

	private boolean testcreatestatus;

	public boolean isStatus() {
		return testcreatestatus;
	}

	public void setStatus(boolean status) {
		this.testcreatestatus = status;
	}  

	@RequestMapping("/orderfortest/statistics")
	public void orderforstatistics(HttpServletRequest request ,HttpServletResponse response,JcfxDataCatalog entity,
			String startDate,String endDate){
		
		try{			
		
			JcfxDataCatalog jdc=policyAnalysisService.findForObject2("com.nasoft.aboutcar.JcfxDataCatalogMapper.selectList", entity);

			if(!StringUtils.isNullOrEmpty(startDate)){
				startDate=new DateTime().getTextDate();
			}
			DateTime sdt=new DateTime(startDate);
			DateTime edt=new DateTime();	
			if(!StringUtils.isNullOrEmpty(endDate)){
				edt=new DateTime(endDate).addOneDay().delSecond(1);			
			}
			
			while(!testcreatestatus && sdt.compare(edt)<0){
				
				String sql=jdc.getDataSql();
				Map<String,String> param=new HashMap<String,String>();
				param.put("sql", sql);
				param.put("startDate", sdt.getText());
				param.put("endDate", sdt.clone().addOneDay().delSecond(1).getText());
				
				policyAnalysisService.insert2("com.nasoft.aboutcar.JcfxTaskMapper.executeSql", param);
				
				sdt.addOneDay();
			}
						
			writer(response,"success");
		}catch(Exception e){
			writer(response,e.getMessage());
		}

	}
	
	@RequestMapping("/orderfortest/stop")
	public void orderforteststop(HttpServletRequest request ,HttpServletResponse response) throws Exception{
				
		testcreatestatus=true;
		
		writer(response,"success");
	}
	
	private void createOrder(String price,String areaCode,String areaLevel,Date date,int max) throws Exception{

		MngAreaInfo mai=new MngAreaInfo();
		mai.setAreaLevel(areaLevel);
		mai.setAreaCode(areaCode+"%");
		List<MngAreaInfo> areas=policyAnalysisService.findForList2("com.nasoft.aboutcar.MngAreaInfoMapper.findLikeCode", mai);
		
		List<Map> companies= policyAnalysisService.findForList2("com.nasoft.aboutcar.JcfxTaskMapper.findCompany", new HashMap());
		
		for(MngAreaInfo area : areas){
			Double min=Double.valueOf(max>99?max:10000)*0.3d;
			int num=random(min.intValue(),max);
			for(int i=0;i<num;i++){
				
				if(testcreatestatus){return;}
				
				BnsOperationPay bop =new BnsOperationPay();
				bop.setCreateTime(randomDateBetweenMinAndMax(date));
				bop.setOnArea(Integer.valueOf(area.getAreaCode()));
				
				int rnd=random(1,10);
				double d=Double.valueOf(random(10,180))/10d;
				if(rnd<7){
				}else if(rnd>=7 && rnd<10){
					d=Double.valueOf(random(170,300))/10d;
				}else if(rnd==10){
					d=Double.valueOf(random(290,600))/10d;
				}
				bop.setDriveMile(BigDecimal.valueOf(d));
				
				double _price=11;
				String[] prices=price.split(",");
				if(prices.length>1){
					if(bop.getCreateTime().getHours()>5 && bop.getCreateTime().getHours()<22){
						_price=Double.valueOf(prices[0]);
					}else{
						_price=Double.valueOf(prices[1]);	
					}			
				}else{
					_price=Double.valueOf(prices[0]);			
				}
						
				BigDecimal amount= BigDecimal.valueOf(Double.valueOf(_price) * bop.getDriveMile().doubleValue());
				bop.setFactPrice(amount);
				bop.setPrice(BigDecimal.valueOf(_price));
				
				bop.setWaitMile(BigDecimal.valueOf(random(0,300)));
				
				bop.setCompanyId(companies.get(random(0,companies.size()-1)).get("creditcode").toString());

				policyAnalysisService.insert2("com.nasoft.aboutcar.BnsOperationPayMapper.insert", bop);		
			}		

		}
		
	}
	
	
	private int random(int min,int max) {

		java.util.Random random = new java.util.Random();

        int s = random.nextInt(max)%(max-min+1) + min;
        //System.out.println(s);
        return s;
    }
	
	private Date randomDateBetweenMinAndMax(Date date){  
	       Calendar calendar = Calendar.getInstance();  
	       //注意月份要减去1  
	       calendar.setTime(date);
	       calendar.getTime().getTime();  
	       //根据需求，这里要将时分秒设置为0  
	       calendar.set(Calendar.HOUR_OF_DAY, 0);  
	       calendar.set(Calendar.MINUTE, 0);  
	       calendar.set(Calendar.SECOND,0);  
	       long min = calendar.getTime().getTime();  
	       calendar.setTime(date);
	       calendar.set(Calendar.HOUR_OF_DAY,23);  
	       calendar.set(Calendar.MINUTE,59);  
	       calendar.set(Calendar.SECOND,59);  
	       calendar.getTime().getTime();  
	       long max = calendar.getTime().getTime();  
	       //得到大于等于min小于max的double值  
	       double randomDate = Math.random()*(max-min)+min;  
	       //将double值舍入为整数，转化成long类型  
	       calendar.setTimeInMillis(Math.round(randomDate));  
	       return calendar.getTime();
	   }

	
}
