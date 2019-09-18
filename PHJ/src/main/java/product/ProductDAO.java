package product;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.kosmo.phj.JdbcTemplateConst;

 

public class ProductDAO {
	//멤버변수
		JdbcTemplate template;
		
		//생성자
		public ProductDAO() {
			this.template = JdbcTemplateConst.template;
			System.out.println("JDBCTemplateDAO()생성자 호출");
		}
		
		//게시물 수 카운트
		public int getTotalCount(Map<String, Object> map) {
			System.out.println("getTotalCount() 메소드 실행.");
			
			String query = " SELECT COUNT(*) FROM PHJ_PRODUCT ";

			if (map.get("searchWord") != null) {
				query += "WHERE " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%'";
			}
			
			return template.queryForObject(query, Integer.class);
			
		}
		
		//레코드 페이지별로 가져오기
		public ArrayList<ProductDTO> list(Map<String, Object> map) {
			
			int start = Integer.parseInt(map.get("start").toString());
			int end = Integer.parseInt(map.get("end").toString());
			
			String query = " SELECT * FROM( "
					+"    SELECT Tb.*, ROWNUM rNum FROM( " 
					+ "      SELECT * FROM PHJ_PRODUCT ";

			if (map.get("searchWord") != null) {
				query += " WHERE " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
			}
			query += ") Tb ) WHERE rNum BETWEEN "+start+" AND "+end;

			System.out.println(map);
			
			return (ArrayList<ProductDTO>)template.query(query, new BeanPropertyRowMapper<ProductDTO>(ProductDTO.class));
			
			
		}
}