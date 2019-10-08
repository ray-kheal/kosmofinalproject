package model.product;

public class ProductDTO {

	private int product_code;
	private String product_name;
	private int product_price;
	private String product_value;
	private int virtualNum; // 가상번호
	private String product_imagename;


	
	public ProductDTO() {}
	public ProductDTO(int product_code, String product_name, int product_price, String product_value,
			int virtualNum, String product_imagename) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_value = product_value;
		this.virtualNum = virtualNum;
		this.product_imagename = product_imagename;
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
	public String getProduct_value() {
		return product_value;
	}

	public void setProduct_value(String product_value) {
		this.product_value = product_value;
	}

	public int getVirtualNum() {
		return virtualNum;
	}

	public void setVirtualNum(int virtualNum) {
		this.virtualNum = virtualNum;
	}
	public String getProduct_imagename() {
		return product_imagename;
	}
	public void setProduct_imagename(String product_imagename) {
		this.product_imagename = product_imagename;
	}
	
	
}
