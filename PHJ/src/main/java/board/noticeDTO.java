package board;

import java.sql.Date;

public class noticeDTO {
	private int idx;	
	private String title;
	private String content;
	private int view_count;
	private Date postdate;
	private int board_type;
	private int virtualNum;
	
	public noticeDTO() {}

	public noticeDTO(int idx, String title, String content, int view_count, Date postdate, int board_type,
			int virtualNum) {
		super();
		this.idx = idx;
		this.title = title;
		this.content = content;
		this.view_count = view_count;
		this.postdate = postdate;
		this.board_type = board_type;
		this.virtualNum = virtualNum;
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

	public int getBoard_type() {
		return board_type;
	}

	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}

	
	
	
	
}
