package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.kosmo.phj.JdbcTemplateConst;

public class commentDAO {

	JdbcTemplate template;

	// 생성자
	public commentDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("commentDAO() 생성자 호출");
	}

	public int getTotalCount(Map<String, Object> map, int idx) {
		System.out.println("getTotalCount() 메소드 실행.");
		String query = " SELECT COUNT(*) FROM phj_recipe_comment  where b_code=" + idx;

		return template.queryForObject(query, Integer.class);
	}

	public ArrayList<commentDTO> list(Map<String, Object> map) {
		System.out.println("list() 메서드 진입");

		String sql = "SELECT * FROM phj_recipe_comment where b_code= " + map.get("b_code");
		sql += " order by c_code asc";

		return (ArrayList<commentDTO>) template.query(sql, new BeanPropertyRowMapper<commentDTO>(commentDTO.class));
	}

	// 댓글쓰기 처리
	public void write(final commentDTO commentDTO) {

		System.out.println("요기는 들어오나????");
		template.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "INSERT INTO phj_recipe_comment(c_code, b_code, writer, content, comment_date,email)"
						+ "VALUES(seq_comment.NEXTVAL, ?, ?, ?,sysdate,? )";

				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setInt(1, commentDTO.getB_code());
				psmt.setString(2, commentDTO.getWriter());
				psmt.setString(3, commentDTO.getContent());
				psmt.setString(4, commentDTO.getEmail());
				return psmt;
			}
		});
	}

	// 댓글리스트
	public ArrayList<commentDTO> commentList(Map<String, Object> map, String b_code) {
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());

		commentDTO dto;

		String sql = " SELECT * FROM (SELECT tb.*, rownum rNum FROM (SELECT * FROM PHJ_RECIPE_COMMENT WHERE b_code = "
				+ b_code;
		// + " SELECT * FROM PHJ_RECIPE_COMMENT WHERE b_code = " + b_code;
		sql += " ORDER BY c_code DESC ) tb) WHERE rNum BETWEEN " + start + " AND " + end;

//		sql += " order by c_code desc";
		// System.out.println(sql);

		return (ArrayList<commentDTO>) template.query(sql, new BeanPropertyRowMapper<commentDTO>(commentDTO.class));

	}
	public void delete(final String idx) {
		String sql = "delete from PHJ_RECIPE_COMMENT where b_code=? ";
		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {

				ps.setString(1, idx);
			}
		});
	}
}
