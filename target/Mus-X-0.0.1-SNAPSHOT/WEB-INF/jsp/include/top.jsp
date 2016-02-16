<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<script type="text/javascript">
<!--
	var siteCode = '<sec:authentication htmlEscape="false" property="principal.siteCode"/>';
	var adminEmail = '<sec:authentication htmlEscape="false" property="principal.adminEmail"/>';
	
	var code = new com.ahnlab.amc.common.Code();
	$(document).ready(function() {
		// 로그아웃 다이얼로그
		$("#logoutButton").click(function(event) {
			$("#dialogModel_logout").dialog({
				width: 300,
				height: 160,
				resizable: false,
				modal: true
			});
		});
		// 로그아웃
		$("#logout_confirmButton").click(function(event) {
			window.location = '<spring:url value="/j_spring_security_logout"/>';
		});
		
		$("#link_help_guide").click(function(event) {
			$("#popupHelpGuide").dialog({
				width: 640,
				height: 650,
				resizable: false,
				modal: true
			});
		});
		
		$("#link_help").click(function(event) {
			var kr_url = "http://www.ahnlab.com/redir/037/webhelp_admin.rdir?locale=ko_kr";
			var en_url = "http://www.ahnlab.com/redir/037/webhelp_admin.rdir?locale=en_us";
			
			if(currentLocale == "ko") {
				window.open(kr_url, 'help', 'width=600, height=500, scrollbars=yes, location=yes');
			}else if(currentLocale == "en") {
				window.open(en_url, 'help', 'width=600, height=500, scrollbars=yes, location=yes');
			}
		});
		
		$("#link_help_product").click(function(event) {
			if(currentLocale == "ko") {
				$("#text_help_lang").html($.i18n.prop("SUPPORT_TXT04", $.i18n.prop("LOGIN_CMB01")));
			}else if(currentLocale == "en") {
				$("#text_help_lang").html($.i18n.prop("SUPPORT_TXT04", $.i18n.prop("LOGIN_CMB02")));
			}
			
			var productVersion = '${productVersion}';
			var serverVersion = '${serverVersion}';
			
			$("#text_help_product_ver").html($.i18n.prop("SUPPORT_TXT01"));
			$("#text_help_server_ver").html($.i18n.prop("SUPPORT_TXT02", productVersion));
			$("#text_help_product_no").html($.i18n.prop("SUPPORT_TXT03", serverVersion));
			
			$("#popupHelpProduct").dialog({
				width: 450, height: 290, resizable: false, modal: true
			});

		});
	});
//-->
</script>
<!-- header -->
<p class="logo">
	<img src="<spring:url value="/resources/images/common/logo.gif"/>"
		alt="AhnLab Mobile Center" />
</p>
<div class="util">
	<div class="login-state">
		<span class="user"><sec:authentication htmlEscape="false" property="principal.adminName"/> </span> <a href="#" class="button small" id="logoutButton"><span><spring:message code="COM_BTN_LOGOUT"/></span></a>
	</div>
	<ul>
		<li class="first"><a href="<spring:url value="/pageView/setting/adminlist.do"/>"><spring:message code="GNB_MNU11"/></a></li>
		<li><a href="#"><spring:message code="GNB_MNU12"/></a></li>
		<li class="support"><a href="#"><spring:message code="GNB_MNU13"/></a>
			<ul>
				<li><a href="#" id="link_help_guide"><spring:message code="GNB_MNU131"/></a></li>
				<li><a href="#" id="link_help"><spring:message code="GNB_MNU132"/></a></li>
				<li class="last" id="link_help_product"><a href="#"><spring:message code="GNB_MNU133"/></a></li>
			</ul></li>
	</ul>
</div>
<!-- nav -->
<div class="nav">
	<div class="bg-nav-sub"></div>
	<ul>
		<li class="first" id="mainMenu"><a href="<spring:url value="/pageView/main.do"/>" class="headlink"><span><spring:message code="GNB_MNU00"/></span></a></li>
		<li id="monitorMenu"><a href="<spring:url value="/pageView/monitor/device/connect.do"/>" class="headlink"><span><spring:message code="GNB_MNU01"/></span></a>
			<ul class="nav-sub1">
				<li id="deviceSubMenu" class="first"><a href="<spring:url value="/pageView/monitor/device/connect.do"/>"><spring:message code="GNB_MNU011"/></a></li>
				<li id="lostSubMenu"><a href="<spring:url value="/pageView/monitor/lost/device.do"/>"><spring:message code="GNB_MNU012"/></a></li>
				<li id="manageSubMenu"><a href="<spring:url value="/pageView/monitor/manage/essential.do"/>"><spring:message code="GNB_MNU013"/></a></li>
				<li id="v3SubMenu"><a href="<spring:url value="/pageView/monitor/v3/infection.do"/>"><spring:message code="GNB_MNU014"/></a></li>
				<li id="messageSubMenu"><a href="<spring:url value="/pageView/monitor/message.do"/>"><spring:message code="GNB_MNU015"/></a></li>
			</ul>
		</li>
		<li id="mobileMenu"><a href="<spring:url value="/pageView/mobile/mobilelist.do"/>" class="headlink"><span><spring:message code="GNB_MNU02"/></span></a>
			<ul class="nav-sub2">
				<li id="mobilelistSubMenu" class="first"><a href="<spring:url value="/pageView/mobile/mobilelist.do"/>"><spring:message code="GNB_MNU021"/></a></li>
				<li id="requestlistSubMenu"><a href="<spring:url value="/pageView/mobile/requestlist.do"/>"><spring:message code="GNB_MNU022"/></a></li>
			</ul>
		</li>
		<li id="userMenu"><a href="<spring:url value="/pageView/user/list.do"/>" class="headlink"><span><spring:message code="GNB_MNU03"/></span></a></li>
		<li id="policyMenu"><a href="<spring:url value="/pageView/policy/list.do"/>" class="headlink"><span><spring:message code="GNB_MNU04"/></span></a></li>
		<li id="manageMenu"><a href="<spring:url value="/pageView/manage/lost.do"/>" class="headlink"><span><spring:message code="GNB_MNU05"/></span></a>
			<ul class="nav-sub5">
				<li id="lostSubMenu" class="first"><a href="<spring:url value="/pageView/manage/lost.do"/>"><spring:message code="GNB_MNU051"/></a></li>
				<li id="autoSubMenu"><a href="<spring:url value="/pageView/manage/auto.do"/>"><spring:message code="GNB_MNU052"/></a></li>
				<li id="appSubMenu"><a href="<spring:url value="/pageView/manage/app.do"/>"><spring:message code="GNB_MNU053"/></a></li>
				<li id="noticeSubMenu"><a href="<spring:url value="/pageView/manage/notice.do"/>"><spring:message code="GNB_MNU054"/></a></li>
				<li id="lineSubMenu"><a href="<spring:url value="/pageView/manage/call.do"/>"><spring:message code="GNB_MNU055"/></a></li>
			</ul></li>
	</ul>
</div>
<!-- /nav -->

<div id="dialogModel_logout" title="AhnLab Mobile Center" style="display:none;">
	<p class="modal-alert-logout"><spring:message code="LOGOUT_DES01"/></p>
	<div class="modal-button">
		<a href="#" class="button" id="logout_confirmButton"><span><spring:message code="COM_BTN_YES"/></span></a>
		<a href="#" class="button close"><span><spring:message code="COM_BTN_NO"/></span></a>
	</div>
</div>

<!-- 도움말>제품 정보 -->
<div id="popupHelpProduct" title="<spring:message code="SUPPORT_TTL01" /> - AhnLab Mobile Center" style="display: none;">
	<dl class="modal-product-info">
		<dt><spring:message code="SUPPORT_TTL01" /></dt>
		<dd><font id="text_help_product_ver"></font></dd>
		<dd><font id="text_help_server_ver"></font></dd>
		<dd><font id="text_help_lang"></font></dd>
		<dd><font id="text_help_product_no"></font></dd>
	</dl>
	<div class="modal-button">
		<a href="#" class="button contents close"><span><spring:message code="COM_BTN_OK" /></span></a>
	</div>
</div>

<!-- 도움말>초기 설정 가이드 -->
<div id="popupHelpGuide" title="초기 설정 가이드 - AhnLab Mobile Center" style="display: none;">
	<div class="modal-config-guide">
		<h1>AhnLab Mobile Center 서비스를 이용해주셔서 감사합니다.</h1>
		<dl class="step1">
			<dt>조직/사용자<br />가져오기</dt>
			<dd>
				<p class="text">조직도, 사용자, 단말기 목록을 포함한 Sample을 다운로드하여 수정 후<br />사용자관리에서 업로드 할 수 있습니다.</p>
				<div class="mb10"><a href="#" class="button"><span>Sample Download</span></a></div>
				<a href="#" class="link">사용자관리로 이동</a>
			</dd>
		</dl>
		<dl class="step2">
			<dt>정책관리</dt>
			<dd>
				<p class="text">귀사의 보안 강도에 맞는 정책을 직접 설정하세요.<br />기본으로 default 정책이 설정되어 있으니 참고하세요.</p>
				<a href="#" class="link">정책관리로 이동</a>
			</dd>
		</dl>
		<dl class="step3">
			<dt>Agent<br />설치유도</dt>
			<dd>
				<p class="text">Agent 설치를 위한 간단 매뉴얼 샘플을 받아보세요.</p>
				<a href="#" class="button"><span>Simple Agent Install manual Download</span></a>
			</dd>
		</dl>
		<p class="help">※ 이 가이드는 사이트 어디에서든지 서포트&gt;초기설정가이드를 통해 확인하실 수 있습니다.</p>
	</div>
	<div class="modal-button">
		<a href="#" class="button contents close"><span><spring:message code="COM_BTN_CLOSE" /></span></a>
	</div>
</div>
