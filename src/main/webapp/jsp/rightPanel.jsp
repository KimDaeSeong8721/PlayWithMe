<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<link href="/term/css/bodyStyle.css" rel="stylesheet" type="text/css">
	  <%

		  
		String nickname;
	  	String id;
		int level;
		int exp;
		
	  	if(session.getAttribute("id") != null)
			id = (String)session.getAttribute("id");
	    else
	    	id = "null";
	  	
	  	if(session.getAttribute("nickname") != null)
	  		nickname = (String)session.getAttribute("nickname");
	    else
	    	nickname = "null";
	  	
		if( session.getAttribute("level") != null)
			level = (int)session.getAttribute("level");
		else
			level = 0;
		
		if( session.getAttribute("exp") != null)
			exp = (int)session.getAttribute("exp");
		else
			exp = 0;
		

	  %>
	<div class="rightside">
			<div class="profile">
			
				<% if(id!="null"){ %>
				
				
				<div id="form" class="logged">
					<img src="/term/images/0.png" class="picture">
					<p class="nickname"><%=nickname %></p>
					<p class="level">Level : <%=level %></p>
					<div class="exp_bar">
					<%
					out.println("<div class='filled' style='width:" + exp +"%'></div>");
					%>
					
					</div>
					<ul class="buttons">
						<li><a href="/term/my">내 정보</a></li>
						<li><a href="/term/user/logout.jsp">로그아웃</a></li>
					</ul>
					<hr>
				</div>
				
			<% }else{%>
					<div id="form" class="logged">
					<img src="/term/images/0.png" class="picture">
					<p class="message">커뮤니티 이용을 위해 </br>로그인이 필요합니다!</p>

					<ul class="buttons">
						<li><a href="/term/user/login.jsp">로그인</a></li>
						<li><a href="/term/user/login.jsp?att=register">회원가입</a></li>
					</ul>
					<hr>
				</div>
			
			
			<%}%>
			<script type="text/javascript">	
					function myArticles()
					{
					
							window.location.href = '/term/board/my/p/1';
						
					} 
				
				</script>
			</div>
			<div class="view" onClick="myArticles();")>
			<p>내가 쓴 글보기 </p>
			
			
			</div>
			<div class="view">
			<p>댓글 단 글보기 </p>
			
			
			</div>
		</div>
	
