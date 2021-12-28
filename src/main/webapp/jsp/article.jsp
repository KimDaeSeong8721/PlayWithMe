<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<link href="/term/css/bodyStyle.css?after" rel="stylesheet" type="text/css">


<!-- 서브메뉴 콘테이너 -->
<jsp:include page="submenu.jsp"/>

<%
	  request.setCharacterEncoding("UTF-8");
	  String boardcode = "0";
	  String boardpagecode ="1";
	  String articleid = "-1";
	  

	  if (request.getAttribute("boardcode") == null)
		  boardcode="0";
	  else
		  boardcode = (String)request.getAttribute("boardcode");
		
	  if (request.getAttribute("boardpagecode") == null)
		  boardpagecode="1";
	  else
		  boardpagecode = (String)request.getAttribute("boardpagecode");
	  
	  if (session.getAttribute("articleid") == null)
		  articleid="-1";
	  else
		  articleid = (String)session.getAttribute("articleid");
	  
	  
	  
	  request.setAttribute("boardcode",boardcode);
	  request.setAttribute("boardpagecode",boardpagecode);
	  session.setAttribute("articleid",articleid);
	  
	  
	
%>



<script type="text/javascript">


function callarticleModify() {

	//글쓰기 버튼 숨기고
	var btn = document.getElementById('toggle');
	btn.style.display='none';
	
	//글쓰기 창 띄움 
	var btn = document.getElementById('writebox');
	btn.style.display='block';
}


function callarticleDelete() {


	isInit = confirm("게시글을 삭제 하시겠습니까?");
	if(isInit)
	{

	window.location.href = '/term/jsp/deleteArticle.jsp';
	}
}



function callcommentDelete(com_id,com_order,com_depth) {
		//console.log(com_id,com_order,com_depth);
		isInit = confirm("댓글을 삭제 하시겠습니까?");
			if(isInit)
			{

			window.location.href = '/term/jsp/deleteComment.jsp?com_id=' +com_id +'&com_order=' + com_order+'&com_depth=' + com_depth;
			}
	}
function callcommentWrite() {
 

	 
	 if(document.forms["writecomment"]["com_content"].value == "")
		{
			alert('내용을 입력해주세요.');
			return;
		 }
		document.writecomment.submit();

	}

	
	

	
function callchildcommentWrite(commentID) {
	console.log(commentID)
	console.log(document.forms[commentID]["com_content"].value);
	if(document.forms[commentID]["com_content"].value == "")
	{
		alert('내용을 입력해주세요.');
		return;
	 }
	document.forms[commentID].submit();
	
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

						<jsp:include page="/jsp/getArticle.jsp"/>
						
						<div class="comments" style="display: block;">
						<jsp:include page="/jsp/getComments.jsp"/>
						
						
						

								
							</div>
							
						</div>
						
					

				</div>
			</div>



		</div>
		<jsp:include page="rightPanel.jsp"/>

	</div>
</div>