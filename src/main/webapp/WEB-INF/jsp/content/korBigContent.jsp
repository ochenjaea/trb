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
			<a href="#" onclick = "bibleNumListKor(${number})" data-role="button" data-icon="arrow-l">뒤로</a>
			<div id="footselect" data-theme="c">
				<select name="selectList" id="selectList" onchange="bibleNumListKor(this.value);">
					<option value="999">${human}</option>
					<option value="999">====================</option>
					<c:forEach items="${bibleListKorListMap}" var="bibleList">
						<option value="${bibleList.number}">${bibleList.human}</option>
					</c:forEach>
				</select>
			</div>
			<a href="#menu" data-rel="popup" data-inline="true" data-mini="true" data-icon="bars" data-transition="slide" data-position-to="window" data-role="button">메뉴</a>
		</div>
		
		<div data-role="content">
			<input type="hidden" id="losis" value="${now_osis}">
			<input type="hidden" id="lchap" value="${now_chap}">
			<input type="hidden" id="ltype" value="kor">
			<div style="font-size:25px;color:black;">${human}</div>
		
			<span class="content-font" style="float:left;color:black;font-size:25px;"> 
				<c:forEach items="${contntKor}" var="content" varStatus="status">
					<div>${content.html}</div>
				</c:forEach>
			</span>
			<div style="float:left;">
				<div data-role="controlgroup" data-type="horizontal">
					<c:if test= "${pre_osis != '0'}">
					<a href="#" onclick ="korBigContent('${pre_osis}',${pre_chap})" data-role="button" data-icon="arrow-l" data-iconpos="left" data-inline="true">이전</a>
					</c:if>
				
					<c:if test= "${next_osis != '0'}">
					<a href="#" onclick ="korBigContent('${next_osis}',${next_chap})"  data-role="button" data-icon="arrow-r" data-iconpos="right" data-inline="true">다음</a>
					</c:if>
				</div>
			</div>
		</div>
		<div data-role="popup" id="menu" data-position="right" data-display="overlay">
			<ul data-role="listview" data-theme="d" data-icon="false">
	            <li data-icon="home" data-mini="true"><a href="#" onclick="home()" >홈</a></li>
				<li data-icon="minus" data-mini="true"><a href="#" onclick = "korContent('${now_osis}',${now_chap})" >축소</a></li>
			    <li data-icon="gear" data-mini="true"><a href="#" onclick="engBigContent('${now_osis}',${now_chap})"  >영어</a></li>
			    <li data-icon="star" data-mini="true"><a href="#" onclick="kengBigContent('${now_osis}',${now_chap})" >한영</a></li>
			    <li data-icon="search" data-mini="true"><a href="#" onclick="word()">검색</a></li>
			    <c:if test= "${pre_osis != '0'}">
				<li data-icon="arrow-l" data-mini="true"><a href="#" onclick ="korBigContent('${pre_osis}',${pre_chap})" >이전</a></li>
				</c:if>
			
				<c:if test= "${next_osis != '0'}">
				<li data-icon="arrow-r" data-mini="true"><a href="#" onclick ="korBigContent('${next_osis}',${next_chap})"  >다음</a></li>
				</c:if>
	        </ul>
		</div>
	</div>
		
		
	
