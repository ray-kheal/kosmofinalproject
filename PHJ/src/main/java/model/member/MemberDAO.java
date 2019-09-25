package model.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.kosmo.phj.JdbcTemplateConst;


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
	
	//이메일 중복검사
	public int emailCheck(String email) {
		String sql = "SELECT COUNT(*) FROM phj_member WHERE email = '"+email+"' ";
		System.out.println("sql : " + sql);
		
		return template.queryForObject(sql, Integer.class);
	}
	
	public int isKakaoMember(String kakao_id) {
		String sql = "SELECT COUNT(*) FROM phj_member WHERE kakao_id = '"+kakao_id+"' ";
		System.out.println("sql : " + sql);
		
		return template.queryForObject(sql, Integer.class);
		
	}
	
	public int isGoogleMember(String google_id) {
		String sql = "SELECT COUNT(*) FROM phj_member WHERE google_id = '"+google_id+"' ";
		System.out.println("sql : " + sql);
		
		return template.queryForObject(sql, Integer.class);
		
	}
	
	//회원등록
	public void regist(final MemberDTO dto) {
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "INSERT INTO phj_member (name, email, email_alert, pass, mobile, mobile_alert, kakao_id, google_id) "
						+ "VALUES(?, ?, ?, ?, ?, ?,?,?)";
				
				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, dto.getName());
				psmt.setString(2, dto.getEmail());
				psmt.setString(3, dto.getEmail_alert());
				psmt.setString(4, dto.getPass());
				psmt.setString(5, dto.getMobile());
				psmt.setString(6, dto.getMobile_alert());
				psmt.setString(7, dto.getKakao_id());
				psmt.setString(8, dto.getGoogle_id());
				
				return psmt;
			}
		});
		
	}
	
	//아이디찾기
	public String emailFind(String name, String mobile) {
		
		
		String sql = "SELECT email FROM phj_member WHERE name='"+name+"' AND mobile='"+mobile+"' ";
		System.out.println("sql : " + sql);
		
		return template.queryForObject(sql, String.class);
		
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
		query += ") Tb ) WHERE rNum BETWEEN "+start+" AND "+end +"ORDER BY regidate desc ";

		System.out.println(map);
		
		return (ArrayList<MemberDTO>)template.query(query, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
	}
	
	//회원정보 수정을 위한 회원정보 가져오기
	//위와는 달리 이메일만 일치하면 가져오는 걸로 함.(카카오/구글로그인유저 때메)
	public MemberDTO memberView(String email) { 
		MemberDTO dto =null;
		String query = "SELECT * FROM phj_member WHERE email = '" + email + "'";
		
		System.out.println("쿼리문 : " + query);
		
		try {
			dto = template.queryForObject(query, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("수정폼 회원정보 가져오기 실행시 예외발생.");
			dto = new MemberDTO();
		}
		return dto;
	}
	
	//수정하기
	public void modify(final MemberDTO dto) {
		System.out.println("modify() 호출 : " + dto.getEmail());
		
		String sql = "UPDATE phj_member SET name=?, email_alert=?, pass=?, mobile=?, mobile_alert=? WHERE email=?";
		
		template.update(sql,new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getEmail_alert());
				ps.setString(3, dto.getPass());
				ps.setString(4, dto.getMobile());
				ps.setString(5, dto.getMobile_alert());
				ps.setString(6, dto.getEmail());	
			}
			
		});
		System.out.println("query : " + sql);
	}
	

}
