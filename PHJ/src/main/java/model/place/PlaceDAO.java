package model.place;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kosmo.phj.JdbcTemplateConst;

import command.PHJCommandImpl;


public class PlaceDAO {
	
	//멤버변수
	JdbcTemplate template;
	
	//생성자
	public PlaceDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("PlaceDAO()생성자 호출");
	}
	
	//전체 수 카운트
	public int getTotalCount(Map<String, Object> map) {
		System.out.println("getTotalCount() 메소드 실행.");
		
		String query = " SELECT COUNT(*) FROM PHJ_PLACE ";

		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		return template.queryForObject(query, Integer.class);
		
	}
	
	//전체 수 카운트
		public int getPlaceCount(double distance,double latTxt,double lngTxt) {
			System.out.println("getTotalCount() 메소드 실행.");
			
			String query = "SELECT " + 
					"		count(*) " + 
					"	FROM " + 
					"		phj_place " + 
					"	WHERE " + 
					"		trunc(to_number(DISTNACE_WGS84("+latTxt+","+lngTxt+",latitude, longitude))*10,5)<= " + distance + 
					//"		AND ROWNUM BETWEEN 1 and 20 " + 
					"	ORDER BY " + 
					"		trunc(to_number(DISTNACE_WGS84("+latTxt+","+lngTxt+",latitude, longitude))*10,5) ASC ";
			
			return template.queryForObject(query, Integer.class);
			
		}
	
	//레코드 페이지별로 가져오기
	public ArrayList<PlaceDTO> list(Map<String, Object> map) {
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String query = " SELECT * FROM( "
				+"    SELECT Tb.*, ROWNUM rNum FROM( " 
				+ "      SELECT * FROM PHJ_PLACE ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += ") Tb ) WHERE rNum BETWEEN "+start+" AND "+end;

		System.out.println(map);
		
		return (ArrayList<PlaceDTO>)template.query(query, new BeanPropertyRowMapper<PlaceDTO>(PlaceDTO.class));	
	}
	
	//반경검색 쿼리
	public ArrayList<PlaceDTO> searchRadius(double distance,double latTxt,double lngTxt, int start, int end){
		String query = 
				" SELECT * FROM ( " +
					" SELECT tb.*, rownum rNum from (" + 
						" SELECT " + 
							" place_name, place_name2, place_address, latitude, longitude, " + 
							" trunc(to_number(DISTNACE_WGS84("+latTxt+","+lngTxt+",latitude, longitude))*10,5) AS disKM, ROWNUM AS virtualNum " + 
						" FROM phj_place " + 
						" WHERE trunc(to_number(DISTNACE_WGS84("+latTxt+","+lngTxt+",latitude, longitude))*10,5)<= " + distance + 
						" ORDER BY disKM asc " +
					" ) tb " +
				" ) where rNum BETWEEN "+start+" AND "+end;
		System.out.println("query = " + query);
		return (ArrayList<PlaceDTO>)template.query(query, new BeanPropertyRowMapper<PlaceDTO>(PlaceDTO.class));
	}
	
	//점포코드로 편의점 검색 쿼리.
	public PlaceDTO searchPlace(int place_code) {
		
		String query = "SELECT * FROM phj_place where place_code = " + place_code;
		
		return(PlaceDTO)template.queryForObject(query, new BeanPropertyRowMapper<PlaceDTO>(PlaceDTO.class));
		
	}
}
