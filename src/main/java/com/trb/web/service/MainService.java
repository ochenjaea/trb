package com.trb.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.trb.common.constant.ServiceConstant;

/**
 * 기본 서비스 기능 모음
 * @author semoria
 *
 */
@Service
public class MainService extends AbstractService {
	private static Logger logger = Logger.getLogger(MainService.class);
	
	public MainService() {
		logger.debug("Create MainService");
	}
	
	
	public ModelAndView  mainService(){
		ModelAndView result = new ModelAndView();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		

		List<Map<String, Object>> listMap = this.commonDao.selectToListMap("com.trb.test.test", paramMap);

		result.addObject("listMap",listMap);
		
		
		return result; 
	}
}
