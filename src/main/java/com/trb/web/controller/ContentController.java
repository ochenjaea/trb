package com.trb.web.controller;

import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.trb.web.service.ContentService;
import com.trb.web.service.ListService;
import com.trb.web.service.ServiceDispatch;


/**
 * 기본 Controller
 * @author semoria
 *
 */
@Controller
public class ContentController extends AbstractController {
	//private static Logger logger = Logger.getLogger(ContentController.class);
	private static Logger logger = Logger.getLogger(ContentController.class);
	private FileOutputStream fos;
	@Autowired
	private ServiceDispatch serviceDispatch;
	
	@Autowired
	private ContentService contentService;

	/**
	 * Constructor
	 */
	public ContentController() {
		logger.debug("Create ContentController");
	}
	
	
	@RequestMapping(value = "/pageView/korContent.do")
	public ModelAndView korContent(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "chapter", required = false)  String chapter,
			@RequestParam(value = "osis", required = false) String osis,
			@RequestParam(value = "page", required = false) String page
		) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();

		
		result = contentService.korContent(chapter, osis, page, response, request);
		
		result.setViewName("korContent");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/engContent.do")
	public ModelAndView engContent(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "chapter", required = false)  String chapter,
			@RequestParam(value = "osis", required = false) String osis,
			@RequestParam(value = "page", required = false) String page) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();
		
		result = contentService.engContent(chapter, osis, page, response, request);
		
		result.setViewName("engContent");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/kengContent.do")
	public ModelAndView kengContent(HttpServletResponse response, HttpServletRequest request, @RequestParam("chapter") String chapter, @RequestParam("osis") String osis) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();
		
		result = contentService.kengContent(chapter,osis,response, request);
		
		result.setViewName("kengContent");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/korBigContent.do")
	public ModelAndView korBigContent(HttpServletResponse response, HttpServletRequest request,
			@RequestParam("chapter") String chapter,
			@RequestParam("osis") String osis,
			@RequestParam(value = "page", required = false) String page
		) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();
		
		result = contentService.korContent(chapter, osis, page, response, request);
		
		result.setViewName("korBigContent");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/engBigContent.do")
	public ModelAndView engBigContent(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "chapter", required = false)  String chapter,
			@RequestParam(value = "osis", required = false) String osis,
			@RequestParam(value = "page", required = false) String page
		) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();
		
		result = contentService.engContent(chapter, osis, page, response, request);
		
		result.setViewName("engBigContent");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/kengBigContent.do")
	public ModelAndView kengBigContent(HttpServletResponse response, HttpServletRequest request, @RequestParam("chapter") String chapter, @RequestParam("osis") String osis) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();
		
		result = contentService.kengContent(chapter,osis,response, request);
		
		result.setViewName("kengBigContent");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/korPopup.do")
	public ModelAndView korPopup(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "bookid", required = false)  String bookid
			,@RequestParam(value = "startNum", required = false)  String startNum
			,@RequestParam(value = "endNum", required = false)  String endNum
			,@RequestParam(value = "type", required = false)  String type
		) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();

		
		result = contentService.korPopup(bookid);
		result.addObject("startNum",startNum);
		result.addObject("endNum",endNum);
		if(type.equals("s")){
			result.addObject("type","korContent");
		}else{
			result.addObject("type","korBigContent");
		}
		
		result.setViewName("korPopup");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/engPopup.do")
	public ModelAndView engPopup(HttpServletResponse response, HttpServletRequest request,
			@RequestParam(value = "bookid", required = false)  String bookid
			,@RequestParam(value = "startNum", required = false)  String startNum
			,@RequestParam(value = "endNum", required = false)  String endNum
			,@RequestParam(value = "type", required = false)  String type
		) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();

		
		result = contentService.korPopup(bookid);
		result.addObject("startNum",startNum);
		result.addObject("endNum",endNum);
		if(type.equals("s")){
			result.addObject("type","engContent");
		}else{
			result.addObject("type","engBigContent");
		}
		
		result.setViewName("engPopup");
		
		return result;
	}
	
	
}
