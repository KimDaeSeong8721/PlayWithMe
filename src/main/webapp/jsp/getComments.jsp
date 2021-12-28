<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.Math" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="bean.comment"%>

<link href="/playwithme/css/bodyStyle.css" rel="stylesheet" type="text/css">
<jsp:useBean id="article" class="bean.article" scope="session"/>  <!-- added -->
<jsp:useBean id="member" class="bean.member" scope="session"/>  <!-- added -->
<jsp:useBean id="comment_bean" class="bean.comment" scope="session"/>  <!-- added -->

					<script type="text/javascript">	
		
			

					
		 				function recommendCommentPost(com_reco,com_id,com_order,com_depth) 
		 				{ // 0 down // 1up
		 					
							document.forms["recommend_comment"]["com_reco"].value = com_reco;
							document.forms["recommend_comment"]["com_id"].value = com_id;
							document.forms["recommend_comment"]["com_order"].value = com_order;
							document.forms["recommend_comment"]["com_depth"].value = com_depth;
							document.recommend_comment.submit();
	
						}
							</script> 




<%
request.setCharacterEncoding("UTF-8");
String boardcode = "0";
String boardpagecode ="1";
String articleid = "-1";
String id = "0";
String article_nick;

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
	  articleid = (String)session.getAttribute("articleid");
	

if(session.getAttribute("id") != null)
	id = (String)session.getAttribute("id");
else
	id = "null";

if(session.getAttribute("article_nick") != null)
	article_nick = (String)session.getAttribute("article_nick");
else
	article_nick = "null";


request.setAttribute("boardcode",boardcode);
request.setAttribute("boardpagecode",boardpagecode);
session.setAttribute("articleid",articleid);


if(articleid!="-1")
{
	//돌아가기
}
	int article_first_index = 10 *  (Integer.parseInt(boardpagecode)-1);

   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   ResultSet rsf = null;
   
   //게시글 본문 불러오는 파트 
       //ArrayList<String[]> boardlist = new ArrayList<String[]>();   
	/*
    boardlist.add(new String[]{"0","자유게시판"});
    boardlist.add(new String[]{"1","스도쿠게시판"});
    boardlist.add(new String[]{"2","보드게임게시판"});
    boardlist.add(new String[]{"3","라이어게임게시판"});
    boardlist.add(new String[]{"4","마피아게시판"});
    boardlist.add(new String[]{"5","어몽어스게시판"});
    */
    
	//String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 10 OFFSET "+ article_first_index + ");";
	
    String sql = "SELECT * FROM comment WHERE board_id = " + boardcode+ " AND article_id = " + articleid+ " AND com_depth = 0;";
  
	rsf = stmt.executeQuery(String.format(sql));
	

	ArrayList<comment> comment_list = new ArrayList<comment>();

	boolean isExist=false;
   while(rsf.next()){
	   isExist=true;   
	   comment ele = new comment();

	   ele.setCom_id(rsf.getInt("com_id"));
	   ele.setCom_order(rsf.getInt("com_order"));
	   ele.setCom_depth(rsf.getInt("com_depth"));
	   ele.setArticle_id(rsf.getInt("article_id"));
	   ele.setBoard_id(rsf.getInt("board_id"));
	   ele.setMem_id(rsf.getString("mem_id"));
	   ele.setCom_content(rsf.getString("com_content"));
	   ele.setCom_reco(rsf.getInt("com_reco"));
	   ele.setCom_nonReco(rsf.getInt("com_nonReco"));   
	   ele.setCom_date(rsf.getString("com_date"));  
	   ele.setMem_nickname(rsf.getString("mem_nickname"));
	   comment_list.add(ele);  //메인 댓글을 가져옴
  

   }
   if(isExist)
   {
	    sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " AND article_id = " + articleid + ";";
		rsf = stmt.executeQuery(String.format(sql));
	   
	   
	    comment sub_ele = new comment();
		for(int i=0; i<comment_list.size();i++) 
		{
			//메인댓글 출력
			 String paste_nick;
			 String deletecode;
			 if(article_nick.equals(comment_list.get(i).getMem_nickname()))
			 {
				 paste_nick = comment_list.get(i).getMem_nickname() + "(글쓴이)";
			 }
			 else
			 {
				 paste_nick = comment_list.get(i).getMem_nickname();
			 }
			
			 if(id.equals(comment_list.get(i).getMem_id()))
			 {
				 deletecode = "<li class='delete'><span class='article_delete' onclick='callcommentDelete(" + comment_list.get(i).getCom_id() + "," + comment_list.get(i).getCom_order()+ "," + comment_list.get(i).getCom_depth() +")'>삭제</span></li>";
			 }
			 else
			 {
				 deletecode = "";
			 }
		%> 
		
			<article class="parent">
									<div class="profile">
										<img class="profile" src="/term/images/0.png"
										class="picture medium">
				
									</div>
									<div class="comment">
															
									<ul class="comment-top">
										<li class="nickname"><%=paste_nick %></li>
										<li class="time"><time class="medium"><%=comment_list.get(i).getCom_date() %></time></li>
										<li class="button">…</li>
										<%=deletecode %>
									</ul>
									<hr>
									<p class="large"><%=comment_list.get(i).getCom_content() %></p>
									
									<ul class="comment-bottom">
										<li class="child-comment" ><a class='child-comment' onclick='callwriteForm("comment-child-<%=comment_list.get(i).getCom_id() %>")'>대댓글</a></li>
										<%
										String str0 = comment_list.get(i).getCom_id() +"," +comment_list.get(i).getCom_order()+"," + comment_list.get(i).getCom_depth();
									
										out.println("<li class='vote-down' onClick='recommendCommentPost(0," + str0 + ")'>");
										%>
										
										<img class="reco" src="/term/images/nonreco.svg"/><%=comment_list.get(i).getCom_nonReco() %></li>
										
										<%
										out.println("<li class='vote-up' onClick='recommendCommentPost(1," + str0 + ")'>");
										%>
										
										
										<img class="reco" src="/term/images/reco.svg"/><%=comment_list.get(i).getCom_reco() %></li>

									</ul>
									</div>	
				</article>
		
		
		
		
		<%
			 
				 
			 sql = "SELECT * FROM comment WHERE board_id = " + boardcode+ " AND article_id = " + articleid+ " AND com_depth = 1 AND com_id = " + comment_list.get(i).getCom_id()+";";
			 rsf = stmt.executeQuery(String.format(sql));
				
			 
			   while(rsf.next()){
				   sub_ele.setCom_id(rsf.getInt("com_id"));
				   sub_ele.setCom_order(rsf.getInt("com_order"));
				   sub_ele.setCom_depth(rsf.getInt("com_depth"));
				   sub_ele.setArticle_id(rsf.getInt("article_id"));
				   sub_ele.setBoard_id(rsf.getInt("board_id"));
				   sub_ele.setMem_id(rsf.getString("mem_id"));
				   sub_ele.setCom_content(rsf.getString("com_content"));
				   sub_ele.setCom_reco(rsf.getInt("com_reco"));
				   sub_ele.setCom_nonReco(rsf.getInt("com_nonReco"));   
				   sub_ele.setCom_date(rsf.getString("com_date"));  
				   sub_ele.setMem_nickname(rsf.getString("mem_nickname"));
				   
					 if(article_nick.equals(sub_ele.getMem_nickname()))
					 {
						 paste_nick = sub_ele.getMem_nickname() + "(글쓴이)";
					 }
					 else
					 {
						 paste_nick = sub_ele.getMem_nickname();
					 } 
					
					 if(id.equals(sub_ele.getMem_id()))
					 {
						 deletecode = "<li class='delete'><span class='article_delete' onclick='callcommentDelete(" + sub_ele.getCom_id() + "," + sub_ele.getCom_order()+ "," + sub_ele.getCom_depth() +")'>삭제</span></li>";
					 }
					 else
					 {
						 deletecode = "";
					 }
				   
					
				
				   
				   
					//서브댓글 출력
			 		%>
			 				<article class="child">
									<div class="profile">
										<img class="profile" src="/term/images/0.png"
										class="picture medium">
		
									</div>
									<div class="comment">
									<ul class="comment-top">
										<li class="nickname"><%=paste_nick %></li>
										<li class="time"><time class="medium"><%=sub_ele.getCom_date() %></time></li>
										<li class="button">…</li>
										<%=deletecode %>
									</ul>
									<hr>
									<p class="large"><%=sub_ele.getCom_content() %></p>
									
									<ul class="comment-bottom">
									
									
										<%
										 str0 = sub_ele.getCom_id() +"," +sub_ele.getCom_order()+"," + sub_ele.getCom_depth();
									
										out.println("<li class='vote-down' onClick='recommendCommentPost(0," + str0 + ")'>");
										%>
										
										<img class="reco" src="/term/images/nonreco.svg"/><%=sub_ele.getCom_nonReco() %></li>
										
										<%
										
										out.println("<li class='vote-up' onClick='recommendCommentPost(1," + str0 + ")''>");
										%>
									
									
										
										<img class="reco" src="/term/images/reco.svg"/><%=sub_ele.getCom_reco() %></li>


									</ul>
									</div>	
								</article>
			 		
			 		
			 		
			 		<%  
			    }
			 //서브댓글쓰기창 출력
			   %>
			   		<article id="comment-child-<%=comment_list.get(i).getCom_id() %>" class="comment-child" style="display:none" >
								<form class="writecomment" name="child-writecomment-<%=comment_list.get(i).getCom_id() %>" action="/term/jsp/postComment.jsp" accept-charset="utf-8" >
									<input type="text" name="com_content" maxlength="300"
										autocomplete="off" placeholder="댓글을 입력하세요." class="text">
									<ul class="option">
										
										<li title="완료" class="submit" onclick="callchildcommentWrite('child-writecomment-<%=comment_list.get(i).getCom_id() %>')"></li>
									</ul>
									
									<div class="clearBothOnly"></div>
									<input type="hidden" name="board_id" value="<%=boardcode%>">
									<input type="hidden" name="article_id" value="<%=articleid%>">
									<input type="hidden" name="com_depth" value="1">
									<input type="hidden" name="com_id" value="<%=comment_list.get(i).getCom_id() %>">
								</form>
					</article>
			   
			   
			   
			   <%	  
		}//마지막 게시글 댓글창 출력
   }
	%> 
	
								<article class="comment">
								<form class="writecomment" name="writecomment" action="/term/jsp/postComment.jsp" accept-charset="utf-8" >
									<input type="text" name="com_content" maxlength="300"
										autocomplete="off" placeholder="댓글을 입력하세요." class="text">
									<ul class="option">
										<li title="완료" class="submit" onclick="callcommentWrite()" ></li>
									</ul>
									<div class="clearBothOnly"></div>
									<input type="hidden" name="board_id" value="<%=boardcode%>">
									<input type="hidden" name="article_id" value="<%=articleid%>">
									<input type="hidden" name="com_depth" value="0">
								</form>
								</article>
	
								<article id="recommend_comment" class="recommend_comment comment" style="display:none" >
								<form class="recommend_comment" name="recommend_comment" action="/term/jsp/postCommentRecommend.jsp" accept-charset="utf-8" >
	
									<input type="hidden" name="board_id" value="<%=boardcode%>">
									<input type="hidden" name="article_id" value="<%=articleid%>">
									<input type="hidden" name="com_id" value="">
									<input type="hidden" name="com_depth" value="">
									<input type="hidden" name="com_order" value="">
									<input type="hidden" name="com_reco" value="">
								</form>
					</article>
	
	<%

  
   	
    rsf.close();
    stmt.close();
  %>
	 
	