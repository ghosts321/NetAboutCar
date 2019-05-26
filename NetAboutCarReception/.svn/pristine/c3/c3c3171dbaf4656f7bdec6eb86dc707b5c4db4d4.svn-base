package com.nasoft.SSM.controller.help;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 帮助文档
 * @author user
 *
 */
@Controller
@RequestMapping("/help")
public class HelpController {
	
	private static Logger logger = Logger.getLogger(HelpController.class);
	
	@RequestMapping("/toHelpPage")
	public String toHelpPage(HttpServletRequest request){
		String userName=(String) request.getSession().getAttribute("userName");
		//如果没有登录 跳转到登录页面
		if(null==userName || "".equals(userName)){ 
			return "system/userLogin";
		}
		return "help/helpPage";
	}
	
	@RequestMapping("/toHelpMain")
	public String toHelpMain(){
		return "help/helpMain";
	}
	
	@RequestMapping("/toHelpContent1")
	public String toHelpContent1(){
		return "help/helpcontent1";
	}
	@RequestMapping("/toHelpContent2_1")
	public String toHelpContent2_1(){
		return "help/helpcontent2_1";
	}
	@RequestMapping("/toHelpContent2_2")
	public String toHelpContent2_2(){
		return "help/helpcontent2_2";
	}
	@RequestMapping("/toHelpContent2_3")
	public String toHelpContent2_3(){
		return "help/helpcontent2_3";
	}
	@RequestMapping("/toHelpContent3_1_1")
	public String toHelpContent3_1_1(){
		return "help/helpcontent3_1_1";
	}
	@RequestMapping("/toHelpContent3_1_2")
	public String toHelpContent3_1_2(){
		return "help/helpcontent3_1_2";
	}
	@RequestMapping("/toHelpContent3_1_3")
	public String toHelpContent3_1_3(){
		return "help/helpcontent3_1_3";
	}
	@RequestMapping("/toHelpContent3_1_4")
	public String toHelpContent3_1_4(){
		return "help/helpcontent3_1_4";
	}
	@RequestMapping("/toHelpContent3_1_5")
	public String toHelpContent3_1_5(){
		return "help/helpcontent3_1_5";
	}
	@RequestMapping("/toHelpContent3_1_6")
	public String toHelpContent3_1_6(){
		return "help/helpcontent3_1_6";
	}
	@RequestMapping("/toHelpContent3_2_1")
	public String toHelpContent3_2_1(){
		return "help/helpcontent3_2_1";
	}
	@RequestMapping("/toHelpContent3_2_2")
	public String toHelpContent3_2_2(){
		return "help/helpcontent3_2_2";
	}
	@RequestMapping("/toHelpContent3_2_3")
	public String toHelpContent3_2_3(){
		return "help/helpcontent3_2_3";
	}
	@RequestMapping("/toHelpContent3_2_4")
	public String toHelpContent3_2_4(){
		return "help/helpcontent3_2_4";
	}
	@RequestMapping("/toHelpContent2_4")
	public String toHelpContent2_4(){
		return "help/helpcontent2_4";
	}
	@RequestMapping("/toHelpContent9_1")
	public String toHelpContent9_1(){
		return "help/helpcontent9_1";
	}
	@RequestMapping("/toHelpContent9_2")
	public String toHelpContent9_2(){
		return "help/helpcontent9_2";
	}
	@RequestMapping("/toHelpContent9_3")
	public String toHelpContent9_3(){
		return "help/helpcontent9_3";
	}
	@RequestMapping("/toHelpContent9_4")
	public String toHelpContent9_4(){
		return "help/helpcontent9_4";
	}
	@RequestMapping("/toHelpContent9_5")
	public String toHelpContent9_5(){
		return "help/helpcontent9_5";
	}
	@RequestMapping("/toHelpContent9_6")
	public String toHelpContent9_6(){
		return "help/helpcontent9_6";
	}
	@RequestMapping("/toHelpContent9_7")
	public String toHelpContent9_7(){
		return "help/helpcontent9_7";
	}
	@RequestMapping("/toHelpContent9_8")
	public String toHelpContent9_8(){
		return "help/helpcontent9_8";
	}
	}
