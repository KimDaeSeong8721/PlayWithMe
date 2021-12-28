<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<jsp:useBean id="userInfo" class="bean.UserInfo" scope="session"/>  <!-- added -->


<%
   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   // user input
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String nickname="null";
   
   //UserInfo 테이블에 이미 존재하는지 확인
   ResultSet rsf = stmt.executeQuery(String.format("SELECT * FROM member Where mem_ID='%s';",id));
   String realID = null; 
   while(rsf.next()){
    realID = rsf.getString("mem_ID");
   // out.print(realID);
   }
   rsf.close();
   
   // 회원가입여부 확인
   if (realID == null) {
	   // 회원가입이 안되어있는 경우
		 session.setAttribute("logState","-3");
		 %>
			
			<jsp:forward page = "login.jsp"/>
			<%
   }
   else{
	   //회원가입이 되어있는 경우  
	   
	 	  ResultSet rs0 = stmt.executeQuery(String.format("SELECT * FROM member Where mem_ID='%s';",id));
	 	  String realPw = "" ;
	 	  int level=0;
	 	  int exp=0;
	 	  int s_cnt = 0;
	 	  int f_cnt = 0;
	 	  while(rs0.next()){
		    realPw = rs0.getString("mem_passwd");
		    nickname = rs0.getString("mem_nickname");
		    level = rs0.getInt("mem_level");
		    exp = rs0.getInt("mem_ex");
	 	  }
	 	 rs0.close();
	 	 %>
	 	 <script type="text/javascript">


		var logstate = '<%=realPw%>';
		//alert(logstate);
		</script>
	 	 <% 
		
		   if (pw.equals(realPw)) {
			 // login successed	 
				
			// added javaBeancode
			 //userInfo.setId(realID);
			 //userInfo.setNickName(nickname);
			 
			session.setAttribute("id", realID);
			session.setAttribute("nickname", nickname);
			session.setAttribute("level", level);
			session.setAttribute("exp", exp);
			response.sendRedirect("/term/");
			session.setAttribute("logState","0");

		      
		   } else{
			 // login failed password
			 session.setAttribute("logState","-2");
			%>
			
			<jsp:forward page = "login.jsp"/>
			<%
		   }
	   }
   
  
  

 

   stmt.close();
 
%>