package com.trb.web.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestAttributes;

import com.trb.common.constant.ServiceConstant;
import com.trb.web.model.ServiceContext;
import com.trb.web.service.handler.ServiceHandler;

/**
 * 서비스 분배
 * @author semoria
 *
 */
@Service
public class ServiceDispatchImpl implements ServiceDispatch {
	private static Logger logger = Logger.getLogger(ServiceDispatchImpl.class);
	private Map<String, ServiceHandler> handlerMap;
	
	@Autowired
	private DefaultService defaultService;	
	
	/**
	 * Constructor
	 */
	public ServiceDispatchImpl() {
		logger.debug("Create ServiceDispatch");
	}
	
	@Transactional(readOnly = false, rollbackFor = Exception.class, isolation = Isolation.READ_COMMITTED)
	public void dispatch(ServiceContext context) {
		for(Map<String, Object> serviceParam : context.getParamList()) {
			String action = serviceParam.get(ServiceConstant.SERVICE_ACTION).toString();
			
			logger.debug("Action name : " + serviceParam);
			
			ServiceHandler handler = this.handlerMap.get(action);
			if(handler == null) {
				logger.error(action + " 핸들러를 찾을수 없음");
				return;
			}
			
			// 로케일 저장
			serviceParam.put("currentLocale", context.getRequest().getAttribute("currentLocale", RequestAttributes.SCOPE_GLOBAL_SESSION));
			
			Object user = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
				
			
			Object obj = handler.handle(serviceParam);
			
			
			// 일반적인 액션 수행결과
	
				String responseName = serviceParam.get(ServiceConstant.SERVICE_RESPONSENAME).toString();
				context.putRequestObj(responseName, obj);
			
		}
	}

	@PostConstruct
	public void init() throws Exception {
		handlerMap = new HashMap<String, ServiceHandler>();
		handlerMap.put(ServiceConstant.SELECT, new ServiceHandler() {
			public Object handle(Map<String, Object> param) {
				return defaultService.select(param);
			}
		});
		handlerMap.put(ServiceConstant.LIST, new ServiceHandler() {
			public Object handle(Map<String, Object> param) {
				return defaultService.list(param);
			}
		});
		handlerMap.put(ServiceConstant.INSERT, new ServiceHandler() {
			public Object handle(Map<String, Object> param) {
				return defaultService.insert(param);
			}
		});
		handlerMap.put(ServiceConstant.UPDATE, new ServiceHandler() {
			public Object handle(Map<String, Object> param) {
				return defaultService.update(param);
			}
		});
		handlerMap.put(ServiceConstant.DELETE, new ServiceHandler() {
			public Object handle(Map<String, Object> param) {
				return defaultService.delete(param);
			}
		});
		
	}

	@PreDestroy
	public void destroy() throws Exception {
		
	}
}
