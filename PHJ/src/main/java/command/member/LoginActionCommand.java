package command.member;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;

public class LoginActionCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		System.out.println("LoginActionCommand -> execute()메소드 호출 로그");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpServletResponse resp = (HttpServletResponse)paramMap.get("resp");
		
		MemberDTO dto = (MemberDTO)paramMap.get("dto");
		
		HttpSession session = req.getSession();
		
		MemberDAO dao = new MemberDAO();
		
		if(dto.getMembertype().equals("master")) {
			session.setAttribute("ADMINEMAIL", dto.getEmail());
			session.setAttribute("ADMINNAME", dto.getName());
			session.setAttribute("ADMINPASS", dto.getPass());
			session.setAttribute("MEMBERTYPE", dto.getMembertype());
			
		} else if (dto.getMembertype().equals("normal")){
			session.setAttribute("EMAIL", dto.getEmail());
			session.setAttribute("PASS", dto.getPass());
			session.setAttribute("NAME", dto.getName());
			session.setAttribute("ALERT", dto.getMobile_alert());
			session.setAttribute("MEMBERTYPE", dto.getMembertype());
			session.setAttribute("PLACE_BOOKMARK", dto.getPlace_bookmark());
			session.setAttribute("PRODUCTS_BOOKMARK", dto.getProducts_bookmark());
		}
		
	}

}
