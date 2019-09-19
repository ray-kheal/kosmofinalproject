package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.kosmo.phj.JdbcTemplateConst;

import model.member.MemberDTO;

public class MemberDAO {
	
	//멤버변수
	JdbcTemplate template;
	
	//생성자
	public MemberDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("MemberDAO 생성자 호출 로그");
	}
	
	public MemberDTO memberInfo(String email, String pass) {
		MemberDTO dto = null;
		
		System.out.println("memberinfo 내부의 email, pass값 : " + email +", "+ pass);
		String sql = "SELECT * FROM phj_member WHERE email = '" + email + "' AND pass= '"+pass+"' ";
		try {
			dto = template.queryForObject(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 가져오기 실행시 예외발생.");
			dto = new MemberDTO();
		}
		return dto;
	}
	
	//회원등록
	public void regist(final MemberDTO dto) {
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "INSERT INTO phj_member (name, email, email_alert, pass, mobile, mobile_alert) "
						+ "VALUES(?, ?, ?, ?, ?, ?)";
				
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getName());
				psmt.setString(2, dto.getEmail());
				psmt.setString(3, dto.getEmail_alert());
				psmt.setString(4, dto.getPass());
				psmt.setString(5, dto.getMobile());
				psmt.setString(6, dto.getMobile_alert());
				
				return psmt;
			}
		});
		
	}
	
	//전체 수 카운트
	public int getTotalCount(Map<String, Object> map) {
		System.out.println("getTotalCount() 메소드 실행.");
		
		String query = " SELECT COUNT(*) FROM PHJ_MEMBER ";

		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		
		return template.queryForObject(query, Integer.class);
		
	}
		
	//레코드 페이지별로 가져오기
	public ArrayList<MemberDTO> list(Map<String, Object> map) {
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String query = " SELECT * FROM( "
				+"    SELECT Tb.*, ROWNUM rNum FROM( " 
				+ "      SELECT * FROM PHJ_MEMBER ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += ") Tb ) WHERE rNum BETWEEN "+start+" AND "+end;

		System.out.println(map);
		
		return (ArrayList<MemberDTO>)template.query(query, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
		
		
	}
	
}
