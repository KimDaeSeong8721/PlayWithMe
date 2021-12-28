<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<link href="/term/css/bodyStyle.css" rel="stylesheet" type="text/css">

<%
	  String boardcode = (String)request.getAttribute("boardcode");
	  if (boardcode == null)
		  boardcode="0";
%>

<!-- 서브메뉴 콘테이너 -->
<div id="submenu" style="width:100%">
	<div id="submenucon">

		<div class="group">
			
			<script type="text/javascript">		
			 //이거 지시문으로 다시 써야겟음 
			if ('<%= boardcode %>' != '-1')
				document.write('<ul class="board">');
			else	
				document.write('<ul>');
			
						
						var boardlist= [['0','자유게시판'], ['1','스도쿠게시판'],['2','보드게임 게시판'],
							['3','라이어게임 게시판'],['4','마피아게시판'],['5','어몽어스게시판']]; 
							for(var i=0; i<boardlist.length; i++)
							{
		
								if(boardlist[i][0] == '<%= boardcode %>')
								{

									document.write('<li class="select">');
								}
								else
									document.write('<li>');
								
								document.write('<a href="/term/board/'+
										boardlist[i][0]+
										'"><div><p>'+
										boardlist[i][1]+'</p></div></a></li>');	
							}
							
				</script> 
			</ul>
		</div>
	</div>

</div>


					