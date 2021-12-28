
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>


<%
Connection conn = ConnectionContext.getConnection();
Statement stmt = conn.createStatement();

   String id = request.getParameter("id");
   String nickname = request.getParameter("nickname");
   String pw = request.getParameter("pw");

   //UserInfo 테이블에 이미 존재하는지 확인
   ResultSet rsf = stmt.executeQuery(String.format("SELECT * FROM member Where mem_ID='%s';",id));
   String realID = null; 
   while(rsf.next()){
    realID = rsf.getString("mem_ID");
    
  }
   rsf.close();
   request.setAttribute("id", realID);
   // 회원가입여부 확인
   if (realID == null) {
	   stmt.executeUpdate(String.format("INSERT INTO member (mem_id, mem_passwd,mem_nickname) VALUES ('%s','%s','%s');",id,pw,nickname));
	   stmt.close();
	   session.setAttribute("logState", "1");
   }
   else{
	   session.setAttribute("logState", "-1");

   }

   response.sendRedirect("login.jsp");

   
   %>
   
 
 
