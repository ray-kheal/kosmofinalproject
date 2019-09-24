package model.place;

public class PlaceDTO {

	private int place_code;
	private String place_name;
	private String place_name2;
	private String place_address;
	private String place_road_addr;
	private String longitude;
	private String latitude;
	private int virtualNum; // 가상번호 부여를 위한 멤버변수 추가
	private String disKM;//지도에서 반경거리 계산할때 쓸것.
	
	public PlaceDTO() {}
	public PlaceDTO(int place_code, String place_name, String place_name2, String place_address, String place_road_addr, String longitude,
			String latitude,int virtualNum, String disKM) {
		super();
		this.place_code = place_code;
		this.place_name = place_name;
		this.place_name2 = place_name2;
		this.place_address = place_address;
		this.place_road_addr = place_road_addr;
		this.longitude = longitude;
		this.latitude = latitude;
		this.virtualNum = virtualNum;
		this.disKM = disKM;
	}

	public int getPlace_code() {
		return place_code;
	}

	public void setPlace_code(int place_code) {
		this.place_code = place_code;
	}

	public String getPlace_name() {
		return place_name;
	}

	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}

	public String getPlace_address() {
		return place_address;
	}

	public void setPlace_address(String place_address) {
		this.place_address = place_address;
	}

	public String getPlace_road_addr() {
		return place_road_addr;
	}

	public void setPlace_road_addr(String place_road_addr) {
		this.place_road_addr = place_road_addr;
	}

	public String getLongitude() {
		return longitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}
	public int getVirtualNum() {
		return virtualNum;
	}
	public void setVirtualNum(int virtualNum) {
		this.virtualNum = virtualNum;
	}
	public String getDisKM() {
		return disKM;
	}
	public void setDisKM(String disKM) {
		this.disKM = disKM;
	}
	public String getPlace_name2() {
		return place_name2;
	}
	public void setPlace_name2(String place_name2) {
		this.place_name2 = place_name2;
	}
	
	
	
}
