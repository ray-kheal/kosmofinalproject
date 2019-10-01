package command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;

public class AdRegistCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String name = req.getParameter("name");
		String pass = req.getParameter("pass1");
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		String membertype = req.getParameter("membertype");
		
		//dto객체에 폼값저장하기
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		dto.setPass(pass);
		dto.setEmail(email);
		dto.setMobile(mobile);
		dto.setMembertype(membertype);
		
		MemberDAO dao = new MemberDAO();
		dao.adminRegist(dto);
	}
		
}
