package command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;

public class RegistCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//폼값받기
		String email = req.getParameter("email1")+"@"+req.getParameter("email2");
		String email_alert = req.getParameter("email_alert");
		String name = req.getParameter("name");
		String pass = req.getParameter("pass");
		String mobile = req.getParameter("mobile1")+"-"+req.getParameter("mobile2")+"-"+req.getParameter("mobile3");
		String mobile_alert = req.getParameter("mobile_alert");
		
		//dto객체에 폼값저장하기
		MemberDTO dto = new MemberDTO();
		dto.setEmail(email);
		dto.setEmail_alert(email_alert);
		dto.setName(name);
		dto.setPass(pass);
		dto.setMobile(mobile);
		dto.setMobile_alert(mobile_alert);
		
		MemberDAO dao = new MemberDAO();
		dao.regist(dto);
	}

}
