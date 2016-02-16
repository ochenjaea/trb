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
			<div class="content-primary">
				<ul data-role="listview">
					<li><a href="#" onclick="bibleListKor()">한글 성경(개역개정) <img src="<spring:url value="/resources/images/kor.gif" />" class="ui-li-icon"></a></li>
					<li><a href="#" onclick="bibleListEng()">영어 성경(NIV) <img src="<spring:url value="/resources/images/us.png" />" class="ui-li-icon"></a></li>
					<li><a href="#" onclick="bibleListKEng()">한영 성경(개역개정/NIV) <img src="<spring:url value="/resources/images/koreng.png" />" class="ui-li-icon" style="height: 11px;width: 16px;"></a></li>
				</ul>
			</div>
		</div>
	</div>
		
