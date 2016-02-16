<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<script type="text/javascript">
<!--
$(document).ready(function() {
	
});
//-->
</script>

	<div data-role="page" data-theme="a">
		<div data-role="header">
			<a href="#" onclick = "bibleNumListEng(${number})" data-role="button" data-icon="arrow-l">Back</a>
			<div id="footselect" data-theme="c">
				<select name="selectList" id="selectList" onchange="bibleNumListEng(this.value);">
					<option value="999">${osis}</option>
					<option value="999">====================</option>
					<c:forEach items="${bibleListKorListMap}" var="bibleList">
						<option value="${bibleList.number}">${bibleList.osis_eng}</option>
					</c:forEach>
				</select>
			</div>
			<a href="#menu" data-rel="popup" data-inline="true" data-mini="true" data-icon="bars" data-transition="slide" data-position-to="window" data-role="button">Menu</a>
		</div>
		
		<div data-role="content">
			<input type="hidden" id="losis" value="${now_osis}">
			<input type="hidden" id="lchap" value="${now_chap}">
			<input type="hidden" id="ltype" value="eng">
			<div style="font-size:25px;color:black;">${osis}</div>
			
			<span class="content-font" style="float:left;color:black;font-size:25px;"> 
				<c:forEach items="${contntKor}" var="content" varStatus="status">
					<div>${content.html_eng}</div>
				</c:forEach>
			</span>
			<div style="float:left;">
				<div data-role="controlgroup" data-type="horizontal">
					<c:if test= "${pre_osis != '0'}">
					<a href="#" onclick ="engBigContent('${pre_osis}',${pre_chap})" data-role="button" data-icon="arrow-l" data-iconpos="left" data-inline="true">이전</a>
					</c:if>
				
					<c:if test= "${next_osis != '0'}">
					<a href="#" onclick ="engBigContent('${next_osis}',${next_chap})"  data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="true">다음</a>
					</c:if>
				</div>
			</div>
		</div>
		<div data-role="popup" id="menu" data-position="right" data-display="overlay">
				<ul data-role="listview" data-theme="d" data-icon="false">
				  	<li data-icon="home" data-mini="true"><a href="#" onclick="home()">Home</a></li>
				    <li data-icon="minus" data-mini="true"><a href="#" onclick = "engContent('${now_osis}',${now_chap})">Expand</a></li>
				    <li data-icon="gear" data-mini="true"><a href="#" onclick="korBigContent('${now_osis}',${now_chap})">KOR</a></li>
				    <li data-icon="star" data-mini="true"><a href="#" onclick="kengBigContent('${now_osis}',${now_chap})">KOR/ENG</a></li>
				    <li data-icon="search" data-mini="true"><a href="#" onclick="word()">Search</a></li>
				    <c:if test= "${pre_osis != '0'}">
					<li data-icon="arrow-l" data-mini="true"><a href="#" onclick ="engBigContent('${pre_osis}',${pre_chap})">Prev</a></li>
					</c:if>
				
					<c:if test= "${next_osis != '0'}">
					<li data-icon="arrow-r" data-mini="true"><a href="#" onclick ="engBigContent('${next_osis}',${next_chap})">Next</a></li>
					</c:if>
				</ul>
			</div>
	</div>
		
