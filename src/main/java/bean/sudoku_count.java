package bean;

import java.util.Date;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
public class sudoku_count implements Serializable{
	private String mem_id  ;
	private int sudoku_count  ;

	
	public sudoku_count() {
		
	}


	public String getMem_id() {
		return mem_id;
	}


	public int getSudoku_count() {
		return sudoku_count;
	}


	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}


	public void setSudoku_count(int sudoku_count) {
		this.sudoku_count = sudoku_count;
	}
	
	
	   
	   
}
