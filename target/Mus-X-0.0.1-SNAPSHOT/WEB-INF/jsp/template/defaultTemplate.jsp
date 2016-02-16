<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<tiles:insertAttribute name="header" />
</head>
<body>
	<div id="wrap">   
		<div id="header">
			<tiles:insertAttribute name="top" />
		</div>
		<div id="container">
			<tiles:insertAttribute name="body" />
		</div>
		<tiles:insertAttribute name="dialog" />
		<tiles:insertAttribute name="command" />
	</div>
</body>
</html>