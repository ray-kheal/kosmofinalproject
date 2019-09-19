package model.product;

public class ProductDTO {

	private int product_code;
	private String product_name;
	private int product_price;
	private String product_value_code;
	private int virtualNum; // 가상번호
	
	public ProductDTO() {}
	public ProductDTO(int product_code, String product_name, int product_price, String product_value_code,
			int virtualNum) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_value_code = product_value_code;
		this.virtualNum = virtualNum;
	}
	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_value_code() {
		return product_value_code;
	}
	public void setProduct_value_code(String product_value_code) {
		this.product_value_code = product_value_code;
	}
	public int getVirtualNum() {
		return virtualNum;
	}
	public void setVirtualNum(int virtualNum) {
		this.virtualNum = virtualNum;
	}
	
	
	
}
