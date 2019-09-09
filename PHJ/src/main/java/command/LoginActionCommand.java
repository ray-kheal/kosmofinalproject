package command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import member.MemberDAO;
import member.MemberDTO;

public class LoginActionCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		System.out.println("LoginActionCommand -> execute()메소드 호출 로그");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		MemberDTO dto = (MemberDTO)paramMap.get("dto");
		HttpSession session = req.getSession();
		
		MemberDAO dao = new MemberDAO();
		
		session.setAttribute("EMAIL", dto.getEmail());
		session.setAttribute("PASS", dto.getPass());
		session.setAttribute("NAME", dto.getName());
		session.setAttribute("ALERT", dto.getMobile_alert());

		
	}

}
