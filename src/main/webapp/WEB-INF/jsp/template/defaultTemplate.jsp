<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tiles:insertAttribute name="header" />
</head>
<body>

	<div id="wrap">
		<div class="content_box">

			<!-- //navi -->
			<div class="body">
				
				<tiles:insertAttribute name="body" />
			</div>

			<!-- //content -->
		</div>
	</div>
</body>
</html>