package model.notify;

public class NotifyDTO {

	private String mobile_alert;
	private String place_bookmark;
	private String products_bookmark;
	private int stock;
	private int stock_backup;
	private String fcm_token;
	private String place_name;
	private String place_name2;
	private String product_name;

	public NotifyDTO() {

	}

	public NotifyDTO(String mobile_alert, String place_bookmark, String products_bookmark, int stock, int stock_backup,
			String fcm_token, String place_name, String place_name2, String product_name) {
		super();
		this.mobile_alert = mobile_alert;
		this.place_bookmark = place_bookmark;
		this.products_bookmark = products_bookmark;
		this.stock = stock;
		this.stock_backup = stock_backup;
		this.fcm_token = fcm_token;
		this.place_name = place_name;
		this.place_name2 = place_name2;
		this.product_name = product_name;
	}

	public String getMobile_alert() {
		return mobile_alert;
	}

	public void setMobile_alert(String mobile_alert) {
		this.mobile_alert = mobile_alert;
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

	public int getStock() {
		return stock;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}

	public int getStock_backup() {
		return stock_backup;
	}

	public void setStock_backup(int stock_backup) {
		this.stock_backup = stock_backup;
	}

	public String getFcm_token() {
		return fcm_token;
	}

	public void setFcm_token(String fcm_token) {
		this.fcm_token = fcm_token;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getPlace_name2() {
		return place_name2;
	}

	public void setPlace_name2(String place_name2) {
		this.place_name2 = place_name2;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

}
