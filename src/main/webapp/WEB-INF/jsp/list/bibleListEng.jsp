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
			<a href="#" data-role="button" data-rel="back" data-icon="arrow-l">Back</a>
				<h1>Select</h1>
			<a href="#" onclick="home()" data-icon="home">Home</a>
			</div>
			<div data-role="content">
		
				<div data-role="collapsible-set" data-theme="a" data-content-theme="a">
					<div data-role="collapsible" data-collapsed="true">
						<h3>Old Testament</h3>
						<ul data-role="listview" data-filter="true" data-inset="true">
							<c:forEach items="${bibleListKorListMap}" var="list" begin="0" end="38">
								<li><a href="#" onclick = "bibleNumListEng(${list.number})"> ${list.osis_eng} : ${list.osis} <span class="ui-li-count">${list.chapters}</span></a></li>
							</c:forEach>
						</ul>
					</div>
					
					<div data-role="collapsible">
						<h3>New Testament</h3>
						<ul data-role="listview" data-filter="true" data-inset="true">
							<c:forEach items="${bibleListKorListMap}" var="list" begin="39" end="65">
								<li><a href="#" onclick = "bibleNumListEng(${list.number})"> ${list.osis_eng} : ${list.osis} <span class="ui-li-count">${list.chapters}</span></a></li>
							</c:forEach>
						</ul>
					</div>							
				</div>
			</div>
		</div>
		
