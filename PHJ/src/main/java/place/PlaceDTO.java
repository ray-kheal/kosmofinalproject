package place;

public class PlaceDTO {

	private int place_code;
	private String place_name;
	private String place_address;
	private String place_road_addr;
	private String longitude;
	private String latitude;
	
	public PlaceDTO() {}
	public PlaceDTO(int place_code, String place_name, String place_address, String place_road_addr, String longitude,
			String latitude) {
		super();
		this.place_code = place_code;
		this.place_name = place_name;
		this.place_address = place_address;
		this.place_road_addr = place_road_addr;
		this.longitude = longitude;
		this.latitude = latitude;
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
	
	
	
}
