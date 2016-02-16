package com.trb.web.service;

import java.util.ArrayList;
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
public class ContentService extends AbstractService {
	private static Logger logger = Logger.getLogger(ContentService.class);
	
	public ContentService() {
		logger.debug("Create ContentService");
	}
	
	
	public ModelAndView  korContent(String chapter, 
			String osis,
			String page,
			HttpServletResponse response, 
			HttpServletRequest request){
		ModelAndView result = new ModelAndView();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		if(page == null){
			String verse = chapter+"."; 
			paramMap.put("VERSE", verse); 
			
			
			paramMap.put("OSIS", osis+"."+chapter);
		}else{
			
			List<Object> indexArray = new ArrayList<Object>();
			int index = page.indexOf("!");
			int start = Integer.parseInt(page.substring(0,index));
			int end = Integer.parseInt(page.substring(index+1,page.length()));
			
			for(int i=start;i<=end;i++){
				indexArray.add(i);
			}
			paramMap.put("LIST", indexArray);
		}
		
		paramMap.put("BOOK", osis);
		 

		List<Map<String, Object>> listMap = this.commonDao.selectToListMap("com.trb.content.content", paramMap);
		
		chapter = listMap.get(0).get("verse").toString();
		int indexOf = chapter.indexOf(".");
		
		paramMap.put("BOOK", listMap.get(0).get("book"));
		
		
		paramMap.put("OSIS", listMap.get(0).get("book")+"."+chapter.substring(0,indexOf));
		
		Map<String, Object> resultMap = this.commonDao.selectToMap("com.trb.content.prenext", paramMap);
		Map<String, Object> numberMap = this.commonDao.selectToMap("com.trb.content.checkosis", paramMap);
		
		List<Map<String, Object>> booklistMap = this.commonDao.selectToListMap("com.trb.list.bibleList", paramMap);

		result.addObject("bibleListKorListMap",booklistMap);
	
		int size = listMap.size();

		result.addObject("startNum",listMap.get(0).get("id"));
		result.addObject("endNum",listMap.get(size-1).get("id"));
		
		result.addObject("number",numberMap.get("number"));
		result.addObject("contntKor",listMap);
		result.addObject("human",resultMap.get("human"));
		result.addObject("pre_osis",0);
		result.addObject("pre_chap",0);
		result.addObject("next_osis",0);
		result.addObject("next_chap",0);
		
		result.addObject("now_chap",chapter.substring(0,indexOf));
		
		osis = listMap.get(0).get("book").toString();
		result.addObject("now_osis",osis);
		
		if(!(osis.equals("Gen") && chapter.equals("1.001"))){
			int pre_index = resultMap.get("pre_osis").toString().indexOf(".");
			
			String pre_osis = resultMap.get("pre_osis").toString().substring(0,pre_index);
			
			String pre_chap = resultMap.get("pre_osis").toString().substring(pre_index+1,resultMap.get("pre_osis").toString().length());
		
			result.addObject("pre_osis",pre_osis);
			result.addObject("pre_chap",pre_chap);
		}
		
		if(!(osis.equals("Rev") && chapter.equals("22.001"))){
			int next_index = resultMap.get("next_osis").toString().indexOf(".");
			
			String next_osis = resultMap.get("next_osis").toString().substring(0,next_index);
			
			String next_chap = resultMap.get("next_osis").toString().substring(next_index+1,resultMap.get("next_osis").toString().length());
		
			result.addObject("next_osis",next_osis);
			result.addObject("next_chap",next_chap);
		} 
		return result; 
	}
	
	public ModelAndView engContent(String chapter, 
			String osis,
			String page,
			HttpServletResponse response, 
			HttpServletRequest request){
		ModelAndView result = new ModelAndView();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		if(page == null){
			String verse = chapter+"."; 
			paramMap.put("VERSE", verse); 
			
			
			paramMap.put("OSIS", osis+"."+chapter);
		}else{
			
			List<Object> indexArray = new ArrayList<Object>();
			int index = page.indexOf("!");
			int start = Integer.parseInt(page.substring(0,index));
			int end = Integer.parseInt(page.substring(index+1,page.length()));
			
			for(int i=start;i<=end;i++){
				indexArray.add(i);
			}
			paramMap.put("LIST", indexArray);
		}
		 
		paramMap.put("BOOK", osis);

		List<Map<String, Object>> listMap = this.commonDao.selectToListMap("com.trb.content.content", paramMap);
		
		chapter = listMap.get(0).get("verse").toString();
		int indexOf = chapter.indexOf(".");
		
		paramMap.put("BOOK", listMap.get(0).get("book"));
		
		
		paramMap.put("OSIS", listMap.get(0).get("book")+"."+chapter.substring(0,indexOf));
		
		Map<String, Object> resultMap = this.commonDao.selectToMap("com.trb.content.prenext", paramMap);
		Map<String, Object> numberMap = this.commonDao.selectToMap("com.trb.content.checkosis", paramMap);
		
		List<Map<String, Object>> booklistMap = this.commonDao.selectToListMap("com.trb.list.bibleList", paramMap);

		result.addObject("bibleListKorListMap",booklistMap);
		
		int size = listMap.size();

		result.addObject("startNum",listMap.get(0).get("id"));
		result.addObject("endNum",listMap.get(size-1).get("id"));

		result.addObject("number",numberMap.get("number"));
		result.addObject("contntKor",listMap);
		result.addObject("osis",resultMap.get("osis"));
		result.addObject("pre_osis",0);
		result.addObject("pre_chap",0);
		result.addObject("next_osis",0);
		result.addObject("next_chap",0);		
		
		result.addObject("now_chap",chapter.substring(0,indexOf));
		
		osis = listMap.get(0).get("book").toString();
		result.addObject("now_osis",osis);
		
		
		if(!(osis.equals("Gen") && chapter.equals("1.001"))){
			int pre_index = resultMap.get("pre_osis").toString().indexOf(".");
			
			String pre_osis = resultMap.get("pre_osis").toString().substring(0,pre_index);
			
			String pre_chap = resultMap.get("pre_osis").toString().substring(pre_index+1,resultMap.get("pre_osis").toString().length());
		
			result.addObject("pre_osis",pre_osis);
			result.addObject("pre_chap",pre_chap);
		}
		
		if(!(osis.equals("Rev") && chapter.equals("22.001"))){
			int next_index = resultMap.get("next_osis").toString().indexOf(".");
			
			String next_osis = resultMap.get("next_osis").toString().substring(0,next_index);
			
			String next_chap = resultMap.get("next_osis").toString().substring(next_index+1,resultMap.get("next_osis").toString().length());
		
			result.addObject("next_osis",next_osis);
			result.addObject("next_chap",next_chap);
		} 
		return result; 
	}
	
	public ModelAndView kengContent(String chapter, String osis, HttpServletResponse response, HttpServletRequest request){
		ModelAndView result = new ModelAndView();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		String verse = chapter+"."; 
		paramMap.put("VERSE", verse); 
		paramMap.put("BOOK", osis);
		
		paramMap.put("OSIS", osis+"."+chapter);
		 

		List<Map<String, Object>> listMap = this.commonDao.selectToListMap("com.trb.content.content", paramMap);
		Map<String, Object> resultMap = this.commonDao.selectToMap("com.trb.content.prenext", paramMap);
		Map<String, Object> numberMap = this.commonDao.selectToMap("com.trb.content.checkosis", paramMap);
		
		List<Map<String, Object>> booklistMap = this.commonDao.selectToListMap("com.trb.list.bibleList", paramMap);

		result.addObject("bibleListKorListMap",booklistMap);

		result.addObject("number",numberMap.get("number"));
		result.addObject("contntKor",listMap);
		result.addObject("human",resultMap.get("human"));
		result.addObject("osis",resultMap.get("osis"));
		result.addObject("pre_osis",0);
		result.addObject("pre_chap",0);
		result.addObject("next_osis",0);
		result.addObject("next_chap",0);
		result.addObject("now_osis",osis);
		result.addObject("now_chap",chapter);
		
		chapter = listMap.get(0).get("verse").toString();
		
		if(!(osis.equals("Gen") && chapter.equals("1.001"))){
			int pre_index = resultMap.get("pre_osis").toString().indexOf(".");
			
			String pre_osis = resultMap.get("pre_osis").toString().substring(0,pre_index);
			
			String pre_chap = resultMap.get("pre_osis").toString().substring(pre_index+1,resultMap.get("pre_osis").toString().length());
		
			result.addObject("pre_osis",pre_osis);
			result.addObject("pre_chap",pre_chap);
		}
		
		if(!(osis.equals("Rev") && chapter.equals("22"))){
			int next_index = resultMap.get("next_osis").toString().indexOf(".");
			
			String next_osis = resultMap.get("next_osis").toString().substring(0,next_index);
			
			String next_chap = resultMap.get("next_osis").toString().substring(next_index+1,resultMap.get("next_osis").toString().length());
		
			result.addObject("next_osis",next_osis);
			result.addObject("next_chap",next_chap);
		} 
		return result; 
	}
	
	
	public ModelAndView  korPopup(String bookid){
		ModelAndView result = new ModelAndView();
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("ID", bookid);
		
		Map<String, Object> resultMap = this.commonDao.selectToMap("com.trb.content.korpop", paramMap);
		
		int index = resultMap.get("verse").toString().indexOf(".");
		String chapter = resultMap.get("verse").toString().substring(0,index);
		int ver = Integer.parseInt(resultMap.get("verse").toString().substring(index+1,resultMap.get("verse").toString().length()));
		
		result.addObject("chapter",chapter);
		result.addObject("ver",ver);
		result.addObject("data",resultMap);
		
		return result; 
	}
	
}
