package board;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class recipeDAO {
	
	JdbcTemplate template;
	
	//생성자
	public recipeDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("JDBCTemplateDAO() 생성자 호출");
	}
	
	public void close() {}
	
	public ArrayList<recipeDTO> list(Map<String, Object> map) {
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String sql = "SELECT * FROM (SELECT tb.*, rownum rNum FROM (SELECT * FROM phj_board_recipe ";
		
		if(map.get("Word")!=null) {
			sql += "WHERE "+map.get("Column")+" LIKE '%"+map.get("Word")+"%' ";
		}
		
		sql += " ORDER BY bgroup DESC, bstep ASC ) tb) WHERE rNum BETWEEN "+start+" AND "+end;
		
		return (ArrayList<recipeDTO>)template.query(sql, new BeanPropertyRowMapper<recipeDTO>(recipeDTO.class));
	}
	
	//게시물 수 카운트
	public int getTotalCount(Map<String, Object> map) {
		
		String sql = "SELECT COUNT(*) FROM phj_board_recipe";
		
		if(map.get("Word")!=null) {
			sql += "WHERE "+map.get("Coulmn")+" LIKE '%"+map.get("Word")+"%' ";
		}
		
		return template.queryForObject(sql, Integer.class);
	}
}
