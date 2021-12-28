<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>


<jsp:useBean id="article" class="bean.article" scope="request"/>
<jsp:useBean id="comment" class="bean.comment" scope="session"/>  
<jsp:setProperty name="comment" property="*"/>

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


	String targetPage = "/term/board/"+comment.getBoard_id(); 
	
	if(id!="null")
	{
	
   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   String sql;
   // user input
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   Date date = new Date();
 
   
   
    sql = "SELECT * FROM `comment recommend`"+  " WHERE mem_id = '" + id +"' AND board_id = " + comment.getBoard_id() + " AND article_id = " + comment.getArticle_id() + " AND com_id = " + comment.getCom_id() +" AND com_order = " + comment.getCom_order()  +" AND com_depth = " + comment.getCom_depth() + ";"; 
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
	   
	    sql = "SELECT * FROM `comment recommend`"+  " WHERE board_id = " + comment.getBoard_id() + " AND article_id = " + comment.getArticle_id() + " AND com_id = " + comment.getCom_id() +" AND com_order = " + comment.getCom_order()  +" AND com_depth = " + comment.getCom_depth() + ";"; 
	   
	    //sql = "SELECT * FROM articles WHERE board_id = " + article.getBoard_id()+ " AND article_id = " + article.getArticle_id() + ";";
	    rs = stmt.executeQuery(sql);
	    
	   int com_reco=0;
	   int com_nonReco=0;
	   isExist = false;
	   while(rs.next())
	   {
		   isExist = true;
		   

		   	   com_reco = rs.getInt("com_reco");
			   com_nonReco = rs.getInt("com_nonReco");
	   }		
		
	   
		 String ur = "N";
		 if(comment.getCom_reco()==1)
		 {
			 ur="Y";
			 com_reco++;
			 sql = "UPDATE comment SET"+  " com_reco = " + com_reco +" WHERE board_id = " + comment.getBoard_id() + " AND article_id = " + comment.getArticle_id() + " AND com_id = " + comment.getCom_id() +" AND com_order = " + comment.getCom_order()  +" AND com_depth = " + comment.getCom_depth() + ";"; 
			 //sql = "UPDATE articles SET article_reco = "+ article_reco +" WHERE board_id = " + article.getBoard_id()+ " AND article_id = " + article.getArticle_id() + ";";
		 }else
		 {
			 ur="N";
			 com_nonReco++;
			 sql = "UPDATE comment SET"+  " com_nonReco = " + com_nonReco +" WHERE board_id = " + comment.getBoard_id() + " AND article_id = " + comment.getArticle_id() + " AND com_id = " + comment.getCom_id() +" AND com_order = " + comment.getCom_order()  +" AND com_depth = " + comment.getCom_depth() + ";"; 
				
			 //sql = "UPDATE articles SET article_nonReco = "+ article_nonReco + " WHERE board_id = " + article.getBoard_id()+ " AND article_id = " + article.getArticle_id() + ";";
		 }
					 
		 stmt.executeUpdate(sql);
		 
		 
		 sql = "INSERT INTO `comment recommend`(com_id,com_order,com_depth,article_id, board_id, mem_id,nonReco) VALUES ('%d','%d','%d','%d','%d','%s','%s');";
		 sql = String.format(sql,comment.getCom_id(),comment.getCom_order(),comment.getCom_depth(),comment.getArticle_id(),comment.getBoard_id(),id,ur);
		 stmt.executeUpdate(sql);
		    
	   
   }
 
   

   targetPage = targetPage +"/v/" +comment.getArticle_id();

   
   
   rs.close();
   stmt.close();
	}
   response.sendRedirect(targetPage);
%>


