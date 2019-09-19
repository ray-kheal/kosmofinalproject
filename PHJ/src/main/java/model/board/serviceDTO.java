package model.board;

import java.sql.Date;

public class serviceDTO {
	private int idx;	
	private String title;
	private String content;
	private String name;
	private int view_count;
	private Date postdate;
	private int virtualNum;
	private int bgroup;
	private int bstep;
	private int bindent;
	
	public serviceDTO() {}
	
	public serviceDTO(int idx, String title, String content, String name, int view_count, Date postdate, int virtualNum,
			int bgroup, int bstep, int bindent) {
		super();
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.name = name;
		this.view_count = view_count;
		this.postdate = postdate;
		this.virtualNum = virtualNum;
		this.bgroup = bgroup;
		this.bstep = bstep;
		this.bindent = bindent;
	}





	public int getBgroup() {
		return bgroup;
	}




	public void setBgroup(int bgroup) {
		this.bgroup = bgroup;
	}




	public int getBstep() {
		return bstep;
	}




	public void setBstep(int bstep) {
		this.bstep = bstep;
	}




	public int getBindent() {
		return bindent;
	}




	public void setBindent(int bindent) {
		this.bindent = bindent;
	}




	public int getVirtualNum() {
		return virtualNum;
	}

	public void setVirtualNum(int virtualNum) {
		this.virtualNum = virtualNum;
	}


	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}





	public String getName() {
		return name;
	}





	public void setName(String name) {
		this.name = name;
	}
	
	
	
	
}
