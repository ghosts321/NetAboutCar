package com.nasoft.SSM.controller.announcement;

import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.SSM.base.controller.BaseController;
import com.nasoft.SSM.domain.Content;
import com.nasoft.SSM.domain.CxkhDrvPunList;
import com.nasoft.SSM.service.ContentService;

/**
 * 公告公布
 * @author user
 *
 */
@Controller
@RequestMapping("/announcement")
public class AnnouncementController extends BaseController {
	
	private static Logger logger = Logger.getLogger(AnnouncementController.class);
	
	@Resource
	private ContentService contentService;
	/**
	 * 公告公布首页
	 * @return
	 */
	@RequestMapping("/openAnnouncement")
	public String openAnnouncement(){
		logger.debug("announcementMain");
		return "announcement/announcementMain";
	}
	
	/**
	 * 公告列表
	 * @return
	 */
	@RequestMapping("/moreAnnouncement")
	public String moreAnnouncement(){
		return "announcement/announcementMore1";
	}
	
	/**
	 * 公布列表
	 * @return
	 */
	@RequestMapping("/morePromulgate")
	public String morePromulgate(){
		return "announcement/announcementMore2";
	}
	
	/**
	 * 公告详细页
	 * @return
	 */
	@RequestMapping("/viewAnnouncement")
	public String viewAnnouncement(){
		return "announcement/viewAnnouncement";
	}
	
	/**
	 * 公布详细页
	 * @return
	 */
	@RequestMapping("/viewPromulgate")
	public String viewPromulgate(){
		return "announcement/viewPromulgate";
	}
	
	/**
	 * 查询结果
	 * @return
	 */
	@RequestMapping("/searchAnnouncement")
	public String searchAnnouncement(HttpServletRequest request){
		try {
			Map<String, Object> map=new HashMap<String, Object>();
			String type=request.getParameter("type");
			String title=request.getParameter("title");
			if(StringUtils.isNotBlank(title)){
				title=URLDecoder.decode(title,"UTF-8");
			}
			map.put("type", type);
			map.put("title", title);
		  List<Content>	list=contentService.findAllContentByType("com.nasoft.aboutcar.contentMapper.findAllContentByType", map);
		  request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "announcement/announcementResult";
	}
	
	@RequestMapping("/driver/pun/list")
	public void listDrvPun(HttpServletResponse response) throws Exception{

		List<CxkhDrvPunList> puns = contentService.findDrvPunList("com.nasoft.aboutcar.CxkhDrvPunListMapper.selectList",new CxkhDrvPunList());
		writer(response,puns);
		
	}
	
	@RequestMapping("/driver/pun/detail")
	public String detailDrvPun(HttpServletRequest request,String listNo){
		request.setAttribute("listNo", listNo);
		return "announcement/drvPunDetail";
	}
	
}
