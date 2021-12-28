<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<link href="/term/css/bodyStyle.css?after" rel="stylesheet" type="text/css">


<!-- 서브메뉴 콘테이너 -->
<jsp:include page="submenu.jsp"/>

<%
	  String boardcode = (String)request.getAttribute("boardcode");
	  String boardpagecode = (String)request.getAttribute("boardpagecode");
	  
	  if (boardcode == null)
		  boardcode="0";

	  if (boardpagecode == null)
		  boardpagecode="1";
	  
	  request.setAttribute("boardcode",boardcode);
	  request.setAttribute("boardpagecode",boardpagecode);
	  
%>



<script type="text/javascript">

function callarticleDelete() {
	alert('hello')
	//var btn = document.getElementById(commentID);
	//btn.style.display = 'block';

}
function callarticleModify() {
	alert('aM')
	var btn = document.getElementById(commentID);
	btn.style.display = 'block';

}

function callcommentWrite(commentID) {
	alert('cW')
	var btn = document.getElementById(commentID);
	btn.style.display = 'block';

	}

function callcommentDelete(commentID) {
	alert('cD')
	var btn = document.getElementById(commentID);
	btn.style.display = 'block';

	}
	
function callchildcommentWrite(commentID) {
	alert('ccW')
	var btn = document.getElementById(commentID);
	btn.style.display = 'block';

	}
			
	
function callchildcommentDelete(commentID) {
	alert('ccD')
	var btn = document.getElementById(commentID);
	btn.style.display = 'block';

	}
	

function callwriteForm(commentID) {
	

	//댓글창 띄움 
	var btn = document.getElementById(commentID);
	btn.style.display = 'block';

}



</script>

<div id="body" class="board">
	<div id="container" class="board">

		<div class="wrap">
			<div class="main">
				<div class="board">
					<div class="title">
						<h1>
							<a href="/term/board"> 
								<script type="text/javascript">			
								var boardlist= [['0','자유게시판'], ['1','스도쿠게시판'],['2','자유게임 게시판'],
												['3','라이어게임 게시판'],['4','마피아게시판'],['5','어몽어스게시판']]; 
								for(var i=0; i<boardlist.length; i++)
								{
		
									if(boardlist[i][0] == '<%= boardcode %>')
									{
										document.write(boardlist[i][1]);
									}
								}
							 //이거 지시문으로 다시 써야겟음 
							</script> 


 						</a>
						</h1>
					</div>

					<div class="articles">

						<article class='onBoard'>
							
							<a class="article">
									<ul class="article_top">
										<li class="button">…</li>
										<li class="delete"><span class="article_delete" onclick="callarticleDelete()">삭제</span></li>
										<li class="modify"><span class="article_delete" onclick="callarticleModify()">수정하기</span></li>
										
									</ul>
								<h3 class="title">냉동훈제 연어로 오마카세를 해보자!</h3>
								
								<time>방금</time>
								<hr/>
								<p>게시글 내용임 <br>
								안녕하세요 반가워요<br>
								안녕하세요 반가워요<br>
								안녕하세요 반가워요<br>
								안녕하세요 반가워요
								</p>
								
								<div class="article_bottom">
								
									<ul class="vote">
										<li class="vote-down"><img class="reco" src="/term/images/nonreco.svg"/>3</li>
										<li class="vote-up" ><img class="reco" src="/term/images/reco.svg"/>5</li>
									</ul>
								</div>
							
							</a>
							<div class="writer">
							 <div class="profile">
								<img class="profile" src="/term/images/0.png"
										class="picture medium">
				
								</div>
									<div class="profile-text">
															
									<ul class="profile-top">
										<li class="nickname">닉네임</li>
										<li class="level"> Lv4</li>
									</ul>
									<hr>
									<p class="large">안녕하세요.
									반갑습니다.</p>
							</div>
							</div>
						</article>
						
						
						
						<div class="comments" style="display: block;">

								<article class="parent">
									<div class="profile">
										<img class="profile" src="/term/images/0.png"
										class="picture medium">
				
									</div>
									<div class="comment">
															
									<ul class="comment-top">
										<li class="nickname">닉네임(글쓴이)</li>
										<li class="level"> Lv4</li>
										<li class="time"><time class="medium">44분 전</time></li>
										<li class="button">…</li>
										<li class="delete"><span class="article_delete" onclick="callcommentDelete()">삭제</span></li>
									</ul>
									<hr>
									<p class="large">댓글내용</p>
									
									<ul class="comment-bottom">
										<li class="child-comment" ><a class='child-comment' onclick='callwriteForm("comment-child-0")'>대댓글</a></li>
										<li class="vote-down"><img class="reco" src="/term/images/nonreco.svg"/>3</li>
										<li class="vote-up" ><img class="reco" src="/term/images/reco.svg"/>5</li>

									</ul>
									</div>	
								</article>
									<article class="child">
									<div class="profile">
										<img class="profile" src="https://cf-fpi.everytime.kr/0.png"
										class="picture medium">
		
									</div>
									<div class="comment">
															
									<ul class="comment-top">
										<li class="nickname">닉네임(글쓴이)</li>
										<li class="level"> Lv4</li>
										<li class="time"><time class="medium">44분 전</time></li>
										<li class="button">…</li>
										<li class="delete"><span class="article_delete" onclick="callchildcommentDelete()">삭제</span></li>
									</ul>
									<hr>
									<p class="large">내용내용내용내용내용내용</p>
									
									<ul class="comment-bottom">
										<li class="vote-down"><img class="reco" src="/term/images/nonreco.svg"/>3</li>
										<li class="vote-up" ><img class="reco" src="/term/images/reco.svg"/>5</li>

									</ul>
									</div>	
								</article>
								
								<article id="comment-child-0" class="comment-child" style="display:none">
								<form class="writecomment">
									<input type="text" name="text" maxlength="300"
										autocomplete="off" placeholder="댓글을 입력하세요." class="text">
									<ul class="option">
										
										<li title="완료" class="submit" onclick="callchildcommentWrite()"></li>
									</ul>
									<div class="clearBothOnly"></div>
								</form>
								</article>
								
								
								
								
								<article class="parent">
									<div class="profile">
										<img class="profile" src="https://cf-fpi.everytime.kr/0.png"
										class="picture medium">
		
									</div>
									<div class="comment">
															
									<ul class="comment-top">
										<li class="nickname">닉네임</li>
										<li class="time"><time class="medium">44분 전</time></li>
										<li class="button">버튼</li>
										<li class="delete">삭제</li>
									</ul>
									<hr>
									<p class="large">자기소개용내용내용내</p>
									
									<ul class="comment-bottom">
										<li class="child-comment" >답글</li>
										<li class="vote-down" >붐따</li>
										<li class="vote-up" >하트</li>

									</ul>
									</div>	
								</article>
								
																<article class="parent">
									<div class="profile">
										<img class="profile" src="https://cf-fpi.everytime.kr/0.png"
										class="picture medium">
		
									</div>
									<div class="comment">
															
									<ul class="comment-top">
										<li class="nickname">닉네임</li>
										<li class="time"><time class="medium">44분 전</time></li>
										<li class="button">버튼</li>
										<li class="delete">삭제</li>
									</ul>
									<hr>
									<p class="large">내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용내용</p>
									
									<ul class="comment-bottom">
										<li class="child-comment" >답글</li>
										<li class="vote-down" >붐따</li>
										<li class="vote-up" >하트</li>
;
									</ul>
									</div>	
								</article>

								<article class="comment">
								<form class="writecomment">
									<input type="text" name="text" maxlength="300"
										autocomplete="off" placeholder="댓글을 입력하세요." class="text">
									<ul class="option">
										<li title="완료" class="submit" onclick="callcommentWrite()"></li>
									</ul>
									<div class="clearBothOnly"></div>
								</form>
								</article>
							</div>
							
						</div>
						
					

				</div>
			</div>



		</div>
		<jsp:include page="rightPanel.jsp"/>

	</div>
</div>