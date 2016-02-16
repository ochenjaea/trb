<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<script type="text/javascript">
<!--
	
//-->
</script>
<div data-role = "page" id="home" data-theme="a" class="background-gradient">
			<div data-role="header" data-theme="a">
				<h1>SNS 공유</h1>
			</div>
			
			<div data-role="content" >	
				<div>
				 ${data.human} ${chapter}:${ver}
				</div>
				<div>${data.unformatted}</div>
				<br>
				<div>
					<span><img src="<spring:url value="/resources/images/kakao.png" />" onclick="executeURLLink('${data.human}','${chapter}:${ver}','${data.unformatted}')" style="height:30px; width:30px;"></span>
					<span><img src="<spring:url value="/resources/images/ico_story.png" />" onclick="executeKakaoStoryLink('${data.human}','${chapter}:${ver}','${data.unformatted}')" style="height:28px; width:28px;"></span>
					<span><img src="<spring:url value="/resources/images/facebook.png" />" onclick="publishStory('${data.human}','${chapter}:${ver}','${data.unformatted}',${startNum},${endNum},'${type}')" style="height:28px; width:28px;"></span>
				</div>
			</div>
		</div>
</body>
		
	
