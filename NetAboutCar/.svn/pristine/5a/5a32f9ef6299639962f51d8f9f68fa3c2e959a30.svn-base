package com.nasoft.aboutcar.report.controller;

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.aboutcar.base.controller.BaseController;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

@Controller
@RequestMapping("/report")
public class ReportController extends BaseController {
	

	
	//驾驶员违章分析
	@RequestMapping("index")
	public String indexList(){
		return "report/index";
	}
	//网约车订单分析
	@RequestMapping("order")
	public String orderList(){
		return "report/order";
	}
	//乘客评价分析
	@RequestMapping("evaluate")
	public String evaluateList(){
		return "report/evaluate";
	}
	//从业人员分析
	@RequestMapping("employee")
	public String employeeList(){
		return "report/employee";
	}
	//客运量分析
	@RequestMapping("passengerQuantity")
	public String passengerQuantityList(){
		return "report/passengerQuantity";
	}
	//营收分析
	@RequestMapping("revenue")
	public String revenueList(){
		return "report/revenue";
	}
	//质量分析
	@RequestMapping("quality")
	public String qualityList(){
		return "report/quality";
	}
	//驾驶员违章统计
	@RequestMapping("operationStatistics")
	public String operationStatisticsList(){
		return "report/operationStatistics";
	}
	//营运数据统计excel
	@RequestMapping("exportExcel")
    public void createExcel(HttpServletRequest request,HttpServletResponse response) throws IOException, RowsExceededException, WriteException{
    	OutputStream outputStream = response.getOutputStream();
        response.reset();
        String fileName = "营运数据统计表.xls";
        response.setHeader("Content-Disposition", "attachment; filename=" + new String(fileName.getBytes("gb2312"), "ISO8859-1"));
        response.setContentType("application/octet-stream; charset=utf-8");
        
        //创建工作薄
        WritableWorkbook workbook = Workbook.createWorkbook(outputStream);
        // 设置单元格格式
        WritableCellFormat writableCellFormat = new WritableCellFormat();
        writableCellFormat.setWrap(true);
        
        String dataType = request.getParameter("dataType");
        if(StringUtils.isBlank(dataType) || "platform".equals(dataType)){
        	
            //创建新的一页
            WritableSheet sheet = workbook.createSheet("企业",0);
            //创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
            Label xh = new Label(0,0,"序号");
            sheet.addCell(xh);
            Label qymc = new Label(1,0,"企业名称");
            sheet.addCell(qymc);
            Label zccls = new Label(2,0,"注册车辆数");
            sheet.addCell(zccls);
            Label zcjsys = new Label(3,0,"注册驾驶员数");
            sheet.addCell(zcjsys);
            Label hycls = new Label(4,0,"活跃车辆数");
            sheet.addCell(hycls);
            Label jjbz = new Label(5,0,"计价标准");
            sheet.addCell(jjbz);
            Label dds = new Label(6,0,"订单数");
            sheet.addCell(dds);
            
            Label xh1 = new Label(0,1,"1");
            sheet.addCell(xh1);
            Label qymc1 = new Label(1,1,"滴滴打车");
            sheet.addCell(qymc1);
            Label zccls1 = new Label(2,1,"3478");
            sheet.addCell(zccls1);
            Label zcjsys1 = new Label(3,1,"3478");
            sheet.addCell(zcjsys1);
            Label hycls1 = new Label(4,1,"3362");
            sheet.addCell(hycls1);
            Label jjbz1 = new Label(5,1,"2.3元/公里");
            sheet.addCell(jjbz1);
            Label dds1 = new Label(6,1,"12482");
            sheet.addCell(dds1);
            
            Label xh2 = new Label(0,2,"2");
            sheet.addCell(xh2);
            Label qymc2 = new Label(1,2,"神州专车");
            sheet.addCell(qymc2);
            Label zccls2 = new Label(2,2,"5268");
            sheet.addCell(zccls2);
            Label zcjsys2 = new Label(3,2,"5268");
            sheet.addCell(zcjsys2);
            Label hycls2 = new Label(4,2,"4623");
            sheet.addCell(hycls2);
            Label jjbz2 = new Label(5,2,"2.4元/公里");
            sheet.addCell(jjbz2);
            Label dds2 = new Label(6,2,"82482");
            sheet.addCell(dds2);
            
            Label xh3 = new Label(0,3,"3");
            sheet.addCell(xh3);
            Label qymc3 = new Label(1,3,"优步");
            sheet.addCell(qymc3);
            Label zccls3 = new Label(2,3,"4789");
            sheet.addCell(zccls3);
            Label zcjsys3 = new Label(3,3,"4789");
            sheet.addCell(zcjsys3);
            Label hycls3 = new Label(4,3,"4223");
            sheet.addCell(hycls3);
            Label jjbz3 = new Label(5,3,"1.8元/公里");
            sheet.addCell(jjbz3);
            Label dds3 = new Label(6,3,"52482");
            sheet.addCell(dds3);
            int total = 52482+82482+12482;
            Label xh4 = new Label(0,4,"总计");
            sheet.addCell(xh4);
            Label dds4 = new Label(6,4,String.valueOf(total));
            sheet.addCell(dds4);
        }else if("vehicle".equals(dataType)){
        	//创建新的一页
            WritableSheet sheet2 = workbook.createSheet("车辆",1);
            sheet2.setColumnView(2,20);
            //创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
            Label xh_v = new Label(0,0,"序号");
            sheet2.addCell(xh_v);
            Label qymc_v = new Label(1,0,"车牌号码");
            sheet2.addCell(qymc_v);
            Label dds_v = new Label(2,0,"订单数");
            sheet2.addCell(dds_v);
            
            Label xh_v1 = new Label(0,1,"1");
            sheet2.addCell(xh_v1);
            Label qymc_v1 = new Label(1,1,"沪KR9888");
            sheet2.addCell(qymc_v1);
            Label dds_v1 = new Label(2,1,"滴滴打车：482\n优步：243",writableCellFormat);
            sheet2.addCell(dds_v1);
            
            Label xh_v2 = new Label(0,2,"2");
            sheet2.addCell(xh_v2);
            Label qymc_v2 = new Label(1,2,"京AH8888");
            sheet2.addCell(qymc_v2);
            Label dds_v2 = new Label(2,2,"滴滴打车：482\n神州专车：131\n优步：243",writableCellFormat);
            sheet2.addCell(dds_v2);
            
            Label xh_v3 = new Label(0,3,"总计");
            sheet2.addCell(xh_v3);
            Label dds_v3 = new Label(2,3,String.valueOf(482+482+243+243+131));
            sheet2.addCell(dds_v3);
        }else if("pilot".equals(dataType)){
        	//创建新的一页
            WritableSheet sheet3 = workbook.createSheet("驾驶员",2);
            sheet3.setColumnView(1,15);
            sheet3.setColumnView(2,20);
            //创建要显示的内容,创建一个单元格，第一个参数为列坐标，第二个参数为行坐标，第三个参数为内容
            Label xh_p = new Label(0,0,"序号");
            sheet3.addCell(xh_p);
            Label qymc_p = new Label(1,0,"驾驶员名称");
            sheet3.addCell(qymc_p);
            Label dds_p = new Label(2,0,"订单数");
            sheet3.addCell(dds_p);
            
            Label xh_p1 = new Label(0,1,"1");
            sheet3.addCell(xh_p1);
            Label qymc_p1 = new Label(1,1,"张凯杰");
            sheet3.addCell(qymc_p1);
            Label dds_p1 = new Label(2,1,"滴滴打车：482\n优步：243",writableCellFormat);
            sheet3.addCell(dds_p1);
            
            Label xh_p2 = new Label(0,2,"2");
            sheet3.addCell(xh_p2);
            Label qymc_p2 = new Label(1,2,"韦宇冰");
            sheet3.addCell(qymc_p2);
            Label dds_p2 = new Label(2,2,"滴滴打车：482\n神州专车：131\n优步：243",writableCellFormat);
            sheet3.addCell(dds_p2);
            
            Label xh_p3 = new Label(0,3,"总计");
            sheet3.addCell(xh_p3);
            Label dds_p3 = new Label(2,3,String.valueOf(482+482+243+243+131));
            sheet3.addCell(dds_p3);
        }
        
        //把创建的内容写入到输出流中，并关闭输出流
        workbook.write();
        workbook.close();
        outputStream.close();
    }
}
