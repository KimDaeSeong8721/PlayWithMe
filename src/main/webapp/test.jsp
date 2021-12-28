<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>

<%
   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   int rowCount = stmt.executeUpdate("INSERT INTO member (id,passwd,nickname) VALUES ('a', 'a', 'a');");
	out.println(rowCount);
  
%>
