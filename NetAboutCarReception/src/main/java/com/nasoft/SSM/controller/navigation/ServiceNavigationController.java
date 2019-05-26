package com.nasoft.SSM.controller.navigation;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 服务导航
 * @author user
 *
 */
@Controller
@RequestMapping("/navigation")
public class ServiceNavigationController {
	
	private static Logger logger = Logger.getLogger(ServiceNavigationController.class);
	
	/**
	 * 打开服务导航
	 * @return
	 */
	@RequestMapping("/openServiceNavigation")
	public String openServiceNavigation(HttpServletRequest request) {
		logger.debug("openServiceNavigation");
		return "navigation/ServiceNavigation";
	}
}