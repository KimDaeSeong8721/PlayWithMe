<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="UTF-8"%>


<%
session.setAttribute("id",null);
session.setAttribute("nickname",null);
  response.sendRedirect("/term/user/login.jsp");

%>

