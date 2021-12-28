package bean;

import java.util.Date;
import java.io.Serializable;

public class BoardInfo implements Serializable{

	private String boardId = "";
	private String writer = "";
	private String title = "";
	private String content = "";
	private String date = null;

	
	public String getBoardId() {   //getter methods
	      return boardId;
	   }
	
	
	   public String getWriter() {
	      return writer;
	   }
	   public String getTitle() {
		      return title;
		   }
	   public String getContent() {
		      return content;
		   }
	   public String getDate() {
		      return date;
		   }
	   public void setBoardId(String boardId) {
		      this.boardId = boardId;
		   }
	   public void setWriter(String writer) {
		      this.writer = writer;
		   }
	   public void setTitle(String title) {
		      this.title = title;
		   }
	   public void setContent(String content) {
		      this.content = content;
		   }
	   public void setDate(String date) {
		   this.date = date;
		   }
	   
	   
}
