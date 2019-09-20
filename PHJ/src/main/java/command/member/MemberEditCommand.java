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
		System.out.println("메일수신 : " + dto.getEmail_alert() +", 문자수신 : "+ dto.getMobile_alert());
		model.addAttribute("dto",dto);
		//전화번호는 여기서 3부분으로 쪼개서 model에 넣음.
		String[] mobileArr = dto.getMobile().split("-");
		model.addAttribute("mobile1",mobileArr[0]);
		model.addAttribute("mobile2",mobileArr[1]);
		model.addAttribute("mobile3",mobileArr[2]);
		
		//메일수신동의여부, SMS수신여부도 여기서 처리.
		if(dto.getEmail_alert().equals("Y")) {
			model.addAttribute("emailY","checked");
		} else {
			model.addAttribute("emailN","checked");
		}
		
		if(dto.getMobile_alert()=="Y") {
			model.addAttribute("mobileY","checked");
		} else {
			model.addAttribute("mobileN","checked");
		}
		
	}

}
