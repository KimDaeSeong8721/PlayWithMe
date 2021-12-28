<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>


<jsp:useBean id="article" class="bean.article" scope="request"/>
<jsp:setProperty name="article" property="*"/>

<%
	String id;
	String nickname;
	if (session.getAttribute("id") == null)
		id="null";
	else
		id = (String)session.getAttribute("id");
		
	if (session.getAttribute("nickname") == null)
		nickname="null";
	else
		nickname = (String)session.getAttribute("nickname");


	String targetPage = "/term/board/"+article.getBoard_id(); 
	
	if(id!="null")
	{
	
	
	
	

   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   String sql;
   // user input
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   Date date = new Date();
 
  // String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 10 OFFSET " + article_first_index +";";
   
   sql = "SELECT * FROM articles WHERE board_id = " + article.getBoard_id()+ " ORDER BY article_id DESC LIMIT 1;";
   ResultSet rs = stmt.executeQuery(sql);
   int article_id = 1;
   while(rs.next())
   {
	   article_id = rs.getInt("article_id") + 1;
	  
   }						
	
	//out.println(article.getArticle_title());
   

   targetPage = targetPage +"/v/" +article_id;
	//out.println("article_id : " + article_id);

  
   
   sql = "INSERT INTO articles(article_id, board_id, mem_id, article_title, article_mem_nickname, article_content) VALUES ('%d','%d','%s','%s','%s','%s');";
   sql = String.format(sql,article_id,article.getBoard_id(),id,article.getArticle_title(),nickname,article.getArticle_content());
   //out.println(sql);

   int cnt = stmt.executeUpdate(sql);
   //out.println(cnt);
   rs.close();
   stmt.close();
	}
   response.sendRedirect(targetPage);
%>


