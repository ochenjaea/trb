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
import com.trb.web.service.WordService;


/**
 * 기본 Controller
 * @author semoria
 *
 */
@Controller
public class WordController extends AbstractController {
	//private static Logger logger = Logger.getLogger(ContentController.class);
	private static Logger logger = Logger.getLogger(WordController.class);
	
	private ServiceDispatch serviceDispatch;
	
	@Autowired
	private WordService wordService;

	/**
	 * Constructor
	 */
	public WordController() {
		logger.debug("Create ContentController");
	}
	
	
	@RequestMapping(value = "/pageView/word.do")
	public ModelAndView korContent(HttpServletResponse response, HttpServletRequest request, @RequestParam(value = "word", required = false) String word) throws UnsupportedEncodingException{
		
		ModelAndView result = new ModelAndView();
		
		logger.debug(word);
		if(word != null){
			result = wordService.wordSearch(word);
		}
		result.addObject("word",word);
		
		result.setViewName("word");
		
		return result;
	}
	

}
