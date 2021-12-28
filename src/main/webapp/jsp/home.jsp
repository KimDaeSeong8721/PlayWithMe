<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<link href="/term/css/bodyStyle.css" rel="stylesheet" type="text/css">

	<%
	//서브메뉴 설정
	request.setAttribute("boardcode","-1");
	request.setAttribute("logState","0");
	%>

<!-- 서브메뉴 콘테이너 -->
<jsp:include page="submenu.jsp"/>



<div id="body" class="community">
	<div id="container" class="community">
		<div class="leftside">

		</div>
		<div class="wrap">
			<div class="banner">
			<div class="banner-wrap">
			<a href="/term/findparty.jsp">
			<img class="banner"src="/term/images/banner.png"/>
			</a>
			</div>
			</div>
			<div class="main">
			<jsp:include page="/jsp/getHomeArticles.jsp"/>

			<br>
			</div>
		</div>
		<jsp:include page="/jsp/rightPanel.jsp"/>
	</div>

</div>
body
