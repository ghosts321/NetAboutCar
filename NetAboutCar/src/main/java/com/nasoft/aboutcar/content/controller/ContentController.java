package com.nasoft.aboutcar.content.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.nasoft.aboutcar.base.controller.BaseController;
import com.nasoft.aboutcar.content.domain.Content;
import com.nasoft.aboutcar.content.domain.LbContent;
import com.nasoft.aboutcar.content.service.ContentService;


@Controller
@RequestMapping("/content")
public class ContentController extends BaseController{

	@Resource
	private ContentService contentService;
	
	@RequestMapping("index")
	public String index(){
		return "content/index";
	}
	
	@RequestMapping("lbindex")
	public String lbindex(){
		return "content/lbindex";
	}
	
	@RequestMapping("toAdd")
	public String toAdd(){
		return "content/add";
	}
	
	@RequestMapping("toUpdate")
	public ModelAndView toUpdate(HttpServletRequest request,String id){
		ModelAndView mv=new ModelAndView();
		try {
			Content content=contentService.findContentById("com.nasoft.aboutcar.content.findContentById", id);
			String url=content.getUrl();
			String filePath=request.getSession().getServletContext().getRealPath("/")+url;
			//读取HTML
			File input=new File(filePath);
			if(input.isFile()){
				
			    Document doc = Jsoup.parse(input, "UTF-8");
			    Element cont=doc.getElementById("content");
				String formValue=cont.html();
			    
				formValue=formValue.replace("\"", "'");
				mv.addObject("content", content);
				mv.addObject("formValue", formValue);
				mv.setViewName("content/update");
			}else{
				mv.addObject("msg","该文件不存在");
				mv.setViewName("save_result");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
	
	
	
	@RequestMapping("toAddLb")
	public String toAddLb(HttpServletRequest request){
		try {
			List<Content> list=contentService.findAllContent("com.nasoft.aboutcar.content.findAllPicContent",null);
			request.setAttribute("list", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "content/addLunbo";
	}
	
	
	@RequestMapping("findAllContent")
	public void findAllContent(HttpServletRequest request,HttpServletResponse response){
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			String title = request.getParameter("title");
			map.put("title", title);
			List<Content> list=contentService.findAllContent("com.nasoft.aboutcar.content.findAllContent",map);
			JSONArray array = JSONArray.fromObject(list);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("findAllLbContent")
	public void findAllLbContent(HttpServletRequest request,HttpServletResponse response){
		
		try {
			List<LbContent> list=contentService.findAllLbContent("com.nasoft.aboutcar.content.findAllLbContent");
			JSONArray array = JSONArray.fromObject(list);
			writer(response, array+"");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	 
	

	@RequestMapping("addLunBo")
	public ModelAndView addLunBo(HttpServletRequest request,HttpServletResponse response,HttpSession session,
			@RequestParam(value="files",required=false) MultipartFile[] files
		 
	    ){
		ModelAndView mv=new ModelAndView();
		try {
			SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String[] title=request.getParameterValues("title");
			String[] url=request.getParameterValues("url");
			
			
			 if(files!=null&&files.length>0){  
		            //循环获取file数组中得文件  
		            for(int i = 0;i<files.length;i++){  
		                MultipartFile file = files[i];  
		                //保存文件  
		                boolean b=saveFile(request,file);
		                if(b){
		                	LbContent lb=new LbContent();
		                	lb.setTitle(title[i]);
		                	lb.setImgPath(file.getOriginalFilename());
		                	lb.setUrl(url[i]);
		                	lb.setCreateDate(sdf2.format(new Date()));
		                	contentService.addLbContent("com.nasoft.aboutcar.content.insertLbContent", lb);
		                }
		          }  
		    }  
			 
		} catch (Exception e) {
			mv.addObject("msg","failed");
			e.printStackTrace();
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
		
	}
	 private boolean saveFile(HttpServletRequest request,MultipartFile file) {  
	        // 判断文件是否为空  
	        if (!file.isEmpty()) {  
	            try {  
	                // 文件保存路径  
	                String filePath = request.getSession().getServletContext().getRealPath("/") + "face/"  
	                        + file.getOriginalFilename();  
	                // 转存文件  
	                file.transferTo(new File(filePath));  
	                return true;  
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }  
	        return false;  
	    }  
	
	@RequestMapping("add")
	public ModelAndView add(HttpServletRequest request,HttpServletResponse response,HttpSession session,Content content){
		ModelAndView mv=new ModelAndView();
		try {
		    SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmssSSS");
		    SimpleDateFormat sdf2=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			//内容
			String formValue=request.getParameter("formValue");
			//读取模板文件
			String filePath=session.getServletContext().getRealPath("/face")+"/template.html";
			File input=new File(filePath);
			
		    Document doc = Jsoup.parse(input, "UTF-8");
		    System.out.println(doc.html());
		    Element cont=doc.getElementById("content");
		    
		    //将提交过来的内容添加到body中
		    cont.html(formValue);
		    
		    String fileName=sdf.format(new Date())+".html";
		    String url=session.getServletContext().getRealPath("/face")+"/"+fileName;
		    content.setUrl("face/"+fileName);
		    //写到一个新的文件中
		    //FileUtils.copyFile(input,new File(session.getServletContext().getRealPath("/")+"face/"+fileName));
		    FileOutputStream fos = new FileOutputStream(url, false);  
		    OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");  
		    osw.write(doc.html());  
		    osw.close(); 
		    
		    if(content.getId()!=0){
		    	contentService.deleteContent("com.nasoft.aboutcar.content.deleteContent", content.getId()+"");
		    }
	    	content.setCreateMan("1");
	    	content.setCreateInstId("1");
	    	content.setCreateDate(sdf2.format(new Date()));
	    	contentService.addContent("com.nasoft.aboutcar.content.insertContent", content);
		    
		    
			} catch (Exception e) {
				mv.addObject("msg","failed");
				e.printStackTrace();
			}
			mv.addObject("msg","success");
			mv.setViewName("content/index");
			return mv;
	}
	@RequestMapping("del")
	public void del(String id,PrintWriter out){
		
		try {
			contentService.deleteContent("com.nasoft.aboutcar.content.deleteContentAndLunBo", id);
			contentService.deleteContent("com.nasoft.aboutcar.content.deleteContent", id);
			out.write("success");
			out.flush();
			out.close();
		} catch (Exception e) {
			out.write("failed");
			e.printStackTrace();
		}
	}
	@RequestMapping("delLb")
	public void delLb(String id,PrintWriter out){
		
		try {
			contentService.deleteContent("com.nasoft.aboutcar.content.deleteLbContent", id);
			out.write("success");
			out.flush();
			out.close();
		} catch (Exception e) {
			out.write("failed");
			e.printStackTrace();
		}
	}
}
