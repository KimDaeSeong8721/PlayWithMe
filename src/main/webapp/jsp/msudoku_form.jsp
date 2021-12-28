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
							<a href="/term/board"> 멀티 스도쿠 페이지</a>
						</h1>
					</div>

				</div>
			
		
			가장 후순위
			
			</div>


			<script type="text/javascript" src="/term/js/sudoku_canvas.js"></script>
			<script type="text/javascript"
				src="/term/js/sudoku_controlpanel_canvas.js"></script>



		</div>
		<jsp:include page="rightPanel.jsp"/>

	</div>
	body