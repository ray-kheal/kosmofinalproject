package command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;

public class MemberEditCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		System.out.println("memberEditCommand -> execute()진입");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("EMAIL");
				
		MemberDAO dao = new MemberDAO();
		
		//session에 저장된 이메일 정보를 통하여 회원정보 가져오기.
		MemberDTO dto = dao.memberView(email);
		
		System.out.println("회원이름 : " + dto.getName());
		System.out.println("회원등급 : " + dto.getMembertype());
		model.addAttribute("dto",dto);
		
	}

}
