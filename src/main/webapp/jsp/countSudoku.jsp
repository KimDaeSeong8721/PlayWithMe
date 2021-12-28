<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>



<%
	String id;
	String nickname;
	
	session.setAttribute("access", true);
	if (session.getAttribute("id") == null)
		id="null";
	else
		id = (String)session.getAttribute("id");
		
	if (session.getAttribute("nickname") == null)
		nickname="null";
	else
		nickname = (String)session.getAttribute("nickname");


	String targetPage = "/term/sudoku.jsp"; 
	
	if(!id.equals("null"))
	{

   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   String sql;
   // user input
   String title = request.getParameter("title");
   String content = request.getParameter("content");
   Date date = new Date();
 
  // String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 10 OFFSET " + article_first_index +";";
   //카운팅 
   
   sql = "SELECT * FROM sudoku_counter WHERE mem_id = '" + id + "';";
   ResultSet rs = stmt.executeQuery(sql);
   int sudoku_count=1;
   boolean isExist = false;
   while(rs.next())
   {
	   isExist = true;
	   sudoku_count = rs.getInt("sudoku_count") + 1;
	   out.println("LOOP1");
   }						
	
   if (!isExist)
   {
	   sql = "INSERT INTO sudoku_counter(mem_id, sudoku_count) VALUES ('" + id + "','1');";
	   stmt.executeUpdate(sql);
   }
   else
   {
	   sql = "UPDATE sudoku_counter SET sudoku_count = "+ sudoku_count + " WHERE mem_id='" + id + "';";
	   stmt.executeUpdate(sql);
   }
  
   
   sql = "SELECT * FROM member WHERE mem_id = '" + id + "';";
   rs = stmt.executeQuery(sql);
   int mem_ex=0;
   int mem_level=0;
   isExist = false;
   
   while(rs.next())
   {
	   out.println("LOOP2");
	   isExist = true;
	   
	   mem_ex = rs.getInt("mem_ex");
	   //out.println(mem_ex);
	   mem_level = rs.getInt("mem_level");
	   //out.println(mem_level);
   }	
   
   
  // out.println(mem_ex);
   if (isExist==true)
   {
	   mem_ex=mem_ex+30;
	   if(mem_ex > 100)
	   {
		   mem_level++;
		   mem_ex = mem_ex -100;
	   }
	   
	   
	   sql = "UPDATE member SET mem_level = "+ mem_level + ", mem_ex = " + mem_ex + " WHERE mem_id='" + id + "';";
	   stmt.executeUpdate(sql);
   }
   else
   {
	   out.println("ERROR" + id + mem_ex);
   }

		session.setAttribute("level",mem_level);
		session.setAttribute("exp",mem_ex);

   

   //out.println(cnt);
   rs.close();
   stmt.close();
	}
   response.sendRedirect(targetPage);
%>


