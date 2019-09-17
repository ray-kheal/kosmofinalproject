package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

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
	

}
