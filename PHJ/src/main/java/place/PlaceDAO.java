package place;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.kosmo.phj.JdbcTemplateConst;

import command.PHJCommandImpl;


public class PlaceDAO {
	
	//멤버변수
	JdbcTemplate template;
	
	//생성자
	public PlaceDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("JDBCTemplateDAO()생성자 호출");
	}
	
	//게시물 수 카운트
	public int getTotalCount(Map<String, Object> map) {
		System.out.println("getTotalCount() 메소드 실행.");
		
		String query = " SELECT COUNT(*) FROM PHJ_PLACE ";

//		if (map.get("Word") != null) {
//			query += "WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%'";
//		}
		
		return template.queryForObject(query, Integer.class);
		
	}
	
	//레코드 페이지별로 가져오기
	public ArrayList<PlaceDTO> list(Map<String, Object> map) {
		
		int start = 1;
		int end = 10;
		
		String query = " SELECT * FROM( "
				+"    SELECT Tb.*, ROWNUM rNum FROM( " 
				+ "      SELECT * FROM PHJ_PLACE ";

		if (map.get("Word") != null) {
			query += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}
		query += ") Tb ) WHERE rNum BETWEEN "+start+" AND "+end;

		System.out.println(map);
		
		return (ArrayList<PlaceDTO>)template.query(query, new BeanPropertyRowMapper<PlaceDTO>(PlaceDTO.class));
		
		
	}
}
