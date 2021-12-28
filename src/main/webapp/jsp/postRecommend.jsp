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
 
    sql = "SELECT * FROM `article recommend` WHERE board_id = " + article.getBoard_id()+ " AND article_id = " + article.getArticle_id() + " AND mem_id = '" + id + "';";
    ResultSet rs = stmt.executeQuery(sql);

    boolean isExist = false;
    while(rs.next())
    {
    	isExist = true;
    }
	
   
   if(isExist==false) // 아직 따봉을 안눌렀다면 
   {
	   out.println("YES");
	   // String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 10 OFFSET " + article_first_index +";";
	    sql = "SELECT * FROM articles WHERE board_id = " + article.getBoard_id()+ " AND article_id = " + article.getArticle_id() + ";";
	    rs = stmt.executeQuery(sql);
	    
	   int article_reco=0;
	   int article_nonReco=0;
	   isExist = false;
	   while(rs.next())
	   {
		   isExist = true;
		   

			   article_reco = rs.getInt("article_reco");
		
			   article_nonReco = rs.getInt("article_nonReco");
	   }		
		out.println(article_reco);
	   
		 String ur = "N";
		 if(article.getArticle_reco()==1)
		 {
			 ur="Y";
			 article_reco++;
			 sql = "UPDATE articles SET article_reco = "+ article_reco +" WHERE board_id = " + article.getBoard_id()+ " AND article_id = " + article.getArticle_id() + ";";
		 }else
		 {
			 ur="N";
			 article_nonReco++;
			 sql = "UPDATE articles SET article_nonReco = "+ article_nonReco + " WHERE board_id = " + article.getBoard_id()+ " AND article_id = " + article.getArticle_id() + ";";
		 }
					 
		 stmt.executeUpdate(sql);
		 
		 
		 sql = "INSERT INTO `article recommend`(article_id, board_id, mem_id,Reco) VALUES ('%d','%d','%s','%s');";
		 sql = String.format(sql,article.getArticle_id(),article.getBoard_id(),id,ur);
		 stmt.executeUpdate(sql);
		    
	   
   }
 
   

   targetPage = targetPage +"/v/" +article.getArticle_id();

   
   
   rs.close();
   stmt.close();
	}
   response.sendRedirect(targetPage);
%>


