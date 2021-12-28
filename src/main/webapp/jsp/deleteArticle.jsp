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
String  targetPage="/term/board/"+boardcode+"/v/" + articleid;

out.println("id : " + id + ",articleid : " + articleid);
if(id!="null" && articleid!="-1")
{	
	out.println("<br>success access");
	
	
	   targetPage="/term/board/"+boardcode;
	   Connection conn = ConnectionContext.getConnection();
	   Statement stmt = conn.createStatement();
	   ResultSet rsf = null;
	   String sql;

	   	   sql = "SELECT * FROM articles WHERE board_id = " + boardcode + " AND article_id = " +articleid + ";";    
	       ResultSet rs = stmt.executeQuery(sql);
	       boolean isExist =false ;
	       while(rs.next())
	       {
	    	    isExist = true; 
	    	    article.setMem_id(rs.getString("mem_id"));
	    	  
	       }
			if(isExist == true )
			{
				if(article.getMem_id().equals(id))
				{
				   	   sql = "DELETE FROM comment WHERE board_id = " + boardcode + " AND article_id = " + articleid +  ";";   
				   	   stmt.executeUpdate(sql);
					
				   	   
				   	   sql = "DELETE FROM `article recommend` WHERE board_id = " + boardcode + " AND article_id = " + articleid +  ";";   
				   	   stmt.executeUpdate(sql);
				   	   
				   	   
				   	   sql = "DELETE FROM articles WHERE board_id = " + boardcode + " AND article_id = " + articleid +  ";";   
				   	   stmt.executeUpdate(sql);
				
				   	out.println("<br>DELETE SUCCESS");
				}
				else
				{
					out.println("<br>DEFER ID" + article.getMem_id());
				}
				
			}
			else
			{
				out.println("<br>NOT FOUND");
				out.println("<br>" + boardcode);
				out.println("<br>" + articleid);

			}

	       
	     
}         
else
{
	out.println(articleid);
	
}
response.sendRedirect(targetPage);  	
	  
 %>
	 
	