package bean;

import java.util.Date;
import java.io.Serializable;

public class article implements Serializable{
	private int article_id = 0;
	private int board_id  =0;
	private String mem_id  ;
	private String article_title = "";
	private String article_mem_nickname = "";
	private String article_content = "";
	private String article_date = "";
	private int article_reco =0;
	private int article_nonReco =0;
	private int article_readCount =0;

	public article(){}
	
	public String getArticle_date() {
		return article_date;
	}

	public void setArticle_date(String article_date) {
		this.article_date = article_date;
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

	public String getArticle_title() {
		return article_title;
	}

	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}

	public String getArticle_mem_nickname() {
		return article_mem_nickname;
	}

	public void setArticle_mem_nickname(String article_mem_nickname) {
		this.article_mem_nickname = article_mem_nickname;
	}

	public String getArticle_content() {
		return article_content;
	}

	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}

	public int getArticle_reco() {
		return article_reco;
	}

	public void setArticle_reco(int article_reco) {
		this.article_reco = article_reco;
	}

	public int getArticle_nonReco() {
		return article_nonReco;
	}

	public void setArticle_nonReco(int article_nonReco) {
		this.article_nonReco = article_nonReco;
	}

	public int getArticle_readCount() {
		return article_readCount;
	}

	public void setArticle_readCount(int article_readCount) {
		this.article_readCount = article_readCount;
	}



	
	 
	   
	   
}
