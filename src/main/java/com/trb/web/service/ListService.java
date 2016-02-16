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
public class ListService extends AbstractService {
	private static Logger logger = Logger.getLogger(ListService.class);
	
	public ListService() {
		logger.debug("Create ListService");
	}
	
	
	public ModelAndView  bibleList(){
		ModelAndView result = new ModelAndView();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		

		List<Map<String, Object>> listMap = this.commonDao.selectToListMap("com.trb.list.bibleList", paramMap);

		result.addObject("bibleListKorListMap",listMap);
		
		
		return result; 
	}
	
	
	public ModelAndView  bibleNumList(int number){
		ModelAndView result = new ModelAndView();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("NUMBER",number);
		

		Map<String, Object> resultMap = this.commonDao.selectToMap("com.trb.list.bibleNumList", paramMap);

		int total = Integer.parseInt(resultMap.get("chapters").toString());
		String osis = resultMap.get("osis").toString();
		
		
		result.addObject("human",resultMap.get("human"));
		result.addObject("osis_eng",resultMap.get("osis_eng"));
		result.addObject("numberCount",total);
		result.addObject("osis",osis);
		
		
		return result; 
	}
}
