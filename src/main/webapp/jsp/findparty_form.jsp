<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<link href="/term/css/bodyStyle.css" rel="stylesheet" type="text/css">


<script type="text/javascript">
	function callwriteForm() {

		//글쓰기 버튼 숨기고
		var btn = document.getElementById('writeArticleButton');
		btn.style.display = 'none';

		//글쓰기 창 띄움 
		var btn = document.getElementById('writebox');
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
							<a href="/term/board"> 파티 찾기 페이지 </a>
						</h1>
					</div>

				
			<div id="mselect" style="width:100%">
				<div id="selectcon">

					<div class="group"><ul class="board">
							<li class="select"><a href="/term/"><span>전체</span></a></li>
									<li><a href="../../name"><span>어몽어스</span></a></li>
									<li><a href="../../name_enter"><span>멀티 스도쿠</span></a></li>
									<li><a href="../../name_beauty"><span>네모네모로직</span></a></li>
									<li><a href="../../market"><span>순위</span></a></li>
									<li><a href="../../writing"><span>친구찾기</span></a></li>
									<li><a href="../../writing"><span>파티찾기</span></a></li>
							</ul>
					</div>
				</div>
				</div>
			</div>
			</div>
		</div>
		<jsp:include page="rightPanel.jsp"/>
	</div>
</div>
body
