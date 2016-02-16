<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tiles:insertAttribute name="header" />
</head>
<body class="bgType01">
	<div class="mainWrap">
		<h1 class="logo">
			<img src="<spring:url value="/resources/images/logo_kai.png" />"
				alt="Kai Talk 관리자 페이지 " />
		</h1>
		<div class="alertBox">
			<span> 통신에 오류가 발생했습니다.<br /> 잠시 뒤 다시 시도해주세오
			</span>
		</div>
		<div class="footCopy">
			<img src="<spring:url value="/resources/images/copy_main.png" />"
				alt="ⓒ 2012 DUZON NEXT. All RIGHT RESERVED" />
		</div>
	</div>
</body>
</html>