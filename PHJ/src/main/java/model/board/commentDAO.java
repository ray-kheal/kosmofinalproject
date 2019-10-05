package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.kosmo.phj.JdbcTemplateConst;

import model.member.MemberDTO;

public class commentDAO {
	
	JdbcTemplate template;
	
	//생성자
	public commentDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("commentDAO() 생성자 호출");
	}
	
	public void close() {}
	
	public ArrayList<commentDTO> list(Map<String, Object> map) {
		System.out.println("list() 메서드 진입");
		
		String sql = "SELECT * FROM phj_recipe_comment where b_code= " +map.get("b_code");
		 sql += " order by c_code asc";
				 
		
		return (ArrayList<commentDTO>)template.query(sql, new BeanPropertyRowMapper<commentDTO>(commentDTO.class));
	}
	
	
	//댓글쓰기 처리 
	public void write(final commentDTO commentDTO) {
	
		System.out.println("요기는 들어오나????");
		template.update(new PreparedStatementCreator() {
	
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "INSERT INTO phj_recipe_comment(c_code, b_code, writer, content, comment_date)"
						+ "VALUES(seq_comment.NEXTVAL, ?, ?, ?,sysdate )";
	
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setInt(1, commentDTO.getB_code());
				psmt.setString(2, commentDTO.getWriter());	
				psmt.setString(3, commentDTO.getContent());	
				return psmt;
			}
		});
	}
	
	//댓글리스트
	public ArrayList<commentDTO> commentList(String b_code) {
		System.out.println("b_code : " + b_code);
		commentDTO dto;
		
		String sql = " SELECT * FROM PHJ_RECIPE_COMMENT WHERE b_code = " + b_code;
		 sql += " order by c_code";
		System.out.println(sql);
		
		return (ArrayList<commentDTO>)template.query(sql, new BeanPropertyRowMapper<commentDTO>(commentDTO.class));
		
	}
}
