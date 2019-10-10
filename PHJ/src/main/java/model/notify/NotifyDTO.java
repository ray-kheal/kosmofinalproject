package model.notify;

public class NotifyDTO {

	private String mobile_alert;
	private String place_bookmark;
	private String products_bookmark;
	private int stock;
	private int stock_backup;
	private String fcm_token;

	public NotifyDTO() {
		
	}

	public NotifyDTO(String mobile_alert, String place_bookmark, String products_bookmark, int stock, int stock_backup,
			String fcm_token) {
		super();
		this.mobile_alert = mobile_alert;
		this.place_bookmark = place_bookmark;
		this.products_bookmark = products_bookmark;
		this.stock = stock;
		this.stock_backup = stock_backup;
		this.fcm_token = fcm_token;
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
	
	

	
}
