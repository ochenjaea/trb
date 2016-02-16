<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<script type="text/javascript">
<!--
	$(document).ready(function() {
		
		
	});
//-->
</script>
${type}
<c:choose>
	<c:when test="${type=='kor'}">
	<div data-role = "page" id="home" data-theme="a">
		<div data-role="header" data-theme="a">
		<a href="#" data-role="button" data-rel="back" data-icon="arrow-l">뒤로</a>
			<h1>선택</h1>
		<a href="#" onclick="home()" data-icon="home">홈</a>
		</div>
		<div data-role="content">
			<div style="font-size:20px;color:black;font-weight:bold;">${human}</div>
			<div class="ui-grid-d" style="">
				<c:forEach var ="i" begin = "1" end="${numberCount}">
					<c:choose>
						<c:when test="${i%5==1}"><div class="ui-block-a"><a href="#" onclick="korContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==2}"><div class="ui-block-b"><a href="#" onclick="korContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==3}"><div class="ui-block-c"><a href="#" onclick="korContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==4}"><div class="ui-block-d"><a href="#" onclick="korContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==0}"><div class="ui-block-e"><a href="#" onclick="korContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					</c:choose>
			    </c:forEach>
			</div>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='eng'}">
	<div data-role = "page" id="home" data-theme="a">
		<div data-role="header" data-theme="a">
		<a href="#" data-role="button" data-rel="back" data-icon="arrow-l">Back</a>
			<h1>Select</h1>
		<a href="#" onclick="home()" data-icon="home">Home</a>
		</div>
		<div data-role="content">
			<div style="font-size:20px;color:black;font-weight:bold;">${osis_eng}</div>
			<div class="ui-grid-d" style="">
				<c:forEach var ="i" begin = "1" end="${numberCount}">
					<c:choose>
						<c:when test="${i%5==1}"><div class="ui-block-a"><a href="#" onclick="engContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==2}"><div class="ui-block-b"><a href="#" onclick="engContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==3}"><div class="ui-block-c"><a href="#" onclick="engContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==4}"><div class="ui-block-d"><a href="#" onclick="engContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==0}"><div class="ui-block-e"><a href="#" onclick="engContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					</c:choose>
			    </c:forEach>
			</div>
		</div>
	</div>
	</c:when>
	<c:when test="${type=='keng'}">
	<div data-role = "page" id="home" data-theme="a">
		<div data-role="header" data-theme="a">
		<a href="#" data-role="button" data-rel="back" data-icon="arrow-l">Back</a>
			<h1>선택(Select)</h1>
		<a href="#" onclick="home()" data-icon="home">Home</a>
		</div>
		<div data-role="content">
			<div style="font-size:20px;color:black;font-weight:bold;">${human}(${osis_eng})</div>
			<div class="ui-grid-d" style="">
				<c:forEach var ="i" begin = "1" end="${numberCount}">
					<c:choose>
						<c:when test="${i%5==1}"><div class="ui-block-a"><a href="#" onclick="kengContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==2}"><div class="ui-block-b"><a href="#" onclick="kengContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==3}"><div class="ui-block-c"><a href="#" onclick="kengContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==4}"><div class="ui-block-d"><a href="#" onclick="kengContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					    <c:when test="${i%5==0}"><div class="ui-block-e"><a href="#" onclick="kengContent('${osis}',${i})" ><div class="ui-bar ui-bar-a" style="height:30px;">${i}</div></a></div></c:when>
					</c:choose>
			    </c:forEach>
			</div>
		</div>
	</div>
	</c:when>


</c:choose>
