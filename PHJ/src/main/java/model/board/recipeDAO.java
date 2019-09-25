package model.board;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.kosmo.phj.JdbcTemplateConst;

public class recipeDAO {
	
	JdbcTemplate template;
	
	//생성자
	public recipeDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("recipeDAO() 생성자 호출");
	}
	
	public void close() {}
	
	public ArrayList<recipeDTO> list(Map<String, Object> map) {
		System.out.println("list() 메서드 진입");
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = "SELECT * FROM (SELECT tb.*, rownum rNum FROM (SELECT * FROM phj_board_recipe ";
		
		if(map.get("Word")!=null) {
			sql += "WHERE "+map.get("Column")+" LIKE '%"+map.get("Word")+"%' ";
		}
		
		sql += " ORDER BY recommend DESC, postdate DESC ) tb) WHERE rNum BETWEEN "+start+" AND "+end+" ORDER BY recommend DESC, postdate DESC";
		
		return (ArrayList<recipeDTO>)template.query(sql, new BeanPropertyRowMapper<recipeDTO>(recipeDTO.class));
	}
	
	//게시물 수 카운트
	public int getTotalCount(Map<String, Object> map) {	
		System.out.println("getTotalCount() 호출");
	
		String sql = "";
		
		sql += " SELECT COUNT(*) FROM phj_board_recipe ";
		
		if(map.get("Word")!=null) {
			sql += " WHERE "+map.get("Coulmn")+" LIKE '%"+map.get("Word")+"%' ";
		}
		
		System.out.println("sql = " +sql);
		
		return template.queryForObject(sql, Integer.class);
	}
	public void write(final recipeDTO recipeDTO) {

		template.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "INSERT INTO phj_board_recipe(idx, name, title, IMAGE_NAME,content)"
						+ "VALUES(SEQ_PHJ_BOARD_SERVICE.NEXTVAL, ?, ?, ?, ?)";

				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, recipeDTO.getName());
				psmt.setString(2, recipeDTO.getTitle());
				psmt.setString(3, recipeDTO.getImage_name());
				psmt.setString(4, recipeDTO.getContent());
				return psmt;
			}
		});
	}
		  
}
