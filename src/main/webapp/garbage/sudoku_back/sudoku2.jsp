<!DOCTYPE html>
<html lang="en">
<link rel="stylesheet" href="./css/style.css">


<head>
	<title>Sudoku</title>
</head>
<body>
<script defer type="text/javascript" src="./js/sudoku_module.js"></script> 
<div class="import">
	<input type="text" name="import_string" value="080100007000070960026900130000290304960000082502047000013009840097020000600003070" />
	<br />
	<button id="import">Import</button>
	<!--
	<button id="solve">Solve</button>
	<input type="checkbox" value="1" name="hints" /> Show Hints
	-->
</div>

<table class="sudoku">
	<tbody>
	<tr class="1">
		<td class="1"><table class="innertable"><tr><td></td></tr></table><input type="text" maxlength="1" /></td>
		<td class="2"><input type="text" maxlength="1" /></td>
		<td class="3 thick_right"><input type="text" maxlength="1" /></td>
		<td class="4"><input type="text" maxlength="1" /></td>
		<td class="5"><input type="text" maxlength="1" /></td>
		<td class="6 thick_right"><input type="text" maxlength="1" /></td>
		<td class="7"><input type="text" maxlength="1" /></td>
		<td class="8"><input type="text" maxlength="1" /></td>
		<td class="9"><input type="text" maxlength="1" /></td>
	</tr>
	<tr class="2">
		<td class="1"><input type="text" maxlength="1" /></td>
		<td class="2"><input type="text" maxlength="1" /></td>
		<td class="3 thick_right"><input type="text" maxlength="1" /></td>
		<td class="4"><input type="text" maxlength="1" /></td>
		<td class="5"><input type="text" maxlength="1" /></td>
		<td class="6 thick_right"><input type="text" maxlength="1" /></td>
		<td class="7"><input type="text" maxlength="1" /></td>
		<td class="8"><input type="text" maxlength="1" /></td>
		<td class="9"><input type="text" maxlength="1" /></td>
	</tr>
	<tr class="3 thick_bottom">
		<td class="1"><input type="text" maxlength="1" /></td>
		<td class="2"><input type="text" maxlength="1" /></td>
		<td class="3 thick_right"><input type="text" maxlength="1" /></td>
		<td class="4"><input type="text" maxlength="1" /></td>
		<td class="5"><input type="text" maxlength="1" /></td>
		<td class="6 thick_right"><input type="text" maxlength="1" /></td>
		<td class="7"><input type="text" maxlength="1" /></td>
		<td class="8"><input type="text" maxlength="1" /></td>
		<td class="9"><input type="text" maxlength="1" /></td>
	</tr>
	<tr class="4">
		<td class="1"><input type="text" maxlength="1" /></td>
		<td class="2"><input type="text" maxlength="1" /></td>
		<td class="3 thick_right"><input type="text" maxlength="1" /></td>
		<td class="4"><input type="text" maxlength="1" /></td>
		<td class="5"><input type="text" maxlength="1" /></td>
		<td class="6 thick_right"><input type="text" maxlength="1" /></td>
		<td class="7"><input type="text" maxlength="1" /></td>
		<td class="8"><input type="text" maxlength="1" /></td>
		<td class="9"><input type="text" maxlength="1" /></td>
	</tr>
	<tr class="5">
		<td class="1"><input type="text" maxlength="1" /></td>
		<td class="2"><input type="text" maxlength="1" /></td>
		<td class="3 thick_right"><input type="text" maxlength="1" /></td>
		<td class="4"><input type="text" maxlength="1" /></td>
		<td class="5"><input type="text" maxlength="1" /></td>
		<td class="6 thick_right"><input type="text" maxlength="1" /></td>
		<td class="7"><input type="text" maxlength="1" /></td>
		<td class="8"><input type="text" maxlength="1" /></td>
		<td class="9"><input type="text" maxlength="1" /></td>
	</tr>
	<tr class="6 thick_bottom">
		<td class="1"><input type="text" maxlength="1" /></td>
		<td class="2"><input type="text" maxlength="1" /></td>
		<td class="3 thick_right"><input type="text" maxlength="1" /></td>
		<td class="4"><input type="text" maxlength="1" /></td>
		<td class="5"><input type="text" maxlength="1" /></td>
		<td class="6 thick_right"><input type="text" maxlength="1" /></td>
		<td class="7"><input type="text" maxlength="1" /></td>
		<td class="8"><input type="text" maxlength="1" /></td>
		<td class="9"><input type="text" maxlength="1" /></td>
	</tr>
	<tr class="7">
		<td class="1"><input type="text" maxlength="1" /></td>
		<td class="2"><input type="text" maxlength="1" /></td>
		<td class="3 thick_right"><input type="text" maxlength="1" /></td>
		<td class="4"><input type="text" maxlength="1" /></td>
		<td class="5"><input type="text" maxlength="1" /></td>
		<td class="6 thick_right"><input type="text" maxlength="1" /></td>
		<td class="7"><input type="text" maxlength="1" /></td>
		<td class="8"><input type="text" maxlength="1" /></td>
		<td class="9"><input type="text" maxlength="1" /></td>
	</tr>
	<tr class="8">
		<td class="1"><input type="text" maxlength="1" /></td>
		<td class="2"><input type="text" maxlength="1" /></td>
		<td class="3 thick_right"><input type="text" maxlength="1" /></td>
		<td class="4"><input type="text" maxlength="1" /></td>
		<td class="5"><input type="text" maxlength="1" /></td>
		<td class="6 thick_right"><input type="text" maxlength="1" /></td>
		<td class="7"><input type="text" maxlength="1" /></td>
		<td class="8"><input type="text" maxlength="1" /></td>
		<td class="9"><input type="text" maxlength="1" /></td>
	</tr>
	<tr class="9">
		<td class="1"><input type="text" maxlength="1" /></td>
		<td class="2"><input type="text" maxlength="1" /></td>
		<td class="3 thick_right"><input type="text" maxlength="1" /></td>
		<td class="4"><input type="text" maxlength="1" /></td>
		<td class="5"><input type="text" maxlength="1" /></td>
		<td class="6 thick_right"><input type="text" maxlength="1" /></td>
		<td class="7"><input type="text" maxlength="1" /></td>
		<td class="8"><input type="text" maxlength="1" /></td>
		<td class="9"><input type="text" maxlength="1" /></td>
	</tr>
	</tbody>
</table>
</body>
</html>