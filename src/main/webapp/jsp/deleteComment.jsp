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

out.println("id : " + id + ",articleid : " + articleid);
if(id!="null" && articleid!="-1")
{	
	out.println("<br>success access");
	
	int com_id = comment.getCom_id();
	out.println("comid:" +com_id);
	int com_order =comment.getCom_order();
	int com_depth =comment.getCom_depth();
	
	
	   targetPage="/term/board/"+boardcode+"/v/" + articleid;
	   Connection conn = ConnectionContext.getConnection();
	   Statement stmt = conn.createStatement();
	   ResultSet rsf = null;
	   String sql;

	   	   sql = "SELECT * FROM comment WHERE board_id = " + boardcode + " AND article_id = " + articleid + " AND com_id = " + com_id +" AND com_order = " + com_order  +" AND com_depth = " + com_depth + ";";    
	       ResultSet rs = stmt.executeQuery(sql);
	       boolean isExist =false ;
	       while(rs.next())
	       {
	    	    isExist = true; 
	    	   comment.setMem_id(rs.getString("mem_id"));
	    	  
	       }
			if(isExist == true )
			{
				if(comment.getMem_id().equals(id))
				{
					   if(com_depth==0) //본 댓글이라면 대댓글도 삭제해줌
					   {
						   sql = "DELETE FROM comment WHERE board_id = " + boardcode + " AND article_id = " + articleid + " AND com_id = " + com_id +";";   
							    
					   }else{  //댓댓글이라면 혼자만 삭제됨
						   sql = "DELETE FROM comment WHERE board_id = " + boardcode + " AND article_id = " + articleid + " AND com_id = " + com_id +" AND com_order = " + com_order  +" AND com_depth = " + com_depth + ";";   
							
					   }
						   
							   
				   	   stmt.executeUpdate(sql);
				
				   	out.println("<br>DELETE SUCCESS");
				}
				else
				{
					out.println("<br>DEFER ID" + comment.getMem_id());
				}
				
			}
			else
			{
				out.println("<br>NOT FOUND");
				out.println("<br>" + boardcode);
				out.println("<br>" + articleid);
				out.println("<br>" + com_id);
				out.println("<br>" + com_order);
				out.println("<br>" + com_depth);
			}

	       
	     
}         
else
{
	out.println(articleid);
	
}
response.sendRedirect(targetPage);  	
	  
 %>
	 
	