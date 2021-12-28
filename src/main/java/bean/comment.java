package bean;

import java.util.Date;
import java.io.Serializable;

public class comment implements Serializable{
	
	private int com_id ;
	private int com_order ;
	private int com_depth ;
	private int article_id ;
	private int board_id;
	private String mem_id ;
	private String com_content;
	private int com_reco;
	private int com_nonReco ;
	private String com_date;
	private String mem_nickname;
	
	public comment() {
		
	}
	
	
	
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	

	public int getCom_id() {
		return com_id;
	}
	public void setCom_id(int com_id) {
		this.com_id = com_id;
	}
	public int getCom_order() {
		return com_order;
	}
	public void setCom_order(int com_order) {
		this.com_order = com_order;
	}
	public int getCom_depth() {
		return com_depth;
	}
	public void setCom_depth(int com_depth) {
		this.com_depth = com_depth;
	}
	public int getArticle_id() {
		return article_id;
	}
	public void setArticle_id(int article_id) {
		this.article_id = article_id;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getCom_content() {
		return com_content;
	}
	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}
	public int getCom_reco() {
		return com_reco;
	}
	public void setCom_reco(int com_reco) {
		this.com_reco = com_reco;
	}
	public int getCom_nonReco() {
		return com_nonReco;
	}
	public void setCom_nonReco(int com_nonReco) {
		this.com_nonReco = com_nonReco;
	}
	public String getCom_date() {
		return com_date;
	}
	public void setCom_date(String com_date) {
		this.com_date = com_date;
	}



	   
	   
}
