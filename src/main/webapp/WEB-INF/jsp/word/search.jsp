<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<script type="text/javascript">
<!--
	$(document).ready(function() {
		
		
	});
//-->
</script>

	<div data-role = "page" id="home" data-theme="a">
		<div data-role="header" data-theme="a">
			<a href="#" data-role="button" data-rel="back" data-icon="arrow-l">뒤로</a>
				<h1>선택</h1>
			<a href="#" onclick = "home()" data-icon="home">홈</a>
		</div>
		<div data-role="content">
			<input type="search" data-mini="true" name="search" id="search" value="">
		</div>
	</div>
		
