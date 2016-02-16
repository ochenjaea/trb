package com.trb.web.controller;

import java.io.FileOutputStream;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.trb.web.service.MainService;
import com.trb.web.service.ServiceDispatch;


/**
 * 기본 Controller
 * @author semoria
 *
 */
@Controller
public class MainController extends AbstractController {
	//private static Logger logger = Logger.getLogger(MainController.class);
	private static Logger logger = Logger.getLogger(MainController.class);
	private FileOutputStream fos;
	@Autowired
	private ServiceDispatch serviceDispatch;
	
	@Autowired
	private MainService mainService;

	/**
	 * Constructor
	 */
	public MainController() {
		logger.debug("Create MainController");
	}
	
	@RequestMapping(value = "/pageView/main.do")
	public ModelAndView getMain(HttpSession session,HttpServletRequest request) throws UnsupportedEncodingException{

		ModelAndView result = new ModelAndView();

		result.setViewName("main");
		
		return result;
	}
}
