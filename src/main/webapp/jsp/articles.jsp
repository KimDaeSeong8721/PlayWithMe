<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<link href="/term/css/bodyStyle.css" rel="stylesheet" type="text/css">
<%
	  request.setCharacterEncoding("UTF-8");
	String boardcode ;
	String boardpagecode;
	if (request.getAttribute("boardcode") == null)
		  boardcode="0";
	else
		  boardcode = (String)request.getAttribute("boardcode");
		
	if (request.getAttribute("boardpagecode") == null)
		  boardpagecode="1";
	else
		  boardpagecode = (String)request.getAttribute("boardpagecode");

	  request.setAttribute("boardcode",boardcode);
	  request.setAttribute("boardpagecode",boardpagecode);
	 
%>

<!-- 서브메뉴 콘테이너 -->
<jsp:include page="submenu.jsp"/>

<script type="text/javascript">

	function callwriteForm() {
		
		//글쓰기 버튼 숨기고
		var btn = document.getElementById('writeArticleButton');
		btn.style.display='none';
		
		//글쓰기 창 띄움 
		var btn = document.getElementById('writebox');
		btn.style.display='block';
		
	}
	
</script>

<div id="body" class="board">
	<div id="container" class="board">

		<div class="wrap">
			<div class="main">
				<div class="board">
					<div class="title">
						<h1>
						<script type="text/javascript">	
							
							
							
										
							var boardlist= [['0','자유게시판'], ['1','스도쿠게시판'],['2','자유게임 게시판'],
												['3','라이어게임 게시판'],['4','마피아게시판'],['5','어몽어스게시판']]; 
							var flag = false;
							for(var i=0; i<boardlist.length; i++)
							{
		
								if(boardlist[i][0] == '<%= boardcode %>')
								{
									document.write('<a href="/term/board/"'+boardlist[i][0] +'>');
									document.write(boardlist[i][1]);
									flag=true;
									break;
								}
							}
							if (flag == false)
								{
								document.write('<a href="/term/board/"'+boardlist[0][0] +'>');
								document.write(boardlist[0][1]);
								}
							
							 //이거 지시문으로 다시 써야겟음 
							
							 	function registerPost() {
		

							 	
								 if(document.forms["form"]["article_title"].value == "")
								{
									alert('제목을 입력해주세요.');
									return;
								 }
								 
								 if(document.forms["form"]["article_content"].value == "")
									{
										alert('내용을 입력해주세요.');
										return;
									 }
											document.form.submit();
		
								}
							 </script> 
							
							
							
							
							 </a>
						</h1>
					</div>
					
					<div class="articles">
						<form id="writebox" class="write" name="form" action="/term/jsp/postArticle.jsp" style="display:none;" accept-charset="utf-8">
							<p>
								<input name="article_title" autocomplete="off" placeholder="글 제목"
									class="title">
							</p>
							<p>
								<textarea name="article_content" placeholder="글을 작성해주세요." class="smallplaceholder"></textarea>
							</p>
							<input class="file" type="file" name="file" multiple="multiple">
							<ol class="thumbnails">
								<li class="new"></li>
							</ol>
							<div class="clearBothOnly"></div>

							<ul class="option">
								<li title="첨부" class="attach"></li>
								<li title="완료" class="submit" onclick='registerPost()'></li>	
							</ul>
							<div class="clearBothOnly"></div>
							<input type="hidden" name="board_id" value="<%=boardcode%>">
						</form>

						<a id='writeArticleButton' class='writeArticleButton' onclick='callwriteForm()'>새 글을 작성해주세요!</a>
						
						<jsp:include page="/jsp/getArticles.jsp"/>
						
						


		</div>
		<jsp:include page="rightPanel.jsp"/>

	</div>
	body