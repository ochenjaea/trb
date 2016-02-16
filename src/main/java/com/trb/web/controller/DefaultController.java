package com.trb.web.controller;

import java.io.FileOutputStream;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.HandlerMapping;
import org.springframework.web.servlet.ModelAndView;

import com.trb.common.util.WebUtil;
import com.trb.web.model.ServiceContext;
import com.trb.web.service.ServiceDispatch;


/**
 * 기본 Controller
 * @author semoria
 *
 */
@Controller
public class DefaultController extends AbstractController {
	//private static Logger logger = Logger.getLogger(DefaultController.class);
	private static Logger logger = Logger.getLogger(DefaultController.class);
	private FileOutputStream fos;
	@Autowired
	private ServiceDispatch serviceDispatch;
	

	/**
	 * Constructor
	 */
	public DefaultController() {
		logger.debug("Create DefaultController");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/pageView/**", method=RequestMethod.GET)
	public ModelAndView pageView(HttpSession session, HttpServletRequest request, ModelMap modelMap) {
		String restOfTheUrl = (String) request.getAttribute(HandlerMapping.PATH_WITHIN_HANDLER_MAPPING_ATTRIBUTE);
		ModelAndView mav = WebUtil.getModelAndView(restOfTheUrl);
		Enumeration<String> names = request.getParameterNames();
		
		// 이전 페이지에서 던진 파라미터 넣기
		while(names.hasMoreElements()) {
			String name = names.nextElement();
			mav.addObject(name, request.getParameter(name));
		}
		
		logger.debug(restOfTheUrl);


		return mav;
	}
	/**
	 * 일반적인 Ajax 호출 
	 * @param request
	 * @param params
	 * @param serviceName
	 * @return
	 */
	@RequestMapping(value="/ajax/{ajaxType}.do")
	public @ResponseBody Object ajax(WebRequest request, @RequestBody List<Map<String, Object>> params, @PathVariable("ajaxType") String serviceName) {
		ServiceContext context = this.preExecute(request, params);
		
		logger.debug("Ajax parameter : " + context.getParamList());
		this.serviceDispatch.dispatch(context);
		return context.getReturnObj();
	}
	
	@RequestMapping(value="/ajax/getName.do")
	public @ResponseBody Object getNameAjax() {
		String username = null;
			Object obj = SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			if (obj instanceof UserDetails) {
				username = ((UserDetails) obj).getUsername();
			} else {
				username = obj.toString();
			}
		return username;
	}
}
