<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.Math" %>
<%@ page import="java.util.ArrayList"%>


<jsp:useBean id="article" class="bean.article" scope="session"/>  <!-- added -->
<jsp:useBean id="member" class="bean.member" scope="session"/>  <!-- added -->
<jsp:useBean id="comment" class="bean.comment" scope="session"/>  <!-- added -->
<jsp:setProperty name="comment" property="*"/>
<%
request.setCharacterEncoding("UTF-8");
String boardcode = "0";
String boardpagecode ="1";
String articleid = "-1";
String id = "0";
String nickname = "0";
if (request.getAttribute("boardcode") == null)
	  boardcode="0";
else
	  boardcode = (String)request.getAttribute("boardcode");
	
if (request.getAttribute("boardpagecode") == null)
	  boardpagecode="1";
else
	  boardpagecode = (String)request.getAttribute("boardpagecode");

if (session.getAttribute("articleid") == null)
	articleid="-1";
else
	articleid =(String)session.getAttribute("articleid");
	
	
if(session.getAttribute("id") != null)
	id = (String)session.getAttribute("id");
else
	id = "null";
	
if(session.getAttribute("nickname") != null)
	nickname = (String)session.getAttribute("nickname");
else
	nickname = "null";

request.setAttribute("boardcode",boardcode);
request.setAttribute("boardpagecode",boardpagecode);
String targetPage="/term/board/"+boardcode;
out.println(id);

if(id!="null" && articleid!="-1")
{
	   targetPage="/term/board/"+boardcode+"/v/" + articleid;
	   Connection conn = ConnectionContext.getConnection();
	   Statement stmt = conn.createStatement();
	   ResultSet rsf = null;
	   String sql;
	   int com_id;
	   int com_order;
	   int depth = comment.getCom_depth();

	   if (depth == 0)// 댓글이면 depth가 0인 order순으로 가져옴 com_id+1로 작성 
	   {
	       sql = "SELECT * FROM comment WHERE board_id = " + boardcode+ " AND article_id = " + articleid+ " AND com_depth = 0 ORDER BY com_id DESC LIMIT 1;";
	       
	       ResultSet rs = stmt.executeQuery(sql);
	       com_id = 0;
	       while(rs.next())
	       {
	    	   com_id = rs.getInt("com_id") + 1;
	    	  
	       }
			out.println(com_id);
	       
	       sql = "INSERT INTO comment(com_id, com_order, com_depth, article_id, board_id, mem_id,com_content,mem_nickname) VALUES ('%d','%d','%d','%d','%d','%s','%s','%s');";
	       sql = String.format(sql,com_id,0,0,Integer.parseInt(articleid),Integer.parseInt(boardcode),id,comment.getCom_content(),nickname);
	       //자바빈 으로 받은거 getCom_content, getCom_depth 2개 대댓글의 경우 3개
	       int cnt = stmt.executeUpdate(sql);
	       
	      
	       
	   }
	   else if (depth == 1)// 대댓글이면 해당 bean.com_id & com_depth(1)인 com_order순으로 가져와 com_order+1로 작성 
	   {
		   com_id = comment.getCom_id();
		   sql = "SELECT * FROM comment WHERE board_id = " + boardcode+ " AND article_id = " + articleid+ " AND com_id = " + com_id +" AND com_depth = 1 ORDER BY com_order DESC LIMIT 1;";
	       com_order = 0;
	       ResultSet rs = stmt.executeQuery(sql);
	       while(rs.next())
	       {
	    	   com_order = rs.getInt("com_order") + 1;
	       }
	       out.println(com_id);
	       out.println(com_order);
	       sql = "INSERT INTO comment(com_id, com_order, com_depth, article_id, board_id, mem_id,com_content,mem_nickname) VALUES ('%d','%d','%d','%d','%d','%s','%s','%s');";
	       sql = String.format(sql,com_id,com_order,1,Integer.parseInt(articleid),Integer.parseInt(boardcode),id,comment.getCom_content(),nickname);
	       //자바빈 으로 받은거 getCom_content, getCom_depth 2개 대댓글의 경우 3개
	       int cnt = stmt.executeUpdate(sql);
	       
	       
	   }
	   
	   response.sendRedirect(targetPage);  	
}  
  %>
	 
	