/**
* PoiUtil.java
* 
* @author qye.zheng
* 	version 1.0
 */
package com.nasoft.util;

import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Comment;
import org.apache.poi.ss.usermodel.Drawing;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFClientAnchor;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * 描述: 
 * @author PC-Yang
 * PoiUtil
 */
public final class PoiUtil {
	
	/**
	 jxl 目前只能读取 office 2003及相对低版本的 excel表格
	 
	 poi 可以读取 office 2003 或 2007 以及更高版本的 excel表格
	 创建的时候需要根据文件后缀名来选择构建方式 (xls / xlsx)
	 
	 */
	
	/** 无参构造方法 */
	private PoiUtil() {}
	
	/**
	 * 
	 * 描述: 列处理 是否为空
	 * @param cell
	 * @return
	 */
	public static boolean isNull(final Cell cell) {
		// 为null 或 空白单元格
		if (null == cell || Cell.CELL_TYPE_BLANK == cell.getCellType()) {
			
			return true;
		} else if (Cell.CELL_TYPE_STRING == cell.getCellType())
		{
			/*
			 如果是一些其他格式填充单元格，则可能会解析为空格字符串
			 */
			return StringUtil.isEmpty(cell.getStringCellValue());
		}
		
		return false;
	}
	
	/**
	 * 
	 * 描述: 根据不同版本的excel构建工作簿对象
	 * 
	 * @param suffix
	 * @param input
	 * @return
	 */
	public static Workbook buildWorkbook(final String suffix, final InputStream input)
	{
		// org.apache.poi.ss.usermodel.Workbook
		Workbook workbook = null;
		
		try
		{
			if (FormatConstant.EXCEL_XLS.equals(suffix))
			{
				// excel 2003格式文档
				workbook = new HSSFWorkbook(input);
			} else if (FormatConstant.EXCEL_XLSX.equals(suffix))
			{
				// excel 2007及以后的格式文档
				workbook = new XSSFWorkbook(input);
			}
			
		} catch (IOException e)
		{
			e.printStackTrace();
		}
		
		return workbook;
	}
	
	/**
	 * 
	 * 描述: 根据excel文件后缀名创建工作簿对象
	 * 
	 * @param suffix
	 * @return
	 */
	public static Workbook createWorkbook(final String suffix)
	{
		// org.apache.poi.ss.usermodel.Workbook
		Workbook workbook = null;
		if (FormatConstant.EXCEL_XLS.equals(suffix))
		{
			// excel 2003格式文档
			workbook = new HSSFWorkbook();
		} else if (FormatConstant.EXCEL_XLSX.equals(suffix))
		{
			// excel 2007及以后的格式文档
			workbook = new XSSFWorkbook();
		}
		
		return workbook;
	}
	
	/**
	 * 
	 * 描述: 去除数字单元格的小数部分
	 * 转化为整型数字 字符串
	 * 
	 * @param cell
	 * @return
	 */
	public static String trimDecimalFraction(final Cell cell)
	{
		String value = null;
		final DecimalFormat decimalFormat = new DecimalFormat("#");
		value = decimalFormat.format(cell.getNumericCellValue());
		
		return value;
	}
	
	/**
	 * 
	 * 描述: 获取红色(警告)样式
	 * @param workbook
	 * @return
	 */
	public static CellStyle createRedStyle(final Workbook workbook)
	{
		final CellStyle cellStyle = workbook.createCellStyle();
		// 设置填充模式
		cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
		// 设置前景色 (单元格的填充色)
		cellStyle.setFillForegroundColor(HSSFColor.RED.index);
		
		return cellStyle;
	}
	
	/**
	 * 
	 * 描述: 生成单元格批注
	 * @param suffix 后缀 xls / xlsx
	 * @param sheet 表格
	 * @param comment 批注内容
	 * @return
	 */
	public static Comment createCellComment(final String suffix, final Sheet sheet, final String comment)
	{
		// 注意 author参数不能传null
		return createCellComment(suffix, sheet, "", comment);
	}
	
	/**
	 * 
	 * 描述: 生成单元格批注
	 * @param suffix xls / xlsx
	 * @param sheet 表格
	 * @param author 作者
	 * @param comment 批注内容
	 * @return
	 */
	public static Comment createCellComment(final String suffix, final Sheet sheet, final String author, final String comment)
	{
		Comment cmt = null;
		final Drawing drawing = sheet.createDrawingPatriarch();
		
		if (FormatConstant.EXCEL_XLS.equals(suffix))
		{
			// excel 2003格式文档 ClientAnchor必须使用参数，否则在ms excel 中无法查看批注
			cmt = drawing.createCellComment(new HSSFClientAnchor(0, 0, 0, 0, (short) 3, 3 ,(short) 5, 6));
			cmt.setString(new HSSFRichTextString(comment));
		} else if (FormatConstant.EXCEL_XLSX.equals(suffix))
		{
			// excel 2007及以后的格式文档 ClientAnchor必须使用参数，否则在ms excel 中无法查看批注
			cmt = drawing.createCellComment(new XSSFClientAnchor(0, 0, 0, 0, (short) 3, 3 ,(short) 5, 6));
			cmt.setString(new XSSFRichTextString(comment));
		}
		// 公共部分
		cmt.setVisible(true);
		// 设置作者
		cmt.setAuthor(author);  
		
		return cmt;
	}
	
	/**
	 * 
	 * 描述: 统计表格中实际记录条数 (排除标题行)
	 * 规定: 第0行为标题行，中间不能有空行隔开
	 * 这样可以在有格式的情况下，统计出正确的记录总数
	 * @param sheet
	 * @param columnIndex 以哪个列为参照标准，默认是第0列不能为空
	 * @return
	 */
	public static int countActualRecord(final Sheet sheet, final int columnIndex)
	{
		Row row = null;
		Cell cell = null;
		int result = 0;
		final int startIndex = sheet.getFirstRowNum() + 1;
		final int physicialNumber = sheet.getPhysicalNumberOfRows();
		for (int i =  startIndex; i < physicialNumber; i++)
		{
			row = sheet.getRow(i);
			cell = row.getCell(columnIndex);
			if (isNull(cell))
			{
				continue;
			} else
			{
				result++;
			}
		}
		
		return result;
	}
	
	/**
	 * 
	 * 描述: 删除指定的行
	 * 通过让下方单元格上移来实现删除行的效果
	 * @param sheet
	 * @param rowIndex
	 */
	public static void deleteRow(final Sheet sheet, final int rowIndex)
	{
		 /**
		  
		  注意: 第0行只能向下移动，不能再往上移动
		  [0..65535] 最后一行也不能再往下移动，只能往上移动.
		  
		  1) 删除单行
		  删除掉第n行的实现: 
		  若第n行是最后一行，则无需上移 否则，将 n+1 行到最后一行，全部上移一行，
		  这样就可以实现将第n行删除掉.
		  
		  2) 删除多行
		  range可以设置为大于1，最后一个被删除的行的下标+1作为移动的beginIndex
		  
		  */
		final int lastRowNum = sheet.getLastRowNum();
		if (rowIndex >= FormatConstant.ZERO && rowIndex < lastRowNum)
		{
			// 将行号为rowIndex+1一直到行号为lastRowNum的单元格全部上移一行，以便删除rowIndex行
			sheet.shiftRows(rowIndex + FormatConstant.ONE, lastRowNum, FormatConstant.NEGATIVE_ONE);
		} else if (lastRowNum == rowIndex)
		{
			// 最后一行，将其清空掉即可
			final Row removingRow = sheet.getRow(rowIndex);
			if (null != removingRow)
			{
				sheet.removeRow(removingRow);
			}
		}
	}
	
}
