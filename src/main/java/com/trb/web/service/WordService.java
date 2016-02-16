package com.trb.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

/**
 * 기본 서비스 기능 모음
 * @author semoria
 *
 */
@Service
public class WordService extends AbstractService {
	private static Logger logger = Logger.getLogger(WordService.class);
	
	public WordService() {
		logger.debug("Create WordService");
	}
	
	
	public ModelAndView  wordSearch(String word){
		ModelAndView result = new ModelAndView();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("WORD", word);
		 

		List<Map<String, Object>> listMap = this.commonDao.selectToListMap("com.trb.content.word", paramMap);
		
//		List<Map<String, Object>> countMap = this.commonDao.selectToListMap("com.trb.content.count", paramMap);
		
		
		
		result.addObject("wordList",listMap);
	//	result.addObject("countList",countMap);
		
		return result; 
	}
	
}
