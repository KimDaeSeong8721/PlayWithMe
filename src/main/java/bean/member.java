package bean;

import java.util.Date;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
public class member implements Serializable{
	private String mem_id  ;
	private String mem_passwd  ;
	private String mem_nickname  ;
	private String mem_auth  ;
	private int mem_ex;
	private int mem_level  ;
	private String mem_date;
	
	public member() {
		
	}
	
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_passwd() {
		return mem_passwd;
	}
	public void setMem_passwd(String mem_passwd) {
		this.mem_passwd = mem_passwd;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_auth() {
		return mem_auth;
	}
	public void setMem_auth(String mem_auth) {
		this.mem_auth = mem_auth;
	}
	public int getMem_ex() {
		return mem_ex;
	}
	public void setMem_ex(int mem_ex) {
		this.mem_ex = mem_ex;
	}
	public int getMem_level() {
		return mem_level;
	}
	public void setMem_level(int mem_level) {
		this.mem_level = mem_level;
	}
	public String getMem_date() {
		return mem_date;
	}
	public void setMem_date(String mem_date) {
		this.mem_date = mem_date;
	}



	   
	   
}
