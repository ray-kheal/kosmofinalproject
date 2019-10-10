package model.stock;

public class StockDTO {

	private String place_code;
	private String place_name;
	private String place_name2;
	private String product_code;
	private String product_name;
	private String product_price;
	private String product_value;
	private String stock;
	private String stock_backup;
	private int virtualNum; // 가상번호

	public StockDTO() {
		super();
	}

	public StockDTO(String place_code, String place_name, String place_name2, String product_code, String product_name,
			String product_price, String product_value, String stock, int virtualNum, String stock_backup) {

		super();
		this.place_code = place_code;
		this.place_name = place_name;
		this.place_name2 = place_name2;
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_value = product_value;
		this.stock = stock;
		this.stock_backup = stock_backup;
		this.virtualNum = virtualNum;
		this.stock_backup = stock_backup;
	}

	public String getPlace_code() {
		return place_code;
	}

	public void setPlace_code(String place_code) {
		this.place_code = place_code;
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

	public String getProduct_code() {
		return product_code;
	}

	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_price() {
		return product_price;
	}

	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getProduct_value() {
		return product_value;
	}

	public void setProduct_value(String product_value) {
		this.product_value = product_value;
	}

	public String getStock() {
		return stock;
	}

	public void setStock(String stock) {
		this.stock = stock;
	}

	public int getVirtualNum() {
		return virtualNum;
	}

	public void setVirtualNum(int virtualNum) {
		this.virtualNum = virtualNum;
	}

	public String getStock_backup() {
		return stock_backup;
	}

	public void setStock_backup(String stock_backup) {
		this.stock_backup = stock_backup;
	}

}
