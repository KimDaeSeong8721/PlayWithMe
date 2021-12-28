package bean;

import java.util.Date;
import java.io.Serializable;

public class UserInfo implements Serializable{

	private String id = "";
	private String nickName = "";
	private int score = 0 ;
	
	public String getId() {   //getter methods
	      return id;
	   }
	   public String getNickName() {
	      return nickName;
	   }
	   public int getScore() {
		      return score;
		   }
	   public void setId(String id) {
		      this.id = id;
		   }
	   public void setNickName(String nickName) {
		      this.nickName = nickName;
		   }
	   public void setScore(int score) {
		      this.score = score;
		   }
	   
	   
	   
}
