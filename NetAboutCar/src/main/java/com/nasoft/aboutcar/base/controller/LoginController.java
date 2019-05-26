package com.nasoft.aboutcar.base.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.ExpiredCredentialsException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.UnauthorizedException;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nasoft.util.DateTime;

@Controller
@RequestMapping("/login")
public class LoginController extends BaseController{
	
	@RequestMapping("/userLogin")
	public void doLogin(HttpServletRequest request,HttpServletResponse response){
		String msg = "";
	    String userName = request.getParameter("userName");  
	    request.getSession().setAttribute("userName",userName);
	    String password = request.getParameter("password"); 
	    //记住用户名、密码功能(注意：cookie存放密码会存在安全隐患)
        String remFlag = request.getParameter("remFlag");
        if("1".equals(remFlag)){ //"1"表示用户勾选记住密码
            /*String cookieUserName = Utils.encrypt(name);
            String cookiePwd = Utils.encrypt(passWord);
            String loginInfo = cookieUserName+","+cookiePwd;*/
            String loginInfo = userName+","+password;
            Cookie userCookie=new Cookie("loginInfo",loginInfo); 

            userCookie.setMaxAge(-1);   //存活期为一个月 30*24*60*60
           userCookie.setPath("/");
            response.addCookie(userCookie); 
           
        }
	    Subject subject = SecurityUtils.getSubject();
	    String pwd = new Md5Hash(password).toHex();
	    System.out.println(pwd);
	    UsernamePasswordToken token = new UsernamePasswordToken(userName, pwd);  
	    //token.setRememberMe(true); 
	    JSONObject job = new JSONObject();
	    try {  
	        subject.login(token);
	    } catch (IncorrectCredentialsException e) {  
	        msg = "登录密码错误. Password for account " + token.getPrincipal() + " was incorrect.";  
	        System.out.println(msg);  
	    } catch (ExcessiveAttemptsException e) {  
	        msg = "登录失败次数过多";  
	        System.out.println(msg);  
	    } catch (LockedAccountException e) {  
	        msg = "帐号已被锁定. The account for username " + token.getPrincipal() + " was locked.";  
	        System.out.println(msg);  
	    } catch (DisabledAccountException e) {  
	        msg = "帐号已被禁用. The account for username " + token.getPrincipal() + " was disabled.";  
	        System.out.println(msg);  
	    } catch (ExpiredCredentialsException e) {  
	        msg = "帐号已过期. the account for username " + token.getPrincipal() + "  was expired.";  
	        System.out.println(msg);  
	    } catch (UnknownAccountException e) {  
	        msg = "帐号不存在. There is no user with username of " + token.getPrincipal();  
	        System.out.println(msg);  
	    } catch (UnauthorizedException e) {  
	        msg = "您没有得到相应的授权！" + e.getMessage();  
	        System.out.println(msg);  
	    }
	    if (subject.isAuthenticated() && "".equals(msg)){
	    	subject.hasRoles(null);
	    	job.put("result","success");
	    	writer(response, job+"");
	    }else{
	    	token.clear();
	    	job.put("result", "usererror");
	    	writer(response, job+"");
	    }
	}
	
	@RequestMapping("/userLoginOut")
	public String doLogOut(HttpServletRequest request,HttpServletResponse response, Model model){
		Subject subject = SecurityUtils.getSubject();
		if (subject.isAuthenticated()) {
			subject.logout(); // session 会销毁，在SessionListener监听session销毁，清理权限缓存
		}
		return "redirect:loginOut.action";
	}
	@RequestMapping("/loginOut")
	public void testLogOut(){
		
	}
}
