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



	
	String targetPage = "/term/board/"+article.getBoard_id() + "/v/" + article.getArticle_id() ; 
	
	if(id!="null")
	{
	
	//+ " AND mem_id = " +id
	
	

   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   String sql;
   // user input
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   Date date = new Date();
 
  // String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 10 OFFSET " + article_first_index +";";
   
   sql = "SELECT * FROM articles WHERE board_id = " + article.getBoard_id() + " AND article_id = " + article.getArticle_id()  +";";
   ResultSet rs = stmt.executeQuery(sql);
   int article_id = 1;
   boolean isExist =false;
   String art_id="";
   while(rs.next())
   {
	   isExist = true;
	   art_id=rs.getString("mem_id");
   }						
	if(isExist && id.equals(art_id))	
	{
	//out.println(article.getArticle_title());
   

  // targetPage = targetPage +"/v/" +article_id;
	//out.println("article_id : " + article_id);

  
    
   sql = "UPDATE articles SET article_title='" + article.getArticle_title() + "',article_content= '"+ article.getArticle_content() + "'";
   sql = sql + " WHERE board_id = " + article.getBoard_id() + " AND article_id = " + article.getArticle_id()  +";";
//+ " AND mem_id = " +id
   //out.println(sql);

   int cnt = stmt.executeUpdate(sql);
   //out.println(cnt);
   rs.close();
   stmt.close();
	}
	}
   //response.sendRedirect(targetPage);
%>


