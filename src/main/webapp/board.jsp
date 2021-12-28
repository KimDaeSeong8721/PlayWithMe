<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/term/css/Style2.css" rel="stylesheet" type="text/css">
<link href="/term/css/bodyStyle.css" rel="stylesheet" type="text/css">
</head>

	
<body>

	<%
	String boardcode = "0";
	String boardpagecode = "1";
	String articleid = "0";
	String targetPage="/jsp/articles.jsp";
	String mpath = request.getRequestURI();
	String[] mpath_arr= mpath.split("/");
	//게시판인지 게시글인지를 구분해서 불러오는 코드
	if(mpath_arr.length > 4)
	{

		if(mpath_arr[1].equals("term") && mpath_arr[2].equals("board")
				&& mpath_arr[4].equals("v"))
		{
			targetPage="/jsp/article.jsp";
			boardcode= mpath_arr[3]; // 게시글에서 서브메뉴 선택
			
			if(mpath_arr.length > 5)
			{
				articleid = mpath_arr[5];
			
			}
			else
			{
				articleid = "-1";
			}
			
		}//  /term/board/게시판번호/v/게시글번호
		
		
		
		if(mpath_arr[1].equals("term") && mpath_arr[2].equals("board")
				&& mpath_arr[4].equals("p"))
		{
			boardcode= mpath_arr[3]; // 게시판에서 서브메뉴 선택
			if(mpath_arr.length > 5)
				boardpagecode= mpath_arr[5]; // 게시판에서 페이지 번호 설정
		}//  /term/board/게시판번호/p/페이지번호 
	
		
		
	}
	else if(mpath_arr.length > 3)
	{
		if(mpath_arr[1].equals("term") && mpath_arr[2].equals("board"))
		{
			boardcode= mpath_arr[3]; // 게시판에서 서브메뉴 선택
		}
		
	}
	else
	{
		targetPage="/jsp/articles.jsp";
	}

	if (boardcode.equals("my"))
	{
		targetPage="/jsp/myarticles.jsp";
		boardcode="99";
	}
		
	
	request.setAttribute("boardcode",boardcode);
	request.setAttribute("boardpagecode",boardpagecode);
	session.setAttribute("articleid",articleid);
	
	%>

	<script>
	//alert('<%=boardcode%>');
	</script>
	<jsp:include page="/jsp/header.jsp"/>
	<jsp:include page="<%= targetPage %>" flush="false"/> 


		



	<div id="index_container">hello</div>
</body>
</html>