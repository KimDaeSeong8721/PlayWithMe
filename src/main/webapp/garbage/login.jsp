<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PlayWithMe</title>
<link href="/term/css/login.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html;charset=utf-8">

	  
	  <%
	  String att = request.getParameter("att");
	  if (att == null)
		  att="null";
	  %>
<script>


	function goToRegister() {
		document.getElementById('register').style.display = 'block';
	}
</script>

</head>

</body>

<div class="content">
	<div class="logocon">
		<a href="http://localhost:8082/term/"> <div class="logocon-wrap"><img class="logo_img"
			src="/term/images/logo.svg"
			style="width: 70px;height: 70px;margin: 0 0 0 0;">
			<div class="title"><p>PlayWithMe</p></div></div>
		</a>


	</div>
	<hr>
	<div align="center">커뮤니티에서 활동하기 위해 로그인하세요.</div>
	<br />
	<form action="loginCheck.jsp" method="post" accept-charset="utf-8">
		<input type="text" name="id" align="right" placeholder="아이디"><br />
		<input type="password" name="pw" placeholder="패스워드"><br /> <input
			type="submit" class="login" value="로그인">
		<p class="register">
			회원이 아니신가요? <a href="javascript:goToRegister()">회원가입</a>
		</p>

	</form>
</div>
<!-- Button to open the modal -->


<!-- register -->
<div id="register" class="modal" name="form " method="post">
	<form class="modal-content" action="register.jsp" accept-charset="utf-8">
		<p class="modal-register">
			<span
				onclick="document.getElementById('register').style.display='none'"
				class="close" title="Close Modal">X</span>
		</p>
		<div class="container">
			<h1>회원가입</h1>
			<p>회원가입을 위한 정보를 입력해주세요</p>
			<hr>
			<label for="id"><b>아이디</b></label> <input type="text"
				placeholder="아이디 입력하기" name="id" required> <label
				for="nickname"><b>닉네임</b></label> <input type="text"
				placeholder="닉네임 입력하기" name="nickname" required> <label
				for="pw"><b>비밀번호</b></label> <input type="password"
				placeholder="Enter Password" name="pw" required>


			<div class="clearfix">
				<button type="submit" class="signup">회원가입</button>
			</div>
		</div>
	</form>
</div>

<% 

if(session.getAttribute("isID") == null){
  
} else if ((boolean)session.getAttribute("isID") == true){
	%>
<script>
	document.getElementById('register').style.display = 'block';
	alert("sign up failed")
</script>
<% 
} else{
 
   %>
<script>
	alert("sign up success")
</script>
<% 
}
session.setAttribute("isID", null);

%>

<script>
	if('register'=='<%=att%>')
		document.getElementById('register').style.display = 'block';
</script>
</body>
</html>