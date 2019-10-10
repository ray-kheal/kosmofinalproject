package model.board;

import java.sql.Date;

public class commentDTO {
	private int c_code;
	private int b_code;
	private String writer;
	private String content;
	private java.sql.Date comment_date;
	private int virtualNum;

	public commentDTO(int c_code, int b_code, String writer, String content, Date comment_date, int virtualNum) {
		super();
		this.c_code = c_code;
		this.b_code = b_code;
		this.writer = writer;
		this.content = content;
		this.comment_date = comment_date;
		this.virtualNum = virtualNum;
	}

	public int getVirtualNum() {
		return virtualNum;
	}

	public void setVirtualNum(int virtualNum) {
		this.virtualNum = virtualNum;
	}

	public commentDTO() {
		super();
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public java.sql.Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(java.sql.Date comment_date) {
		this.comment_date = comment_date;
	}

}
