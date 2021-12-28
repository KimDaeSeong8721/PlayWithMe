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
							
							
							
						
								document.write('<a href="/term/board/my/p/1"' +'>');
								document.write('내가 쓴 글보기');
								
							
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

						
						
						<jsp:include page="/jsp/getMyArticles.jsp"/>
						
						


		</div>
		<jsp:include page="rightPanel.jsp"/>

	</div>
	body