<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
	  <link href="/term/css/Style2.css" rel="stylesheet" type="text/css">
	  
	  <%
	  String pagename = (String)request.getAttribute("pagename");
	  if (pagename == null)
		  pagename="board";
	  
		String id = (String)session.getAttribute("id");
		String nickname = (String)session.getAttribute("nickname");
		
		if(id==null)
		 id ="null";

	  %>

	  
	<div id="nav" style="width:100%;height:80px">
		<!--<div id="menuall"
			style="background-size: contain; position: fixed;">-->
			<!-- 메뉴 콘테이너 -->
			<div id="menucon">

			<!-- <div id="menu" style="width:100%;">
				
					로고 콘테이너 -->
					
					<div id="menu_logocon">
						
						<a href="http://localhost:8082/term/"> <img
							class="menu_logo_img" src="/term/images/logo.svg"
							style="
										width: 50px;
										height: 50px;
										margin: 0 0px 0px 0;
										
										">

							<span>PlayWithMe</span>
						</a>
						<!-- <div style="width: 300px;">	
							</div>-->
					</div>
					<!-- 메뉴 버튼  -->
					<div id="menu_btn" class="menu_btn">
						<ul class="menu_btn_ctl">
						
					<script type="text/javascript">
						var pagelist= [['board','/term/','게시판'], ['sudoku','/term/sudoku.jsp','스도쿠'],['msudoku','/term/msudoku.jsp','멀티 스도쿠'],
							['nemo','/term/nemo.jsp','네모네모로직'],['rank','/term/rank.jsp','순위'],['findfriend','/term/findfriend.jsp','친구찾기'],['findparty','/term/findparty.jsp','파티찾기']]; 
							for(var i=0; i<pagelist.length; i++)
							{
								
								if(pagelist[i][0] == '<%= pagename %>')
									document.write('<li class="active"><a href="'+ pagelist[i][1] + '"><span>'+ pagelist[i][2] +'</span></a></li>')
								else
									document.write('<li><a href="'+ pagelist[i][1] + '"><span>'+ pagelist[i][2] +'</span></a></li>')

							}
					</script>
			</ul>
					</div>
					<!-- 메뉴 오른쪽  -->
					<div id="menu_right">
						<ul>
									
							<%
							if(id!="null")
							{
								out.println("<li><a href=''><span>내정보</span></a></li>");
								out.println("<li><a href='/term/user/logout.jsp'><span>로그아웃</span></a></li>");
							}
							else
							{
								out.println("<li><a href='/term/user/login.jsp'><span>로그인</span></a></li>");
								out.println("<li><a href='/term/user/login.jsp?att=register'><span>회원가입</span></a></li>");
							}
							
							%>
	
						</ul>
					</div>

					
				</div>
			<!--</div>
			 메뉴 콘테이너 -->

			<div style="position:absolute;left:-20px;top:-20px"></div>
								</div>
					
			
		
	</div>