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
		<a href="/term/index.jsp"> <div class="logocon-wrap"><img class="logo_img"
			src="/term/images/logo.svg"
			style="width: 60px;height: 60px;margin: 0 0 0 0;">
			<div class="title"><p>PlayWithMe</p></div></div>
		</a>

	
	
	</div>
	<hr/>
	
	<form action="loginCheck.jsp" method="post">
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
	<form class="modal-content" action="register.jsp">
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
	String logState=(String)session.getAttribute("logState");
	if (logState==null)
		logState="0";
%>

<script type="text/javascript">


var logstate = '<%=logState%>';
//alert(logstate);
</script>

<% 
	session.removeAttribute("logState");
	//session.setAttribute("logState","0");
	
%>
<script type="text/javascript">
//alert(logstate);
	//alert(logstate);
	//
	switch(logstate)
	{
	case '-1':
		document.getElementById('register').style.display = 'block';
		alert("이미 있는 아이디입니다.")
		break;
	case '-2':
		alert("비밀번호를 틀렸습니다.")
		break;	
	case '-3':
		alert("존재하지 않는 아이디입니다.")
		break;	
	case '-4':
		alert("로그인을 먼저 해주세요")
		break;	
	case '1':	
		alert("회원가입 성공했습니다")
		break;
	default:
		
	}
	logstate = '0';

</script>


<script>
	if('register'=='<%=att%>')
		document.getElementById('register').style.display = 'block';
</script>
</body>
</html>