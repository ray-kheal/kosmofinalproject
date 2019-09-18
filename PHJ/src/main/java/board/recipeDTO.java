package board;

import java.sql.Date;

public class recipeDTO {

	private int Idx;
	private String image_name;
	private String title;
	private String content;
	private String name;
	private int view_count;
	private Date postdate;
	
	public recipeDTO() {}

	public recipeDTO(int idx, String image_name, String title, String content, String name, int view_count,
			Date postdate) {
		Idx = idx;
		this.image_name = image_name;
		this.title = title;
		this.content = content;
		this.name = name;
		this.view_count = view_count;
		this.postdate = postdate;
	}

	public int getIdx() {
		return Idx;
	}

	public void setIdx(int idx) {
		Idx = idx;
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

	public Date getPostdate() {
		return postdate;
	}

	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}

}
