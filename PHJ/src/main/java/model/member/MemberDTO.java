package model.member;

import java.sql.Date;

public class MemberDTO {

	// 회원 멤버변수
	private String membertype;
	private String email;
	private String email_alert;
	private String name;
	private String pass;
	private String mobile;
	private String mobile_alert;
	private java.sql.Date regidate;
	private String place_bookmark;
	private String products_bookmark;
	private int virtualNum; // 가상번호
	private String kakao_id;
	private String google_id;
	private String fcm_token;

	// 기본생성자
	public MemberDTO() {
		super();
	}

	// 인자생성자
	public MemberDTO(String membertype, String email, String email_alert, String name, String pass, String mobile,
			String mobile_alert, Date regidate, String place_bookmark, String products_bookmark, int virtualNum,
			String kakao_id, String google_id, String fcm_token) {
		super();
		this.membertype = membertype;
		this.email = email;
		this.email_alert = email_alert;
		this.name = name;
		this.pass = pass;
		this.mobile = mobile;
		this.mobile_alert = mobile_alert;
		this.regidate = regidate;
		this.place_bookmark = place_bookmark;
		this.products_bookmark = products_bookmark;
		this.virtualNum = virtualNum;
		this.kakao_id = kakao_id;
		this.google_id = google_id;
		this.fcm_token = fcm_token;
	}

	// getter, setter
	public String getMembertype() {
		return membertype;
	}

	public void setMembertype(String membertype) {
		this.membertype = membertype;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMobile_alert() {
		return mobile_alert;
	}

	public void setMobile_alert(String mobile_alert) {
		this.mobile_alert = mobile_alert;
	}

	public java.sql.Date getRegidate() {
		return regidate;
	}

	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}

	public String getPlace_bookmark() {
		return place_bookmark;
	}

	public void setPlace_bookmark(String place_bookmark) {
		this.place_bookmark = place_bookmark;
	}

	public String getProducts_bookmark() {
		return products_bookmark;
	}

	public void setProducts_bookmark(String products_bookmark) {
		this.products_bookmark = products_bookmark;
	}

	public String getEmail_alert() {
		return email_alert;
	}

	public void setEmail_alert(String email_alert) {
		this.email_alert = email_alert;
	}

	public int getVirtualNum() {
		return virtualNum;
	}

	public void setVirtualNum(int virtualNum) {
		this.virtualNum = virtualNum;
	}

	public String getKakao_id() {
		return kakao_id;
	}

	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}

	public String getGoogle_id() {
		return google_id;
	}

	public void setGoogle_id(String google_id) {
		this.google_id = google_id;
	}

	public String getFcm_token() {
		return fcm_token;
	}

	public void setFcm_token(String fcm_token) {
		this.fcm_token = fcm_token;
	}

}
