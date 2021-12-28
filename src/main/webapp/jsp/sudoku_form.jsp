<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<link href="/term/css/bodyStyle.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="./style3.css">

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
							<a > 스도쿠 페이지 </a>
						</h1>
					</div>

				</div>
			
			<script type="text/javascript" src="/term/js/sudoku_module.js"></script>

			<table style="width:600px;">

				<tr>
					<td >
						<canvas id='canvas1' width='458' height='490'>Canvas is not supported by this browser.</canvas>
					</td>

					
					<td >
						<canvas id='canvas2' width='317' height='490'
							title="Click here to set the currently selected digit">Canvas is not supported by this browser.</canvas>
					</td>
				</tr>
			</table>
		</div>
	<script type="text/javascript" src="/term/js/sudoku_create.js?var=3" charset="utf-8"></script> 		
	<script type="text/javascript" src="/term/js/sudoku_canvas.js?var=2" charset="utf-8"></script> 
	<script type="text/javascript" src="/term/js/sudoku_controlpanel_canvas.js?var=2" charset="utf-8"></script> 

	
	</div>
	<jsp:include page="rightPanel.jsp"/>
	</div>
</div>
body
