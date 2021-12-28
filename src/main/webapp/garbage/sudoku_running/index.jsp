<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="Style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<jsp:include page="./top.jsp"/>

	<div id="index_container">hello</div>
	
<script type="text/javascript" src="./js/sudoku_module2.js"></script> 
<div id='sudoku'>
<div id='banner'>
<span id='big'>Free Sudoku Solver!</span>
<span id='small'>Solves even the most difficult puzzles and provides optional hints as a training aid.</span>
</div>

<div id='main'>
<table>
<tr>
<td>
	<canvas id='canvas1' width='543' height='543'>Canvas is not supported by this browser.</canvas>
</td>
<td>
	<canvas id='canvas2' width='541' height='543' title="Click here to set the currently selected digit">Canvas is not supported by this browser.</canvas>
</td>	
</tr>
</table>



<script type="text/javascript" src="./js/sudoku_canvas2.js?var=2"></script> 
<script type="text/javascript" src="./js/sudoku_controlpanel_canvas.js?var=2"></script> 

</div>

</div>
	
	
</body>
</html>