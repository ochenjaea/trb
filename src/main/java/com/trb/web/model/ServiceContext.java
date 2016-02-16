package com.trb.web.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.context.request.WebRequest;

/**
 * 
 * @author semoria
 *
 */
public class ServiceContext {
	private WebRequest request;
	
	private String serviceType;
	
	private List<Map<String, Object>> paramList;
	
	private Map<String, Object> returnObj;
	
	private Object model;
	
	public ServiceContext() {
		this.paramList = new ArrayList<Map<String, Object>>();
		this.returnObj = new HashMap<String, Object>();
	}
		
	public void setRequest(WebRequest request) {
		this.request = request;
	}
	public WebRequest getRequest() {
		return request;
	}
	
	public void addParam(Map<String, Object> param) {
		this.paramList.add(param);
	}
	
	public void setParamList(List<Map<String, Object>> paramList) {
		this.paramList = paramList;
	}
	public List<Map<String, Object>> getParamList() {
		return paramList;
	}
	
	public Map<String, Object> getReturnObj() {
		return this.returnObj;
	}
	public void putRequestObj(String key, Object obj) {
		this.returnObj.put(key, obj);
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getServiceType() {
		return serviceType;
	}

	public Object getModel() {
		return model;
	}

	public void setModel(Object model) {
		this.model = model;
	}
}
