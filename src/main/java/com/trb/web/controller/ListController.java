package com.trb.web.controller;

import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.trb.web.service.ListService;
import com.trb.web.service.ServiceDispatch;


/**
 * 기본 Controller
 * @author semoria
 *
 */
@Controller
public class ListController extends AbstractController {
	//private static Logger logger = Logger.getLogger(ListController.class);
	private static Logger logger = Logger.getLogger(ListController.class);
	private FileOutputStream fos;
	@Autowired
	private ServiceDispatch serviceDispatch;
	
	@Autowired
	private ListService listService;

	/**
	 * Constructor
	 */
	public ListController() {
		logger.debug("Create ListController");
	}
	
	@RequestMapping(value = "/pageView/bibleListKor.do")
	public ModelAndView bibleListKor(HttpSession session) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();
		
		result = listService.bibleList();
		
		result.setViewName("bibleListKor");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/bibleListEng.do")
	public ModelAndView bibleListEng(HttpSession session) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();
		
		result = listService.bibleList();
		
		result.setViewName("bibleListEng");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/bibleListKEng.do")
	public ModelAndView bibleListKEng(HttpSession session) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();
		
		result = listService.bibleList();
		
		result.setViewName("bibleListKEng");
		
		return result;
	}
	
	@RequestMapping(value = "/pageView/bibleNumList.do")
	public ModelAndView bibleNumList(@RequestParam("type") String type, @RequestParam("number") int number) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();
		
		result = listService.bibleNumList(number);
		
		result.addObject("type",type);
		
		result.setViewName("bibleNumList");
		
		return result;
	}
	
	
}
