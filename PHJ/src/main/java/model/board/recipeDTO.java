package model.board;

import java.sql.Date;

public class recipeDTO {

	private int idx;
	private String image_name;
	private String title;
	private String content;
	private String name;
	private int view_count;
	private Date postdate;
	private String recommend;
	private int virtualNum;
	private String email;
	private String thumbnail;
	
	public recipeDTO() {}

	public recipeDTO(int idx, String image_name, String title, String content, String name, int view_count,
			Date postdate, String recommend,int virtualNum, String email, String thumbnail) {
		this.idx = idx;
		this.image_name = image_name;
		this.title = title;
		this.content = content;
		this.name = name;
		this.view_count = view_count;
		this.postdate = postdate;
		this.recommend = recommend;
		this.virtualNum = virtualNum;
		this.email = email;
		this.thumbnail = thumbnail;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getImage_name() {
		return image_name;
	}

	public void setImage_name(String image_name) {
		this.image_name = image_name;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getView_count() {
		return view_count;
	}

	public void setView_count(int view_count) {
		this.view_count = view_count;
	}

	public Date getpostdate() {
		return postdate;
	}

	public void setpostdate(Date postdate) {
		this.postdate = postdate;
	}

	public String getRecommend() {
		return recommend;
	}

	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public int getVirtualNum() {
		return virtualNum;
	}

	public void setVirtualNum(int virtualNum) {
		this.virtualNum = virtualNum;
	}

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

}
