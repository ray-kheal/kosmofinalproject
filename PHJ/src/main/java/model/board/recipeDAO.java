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

import model.member.MemberDTO;

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
	
	//인기게시물
	public ArrayList<recipeDTO> popular_recipe(Map<String, Object> map) {
		
		
		//공지사항 게시판에서 조회높은 순으로 정렬 후 상위 3개만 가져오기
		String query = "  SELECT * FROM ( " 
					+ " SELECT * FROM PHJ_BOARD_RECIPE order by view_count desc "  
					+" ) WHERE ROWNUM <= 3 ";
					
		
		return (ArrayList<recipeDTO>) template.query(query, new BeanPropertyRowMapper<recipeDTO>(recipeDTO.class));
		
	}
	
	//게시물 수 카운트
	public int getTotalCount(Map<String, Object> map) {	
		System.out.println("getTotalCount() 호출");
	
		String sql = " SELECT COUNT(*) FROM PHJ_BOARD_RECIPE ";
		
		if(map.get("searchWord")!=null) {
			sql += " WHERE "+map.get("searchColumn")+" LIKE '%"+map.get("searchWord")+"%' ";
		}
		
		System.out.println("sql = " +sql);
		
		return template.queryForObject(sql, Integer.class);
	}
	
	public void write(final recipeDTO recipeDTO) {
		System.out.println("요기도 들어오나??");

		template.update(new PreparedStatementCreator() {
		
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {

				String sql = "INSERT INTO PHJ_BOARD_RECIPE(idx, title,name, content, thumbnail)"
						+ "VALUES(SEQ_PHJ_BOARD_NOTICE.NEXTVAL, ?, ?,?, ?)";


				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, recipeDTO.getTitle());
				psmt.setString(2, recipeDTO.getName());	
				psmt.setString(3, recipeDTO.getContent());	
				psmt.setString(4, recipeDTO.getThumbnail());

					
				System.out.println("dao의 write - title:"+recipeDTO.getTitle()+"/content:"+recipeDTO.getContent()+"email:" +recipeDTO.getEmail() );
				return psmt;
			}
		});
	}
	
	
	//*****************************************************어드민용
	//레코드 페이지별로 가져오기(어드민용)
	public ArrayList<recipeDTO> ad_list(Map<String, Object> map) {
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String query = " SELECT * FROM( "
				+"    SELECT Tb.*, ROWNUM rNum FROM( " 
				+ "      SELECT * FROM PHJ_BOARD_RECIPE  order by postdate desc";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += ") Tb ) WHERE rNum BETWEEN "+start+" AND "+end ;

		System.out.println(map);
		
		return (ArrayList<recipeDTO>)template.query(query, new BeanPropertyRowMapper<recipeDTO>(recipeDTO.class));
	}
	
	//상세보기
	public recipeDTO view(String idx) {
		// 조회수 증가
		updateHit(idx);

		recipeDTO dto = null;

		String sql = "select * from PHJ_BOARD_RECIPE where idx= " + idx;
		try {

			dto = template.queryForObject(sql, new BeanPropertyRowMapper<recipeDTO>(recipeDTO.class));
		} catch (Exception e) {
			System.out.println("view()실행시 예외발생");
			dto = new recipeDTO();
		}
		return dto;
	}	
	
	public void updateHit(final String idx) {
		String sql = "update PHJ_BOARD_RECIPE set VIEW_COUNT = VIEW_COUNT+1 where idx=?";
		
		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(idx));
			}
		});
	}
	public void updateRecommend(final String idx) {
		String sql = "update PHJ_BOARD_RECIPE set BTNRECOMMEND = BTNRECOMMEND+1 where idx=?";
		System.out.println("들어왔니2 : " + idx);
		
		template.update(sql, new PreparedStatementSetter() {			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(idx));
			}
		});

	}
}
