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
			<span>
				<input type="search" data-mini="true" name="search" id="search" value="${word}" onkeypress="checkEnter(event.keyCode);">
			</span>
			
			<div>
			<ol data-role="listview" data-inset="true" data-theme="a" >
				<c:forEach items="${wordList}" var="word" varStatus="status">
				<c:if test="${status.count}">
				<li data-role="list-divider">${word.book}</li>
				</c:if>
			    <li>
			 
			    <a href="#" onclick='korContent("${word.book}",${fn:substring(word.verse,0,fn:indexOf(word.verse, "."))})'>
			        <h2>${word.human}  ${fn:substring(word.verse,0,fn:indexOf(word.verse, "."))}장</h2>
			        <p>${word.html}</p></a>
			    </li>
			    </c:forEach>
			</ol>		
			</div>
		</div>
		
	</div>
		
