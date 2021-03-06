<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ page import="thinkonweb.util.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="bean.article"%>
<%@ page import="java.lang.Math" %>
<link href="/playwithme/css/bodyStyle.css" rel="stylesheet" type="text/css">
<jsp:useBean id="article" class="bean.article" scope="session"/>  <!-- added -->

<%
String id;
String nickname;
if (session.getAttribute("id") == null)
	id="null";
else
	id = (String)session.getAttribute("id");

String boardcode = (String)request.getAttribute("boardcode");
String boardpagecode = (String)request.getAttribute("boardpagecode");
if (boardcode==null)
	boardpagecode="0";
if (boardpagecode==null)
	boardpagecode="1";
int article_first_index = 10 *  (Integer.parseInt(boardpagecode)-1);

   Connection conn = ConnectionContext.getConnection();
   Statement stmt = conn.createStatement();
   
   ResultSet rsf = null;
	//String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 10 OFFSET "+ article_first_index + ");";
    String sql = "SELECT * FROM articles WHERE mem_id = '" + id + "' ORDER BY article_id DESC LIMIT 10 OFFSET " + article_first_index +";";
  
	
	rsf = stmt.executeQuery(String.format(sql));
	
	ArrayList<article> article_list = new ArrayList<article>();
	boolean isExist=false;
   while(rsf.next()){
	   isExist=true; 
	   article ele = new article();
	   
	   ele.setArticle_id(rsf.getInt("Article_id"));
	   ele.setArticle_title(rsf.getString("Article_title"));
	   ele.setArticle_content(rsf.getString("Article_content"));
	   ele.setArticle_mem_nickname(rsf.getString("Article_mem_nickname"));
	   ele.setArticle_date(rsf.getString("Article_date"));
	   ele.setArticle_reco(rsf.getInt("Article_reco"));
	   ele.setArticle_nonReco(rsf.getInt("Article_nonReco"));
	   ele.setArticle_readCount(rsf.getInt("Article_readCount"));
	   ele.setBoard_id(rsf.getInt("board_id"));
	   article_list.add(ele);
   }
   
   		if(isExist)
   		{
   			int recordCount=0;
   			for(int i=0; i<article_list.size();i++) 
   			{
   			    sql = "SELECT COUNT(*) as recordCount FROM comment WHERE board_id = " + article_list.get(i).getBoard_id()+ " AND article_id = " +  article_list.get(i).getArticle_id()  +";";
   				rsf = stmt.executeQuery(String.format(sql));
   				
   				while(rsf.next()){
   			      recordCount = rsf.getInt("recordCount");	
   				}
   				
   				
   		
   				
   				
	   %> 
	  <article>
				<a class="article" href="/term/board/<%=article_list.get(i).getBoard_id()%>/v/<%=article_list.get(i).getArticle_id()%>">
								<h3><%=article_list.get(i).getArticle_title()%></h3>
								<p><%=article_list.get(i).getArticle_content() %></p> <time><%=article.getArticle_date()%></time>
								<h2><%=article_list.get(i).getArticle_mem_nickname() %></h2>
								<ul class="vote">
										<li class="comment"><img class="reco" src="/term/images/container.articles.comment.png"/><%=recordCount %></li>
										<li class="vote-down">
										<img class="reco" src="/term/images/nonreco.svg"/><%=article_list.get(i).getArticle_nonReco()%></li>
										<li class="vote-up" ><img class="reco" src="/term/images/reco.svg"/><%=article_list.get(i).getArticle_reco()%></li>
								
								</ul>
									
									
								
							</a>
						</article>
						<% 
   			}
   			}

						%>

						<hr>
					</div>
					<div class="pagination">

						<form id="searchArticleForm" class="search">
							<select name="search_type"><option value="4">??????</option>
								<option value="3">????????????</option>
								<option value="2">??? ??????</option>
								<option value="1">??? ??????</option></select> <input name="keyword"
								placeholder="???????????? ???????????????." class="text">
						</form>

							<%
							//if(isExistNext)
							//	out.println("<a href='/term/board/'"+ pageend +"/p/' class='next' >?????? ></a>");
							//else
							//	out.println("<a href='/term/board/'"+ pageend +"/p/' class='next' style='visibility:hidden'>?????? ></a>");	
							   
							   int start_offset= (Integer.parseInt(boardpagecode)-1) / 10 * 10 * 10; // 0 ~99 100~199
							   
								//String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 100 OFFSET "+ article_first_index + ");";
							    //String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 100 OFFSET " + article_first_index +";";
							   	 
							  	sql = "SELECT count(*) as Count FROM articles WHERE mem_id = '" + id + "' ORDER BY article_id DESC LIMIT 101 OFFSET " + start_offset +";";
							  	rsf = stmt.executeQuery(sql);
							  	int count_result = 0;
							    while(rsf.next())
							    {
							    	count_result=rsf.getInt("Count");
							    }
							
							    
								   
								 rsf.close();
								 stmt.close();
								
								int pagestart = (int)((Integer.parseInt(boardpagecode)-1) / 10) * 10 +1; //  355?????? ????????? ??????????????? 33 ??????????????? 31 ??????????????? 35 300~399?????? 55?????? ???????????? ?????????
								int pageend = 0;
								
								boolean isExistNext=false;
								if(count_result>=101)
								{
									isExistNext = true;
									count_result =100;
								}
								
								if((count_result % 10 ==0) &&	(count_result ==100))
									pageend =  pagestart + (int) count_result/10;   // 1 + 20/
								else
									pageend =  pagestart + (int) count_result/10 + 1;
								
								//out.println("count_result : " + count_result);
								//out.println("pagestart : " + pagestart);
								//out.println("pageend : " + pageend);
								
								
								if(pagestart!=1) 
									out.println("<a href='/term/board/my" + "/p/"+ (pagestart-1) + "' class='prev'>??????</a>");
								else
									out.println("<a href='/term/board/my" + "/p/"+ (pagestart-1) + "' class='prev' style='visibility:hidden'>??????</a>");
							
								out.println("<div class='wrap_pages'><ul class='pages'>");
								
								for(int k=pagestart;k<pageend;k++)
								{
									if (k==Integer.parseInt(boardpagecode))
										out.println("<li  class='select'><a href='/term/board/"+ boardcode +"/p/"+ k +"'>" + k +  "</a></li>");
									else
										out.println("<li><a href='/term/board/"+ boardcode +"/p/"+ k +"'>" + k +  "</a></li>");
									
								}
								out.println("</ul></div>");
								
								if(isExistNext)
									out.println("<a href='/term/board/my" +"/p/"+pageend +"' class='next' >?????? ></a>");
								else
									out.println("<a href='/term/board/my" +"/p/' class='next' style='visibility:hidden'>?????? ></a>");	
							%>
							
	
						
					</div>
				</div>
			</div>
						