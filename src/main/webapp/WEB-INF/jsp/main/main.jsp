<meta name=”apple-mobile-web-app-capable” content=”yes” />
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<script type="text/javascript">



(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = "//connect.facebook.net/ko_KR/all.js#xfbml=1&appId=448318655211968";
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>

	<div data-role = "page" id="home" data-theme="a">
			<div data-role="header" data-theme="a">
				<h1>TR Bible</h1>
			</div>
			<input type="hidden" id="warning" value="${warning}">
			<div data-role="content" align="center" >	
			
				<div class="ui-grid-b">
					<div class="ui-block-a">
						<div class = "grid-a">
							<a href="#" onclick="listLng()">
								<img src="<spring:url value="/resources/images/book.png" />" style="width:84px; height:84px;">
								<span class="icon-label">일반 보기</span>
							</a>
						</div>
					</div>
					 <div class="ui-block-b">
						<div class="grid-b">
							<a href="#" onclick="load()">
								<img src="<spring:url value="/resources/images/letter.png" />" style="width:84px; height:84px;">
								<span class="icon-label">최근 읽은</span>
							</a>
						</div>
					</div>
					<div class="ui-block-c">
						<div class="grid-c">
							<a href="#" onclick="etc()">
								<img src="<spring:url value="/resources/images/music.png" />" style="width:84px; height:84px;">
								<span class="icon-label">부 록</span>
							</a>
						</div>
					</div>
					 
					<div class="ui-block-c">
						<div class="grid-c">
							<a href="#" onclick="word()">
								<img src="<spring:url value="/resources/images/dod.png" />" style="width:84px; height:84px;">
								<span class="icon-label">단어 검색</span>
							</a>
						</div>
					</div>
					<!--<div class="ui-block-a">
						<div class="grid-a">	
							<a href="javascript:moverandom()">
								<img src="<spring:url value="/resources/images/4.png" />" style="width:84px; height:84px;">
								<span class="icon-label">랜덤 말씀</span>
							</a>
						</div>
					</div>
					<div class="ui-block-b">
						<div class = "grid-b">
							<a href="javascript:movetoday()">
								<img src="<spring:url value="/resources/images/5.png" />" style="width:84px; height:84px;">
								<span class="icon-label">오늘 말씀</span>
							</a>
						</div>
					</div> -->
					
				</div>
				<div style=""><div id="fb-root" style="width:350px;"></div><div class="fb-like" data-href="http://TRB" data-send="false" data-width="450" data-height="400" data-show-faces="true" style="height:450px;margin-top: 50px;"></div></div>
			</div>
			
		</div>
