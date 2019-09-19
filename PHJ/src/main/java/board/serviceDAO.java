package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.kosmo.phj.JdbcTemplateConst;


public class serviceDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	JdbcTemplate template;	
	public serviceDAO() {
		this.template = JdbcTemplateConst.template;
	}
	public int getTotalCount(Map<String, Object> map) {
		System.out.println("getTotalCount() 메소드 실행.");
		
		String query = " SELECT COUNT(*) FROM PHJ_BOARD_SERVICE";
//	      if (map.get("Word") != null) {
//	         query += "WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%'";
//	      }
		return template.queryForObject(query, Integer.class);
	}
	
	public ArrayList<serviceDTO> list(Map<String, Object> map) {

		int start = 1;
		int end = 10;
		String query = " SELECT * FROM( " + "    SELECT Tb.*, ROWNUM rNum FROM( " + "      SELECT * FROM PHJ_BOARD_SERVICE ";

		if (map.get("Word") != null) {

			query += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}

		query += " ORDER BY bgroup DESC, bstep asc ) Tb ) WHERE rNum BETWEEN " + start + " AND " + end;

		return (ArrayList<serviceDTO>) template.query(query,
				new BeanPropertyRowMapper<serviceDTO>(serviceDTO.class));
	}
	public serviceDTO view(String idx) {
		// 조회수 증가
		updateHit(idx);

		serviceDTO dto = null;

		String sql = "select * from PHJ_BOARD_SERVICE where idx= " + idx;
		try {

			dto = template.queryForObject(sql, new BeanPropertyRowMapper<serviceDTO>(serviceDTO.class));
		} catch (Exception e) {
			System.out.println("view()실행시 예외발생");
			dto = new serviceDTO();
		}

		return dto;
	}
	public void updateHit(final String idx) {
		String sql = "update PHJ_BOARD_SERVICE set VIEW_COUNT = VIEW_COUNT+1 where idx=?";
		
		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(idx));
			}
		});

	}
}
