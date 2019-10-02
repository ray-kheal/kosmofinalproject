package model.board;

import java.sql.Date;

public class commentVO {

	private int c_code;
	private int b_code;
	private String name;
	private String comment;
	private Date postdate;
	
	public commentVO() {};
	
	public commentVO(int c_code, int b_code, String name, String comment, Date postdate) {
		super();
		this.c_code = c_code;
		this.b_code = b_code;
		this.name = name;
		this.comment = comment;
		this.postdate = postdate;
	}

	public int getC_code() {
		return c_code;
	}

	public void setC_code(int c_code) {
		this.c_code = c_code;
	}

	public int getB_code() {
		return b_code;
	}

	public void setB_code(int b_code) {
		this.b_code = b_code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	
	
}
