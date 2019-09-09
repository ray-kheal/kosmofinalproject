package member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

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
		String sql = "SELECT * FROM cs_member WHERE email = '" + email + "' AND pass= '"+pass+"' ";
		try {
			dto = template.queryForObject(sql, new BeanPropertyRowMapper<MemberDTO>(MemberDTO.class));
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 가져오기 실행시 예외발생.");
			dto = new MemberDTO();
		}
		return dto;
	}
	

}
