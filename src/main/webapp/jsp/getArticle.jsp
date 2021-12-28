<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.lang.Math" %>
<link href="/playwithme/css/bodyStyle.css" rel="stylesheet" type="text/css">
<jsp:useBean id="article" class="bean.article" scope="session"/>  <!-- added -->
<jsp:useBean id="member" class="bean.member" scope="session"/>  <!-- added -->
					<script type="text/javascript">	
					 	function registerPost() {
		

							 	
								 if(document.forms["form"]["article_title"].value == "")
								{
									alert('제목을 입력해주세요.');
									return;
								 }
								 
								 if(document.forms["form"]["article_content"].value == "")
									{
										alert('내용을 입력해주세요.');
										return;
									 }
											document.form.submit();
		
								}
							  
		 				function recommendPost(value) 
		 				{ // 0 down // 1up
		 					
							
							document.forms["recform"]["article_reco"].value = value;
							document.recform.submit();
	
						}
							 </script> 




<%
request.setCharacterEncoding("UTF-8");
String boardcode = "0";
String boardpagecode ="1";
String articleid = "-1";
String id = "0";

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

request.setAttribute("boardcode",boardcode);
request.setAttribute("boardpagecode",boardpagecode);
request.setAttribute("articleid",articleid);

if(articleid!="-1")
{
	
}
	int article_first_index = 10 *  (Integer.parseInt(boardpagecode)-1);

   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   ResultSet rsf = null;
   
   //게시글 본문 불러오는 파트 
	//String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 10 OFFSET "+ article_first_index + ");";
	
    String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " AND article_id = " + articleid+ ";";
  
	
	rsf = stmt.executeQuery(String.format(sql));
	
	boolean isExist=false;
   while(rsf.next()){
	   isExist=true;
	   article.setArticle_id(rsf.getInt("Article_id"));
	   article.setArticle_title(rsf.getString("Article_title"));
	   article.setArticle_content(rsf.getString("Article_content"));
	   article.setMem_id(rsf.getString("mem_id"));
	   article.setArticle_mem_nickname(rsf.getString("Article_mem_nickname"));
	   article.setArticle_date(rsf.getString("Article_date"));
	   article.setArticle_reco(rsf.getInt("Article_reco"));
	   article.setArticle_nonReco(rsf.getInt("Article_nonReco"));
	   article.setArticle_readCount(rsf.getInt("Article_readCount"));
   }
   
   session.setAttribute("article_nick", article.getArticle_mem_nickname());
   
   boolean isMemberRemain=false;
	sql = "SELECT mem_level,mem_ex,mem_date FROM member WHERE mem_id = '" + article.getMem_id() +"';";
	rsf = stmt.executeQuery(String.format(sql));
	while(rsf.next()){
		isMemberRemain=true;
		member.setMem_level(rsf.getInt("mem_level"));
		member.setMem_ex(rsf.getInt("mem_ex"));
		member.setMem_date(rsf.getString("mem_date"));
	}
    if (isExist)
    {
    	
	   %> 
	   					<form id="postRecommend" class="write" name="recform" action="/term/jsp/postRecommend.jsp" style="display:none;" accept-charset="utf-8">
							<input type="hidden" name="board_id" value="<%=boardcode%>">
							<input type="hidden" name="article_id" value="<%=articleid%>">
							<input type="hidden" name="article_reco" >
						</form>
	   
	   
	   
					<div class="articles">
							<form id="writebox" class="write" name="form" action="/term/jsp/modifyArticle.jsp" style="display:none;" accept-charset="utf-8">
							<p>
								<input name="article_title" autocomplete="off" placeholder="글 제목"
									class="title" value="<%=article.getArticle_title()%>">
							</p>
							<p>
								<textarea name="article_content" placeholder="글을 작성해주세요." class="smallplaceholder" ><%=article.getArticle_content()%></textarea>
							</p>
							<input class="file" type="file" name="file" multiple="multiple">
							<ol class="thumbnails">
								<li class="new"></li>
							</ol>
							<div class="clearBothOnly"></div>

							<ul class="option">
								<li title="첨부" class="attach"></li>
								<li title="완료" class="submit" onclick='registerPost()'></li>	
							</ul>
							<div class="clearBothOnly"></div>
							<input type="hidden" name="board_id" value="<%=boardcode%>">
							<input type="hidden" name="article_id" value="<%=articleid%>">
						</form>

			
						
					</div>


					<div class="articles" id="toggle" style="">

	 					
						<article class='onBoard'>
							
							<a class="article">
									<ul class="article_top">
										<li class="button">…</li>
									<%if ( id.equals( article.getMem_id())) { %>
									
									
									<li class="delete"><span class="article_delete" onclick="callarticleDelete()">삭제</span></li>
										<li class="modify"><span class="article_delete" onclick="callarticleModify()">수정하기</span></li>
									<%} %>
									</ul>
								<h3 class="title"><%=article.getArticle_title()%></h3>
								
								<time><%=article.getArticle_date()%></time>
								<hr/>
								<p><%=article.getArticle_content()%>
								</p>
								
								<div class="article_bottom">
								
									<ul class="vote">
										<li class="vote-down" onclick='recommendPost(0)'>
										<img class="reco" src="/term/images/nonreco.svg"/><%=article.getArticle_nonReco()%></li>
										<li class="vote-up" onclick='recommendPost(1)'><img class="reco" src="/term/images/reco.svg"/><%=article.getArticle_reco()%></li>
									</ul>
								</div>
							
							</a>
							<div class="writer">
							 <div class="profile">
								<img class="profile" src="/term/images/0.png"
										class="picture medium">
				
								</div>
									<div class="profile-text">
															
									<ul class="profile-top">
										<li class="nickname"><%=article.getArticle_mem_nickname()%></li>
										<%if (isMemberRemain) { %>
										<li class="level">Lv<%=member.getMem_level()%></li>
										<%}else{%>
										<li class="level">탈퇴한 회원 입니다.</li>
										<%} %>
									</ul>
									<hr>
									<p class="large">안녕하세요.
									반갑습니다.</p>
							</div>
							</div>
						</article>
	 <%}else{%>
	 	
	 <%} %>
	 
	 
	