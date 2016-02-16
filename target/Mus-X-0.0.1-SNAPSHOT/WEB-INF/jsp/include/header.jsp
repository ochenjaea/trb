<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<%@ include file="/WEB-INF/jsp/include/taglib.jsp" %>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript" />
<meta http-equiv="Content-Style-Type" content="text/css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>MUX-X_AMDIN</title>
<script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=false"></script>
<!-- jQuery -->
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery-1.8.2.min.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery-ui-1.9.1.custom.js"/>"></script>

<script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>
<script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script>

<!-- <script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery.jqGrid.src.js"/>"></script> -->

<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery.contextmenu.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery.form.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery.json-2.2.min.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery.jstree.js"/>"></script>

<!--  
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/colResizable-1.3.min.js" />"></script>
-->
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/colResizable-1.3.source.js" />"></script>

<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery.sha256.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery.i18n.properties-min-1.0.9.js" />"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/jquery/jquery.selectbox-0.2.min.js" />"></script>

<!-- 중간에 있는 이유 : common쪽에서 사용하는 변수들이 존재함 -->
<script type="text/javascript">
	var contextPath = "${pageContext.request.contextPath}";
	var pageName = '${pageName}';
	var subPageName = '${subPageName}';
	var deepPageName = '${deepPageName}';
	
	var gridPath = '<spring:url value="/grid/gridList.do?ACTION=" />';
	var gridEditPath = '<spring:url value="/gridEdit/" />';
	var currentLocale = '${currentLocale}';
	
	/* 나중에 추가되여야 할 변수 */
	//var admEmail = 'admin@galimit.com';
	//var admSiteCode = '1234';
</script>

<script type="text/javascript" src="<spring:url value="/resources/js/com/ahnlab/amc/common/prototype.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/com/ahnlab/amc/common/namespace.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/com/ahnlab/amc/common/code.js"/>"></script>

<script type="text/javascript" src="<spring:url value="/resources/js/com/ahnlab/amc/common/common.grid.js"/>"></script>

<script type="text/javascript" src="<spring:url value="/resources/js/com/ahnlab/amc/common/common.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/com/ahnlab/amc/common/util.js"/>"></script>
<script type="text/javascript" src="<spring:url value="/resources/js/com/ahnlab/amc/common/validator.js"/>"></script>

<link href="<spring:url value="/resources/css/jquery.contextmenu.css"/>" rel="stylesheet" />
<link href="<spring:url value="/resources/css/jquery-ui-1.9.1.custom.css"/>" rel="stylesheet" />
<!-- <link href="<spring:url value="/resources/css/ui.jqgrid.css"/>" rel="stylesheet" />  -->
<link href="<spring:url value="/resources/css/style.css"/>" rel="stylesheet" />
<!--[if IE 9 ]><link type="text/css" rel="stylesheet" href="<spring:url value="/resources/css/style_ie9.css"/>" /><![endif]-->
</head>
