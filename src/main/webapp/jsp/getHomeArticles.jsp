<%@ page import="thinkonweb.util.ConnectionContext"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<link href="/playwithme/css/bodyStyle.css" rel="stylesheet"
	type="text/css">
<jsp:useBean id="article" class="bean.article" scope="session" />
<!-- added -->

<%
String boardcode = (String) request.getAttribute("boardcode");
String boardpagecode = (String) request.getAttribute("boardpagecode");


Connection conn = ConnectionContext.getConnection();
Statement stmt = conn.createStatement();
ResultSet rsf = null;

ArrayList<String[]> boardlist = new ArrayList<String[]>();   //이거 원래 DB에서 가져와야하는데 일단 이렇게만 함
boardlist.add(new String[]{"0","자유게시판"});
boardlist.add(new String[]{"1","스도쿠게시판"});
boardlist.add(new String[]{"2","보드게임게시판"});
boardlist.add(new String[]{"3","라이어게임게시판"});
boardlist.add(new String[]{"4","마피아게시판"});
boardlist.add(new String[]{"5","어몽어스게시판"});




//String sql = "SELECT * FROM articles WHERE board_id = " + boardcode+ " ORDER BY article_id DESC LIMIT 10 OFFSET "+ article_first_index + ");";

for (int i = 0; i < 6; i++) {

	String sql = "SELECT * FROM articles WHERE board_id = " + i + " ORDER BY article_id DESC LIMIT 4 ;";

	rsf = stmt.executeQuery(String.format(sql));
%>

<article>
	<div class="card">
		<div class="board">
			<h3>
				<a href="/term/board/<%=i%>"><%=boardlist.get(i)[1]%></a>
			</h3>

			<%
			int cnt = 0;
			while (rsf.next()) {
				cnt++;
				article.setArticle_id(rsf.getInt("Article_id"));
				article.setArticle_title(rsf.getString("Article_title"));
				article.setArticle_content(rsf.getString("Article_content"));
				article.setArticle_mem_nickname(rsf.getString("Article_mem_nickname"));
				article.setArticle_date(rsf.getString("Article_date"));
				article.setArticle_reco(rsf.getInt("Article_reco"));
				article.setArticle_nonReco(rsf.getInt("Article_nonReco"));
				article.setArticle_readCount(rsf.getInt("Article_readCount"));
			%>

			<a class="list"
				href="/term/board/<%=i%>/v/<%=article.getArticle_id()%>"><time><%=article.getArticle_date()%></time>
				<p><%=article.getArticle_title()%></p> 
			</a> 


<%	
			}
			
			if(cnt<4)
			{
				
				for(int k=0; k<(4-cnt);k++)
				{
					
					%>
				<a class="list"
					><time></time>
				<p></p> 
				</a> 
						
					<%	
	
				}
			}
			
%>
		</div>
	</div>
</article>
<%
}
rsf.close();
stmt.close();

%>
