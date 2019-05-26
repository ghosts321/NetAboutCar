package com.nasoft.SSM.controller.content;

import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.nasoft.SSM.base.controller.BaseController;
import com.nasoft.SSM.domain.Content;
import com.nasoft.SSM.domain.LbContent;
import com.nasoft.SSM.service.ContentService;



@Controller
@RequestMapping("/content")
public class ContentController extends BaseController{

	@Resource
	private ContentService contentService;
	 
	@RequestMapping("index")
	public String index(){
		return "content/index";
	}
	@RequestMapping("toAdd")
	public String toAdd(){
		return "content/add";
	}
	
	@RequestMapping("toFirstPage")
	public void toFirstPage(HttpServletRequest request,HttpServletResponse response){
		
		try {
			//1 信息咨讯 2 信息公告 3 政策法规 4诚信信息 5 投诉披露 ）
			List<Content> list=contentService.findAllContent("com.nasoft.aboutcar.contentMapper.findAllContent");
			
			//List<LbContent> list2=contentService.findAllLbContent("com.nasoft.aboutcar.contentMapper.findAllLbContent");
			
			//request.getSession().setAttribute("list2", list2);
			
			JSONArray jsonObject = JSONArray.fromObject(list);
			writer(response, jsonObject+"");
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
	 
	@RequestMapping("getLbContent")
	public void getLbContent(HttpServletRequest request,HttpServletResponse response){
		try {
			
			List<LbContent> list2=contentService.findAllLbContent("com.nasoft.aboutcar.contentMapper.findAllLbContent");
		
			JSONArray jsonObject = JSONArray.fromObject(list2);
			writer(response, jsonObject+"");
			
		} catch (Exception e) { 
			e.printStackTrace();
		}
	}
	
	 
}
