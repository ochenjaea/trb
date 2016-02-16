<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/include/taglib.jsp"%>
<script type="text/javascript">
<!--
	$(document).ready(function() {
		
		
	});
//-->
</script>

<div data-role="page" data-theme="a" id="demo-page" class="my-page" data-url="demo-page">
    <div data-role="header">
        <h1>News</h1>
        <a href="grid-listview.html" data-shadow="false" data-iconshadow="false" data-icon="arrow-l" data-iconpos="notext" data-rel="back" data-ajax="false">Back</a>
    </div><!-- /header -->
    <div data-role="content">
        <ul data-role="listview" data-inset="true">
         	<c:forEach items="${listMap}" var="list">
         
            <li><a href="#">
             
                <h2>${list.osis}</h2>
              
            </a></li>
           
            </c:forEach>
        </ul>
    </div>
    
    <div data-role="content" id ="test">
    
           </div><!-- /content -->
    <div data-role="footer" data-theme="none">
        <h3>Responsive Grid Listview</h3>
    </div><!-- /footer -->
</div>
