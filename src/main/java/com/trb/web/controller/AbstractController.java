package com.trb.web.controller;

import java.util.List;
import java.util.Map;

import org.springframework.web.context.request.WebRequest;

import com.trb.common.converter.ParametersConverter;
import com.trb.web.model.ServiceContext;

/**
 * 추상화 컨트롤러
 * @author semoria
 *
 */
public abstract class AbstractController {	

	/**
	 * 
	 * @param request
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected ServiceContext preExecute(WebRequest request) {
		 ServiceContext serviceContext = new ServiceContext();
		 serviceContext.setRequest(request);
	        
		 serviceContext.addParam(ParametersConverter.convertObject(request.getParameterMap()));
	        
		 return serviceContext;
	}
		
	/**
	 * 
	 * @param request
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected ServiceContext preExecute(WebRequest request, Map<String, Object> param) {
        ServiceContext serviceContext = new ServiceContext();
        serviceContext.setRequest(request);
        
        serviceContext.addParam(ParametersConverter.convertObject(param));
        
        return serviceContext;
    }
	
	/**
	 * 
	 * @param request
	 * @param params
	 * @return
	 */
	@SuppressWarnings("unchecked")
	protected ServiceContext preExecute(WebRequest request, List<Map<String, Object>> params) {
        ServiceContext serviceContext = new ServiceContext();
        serviceContext.setRequest(request);
        
        for(Map<String, Object> map : params) {
        	serviceContext.addParam(ParametersConverter.convertObject(map));
        }
        
        return serviceContext;
    }
}
