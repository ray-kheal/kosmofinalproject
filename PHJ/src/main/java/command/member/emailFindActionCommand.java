package command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;

public class emailFindActionCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//폼값받기
		String name = req.getParameter("name");
		String mobile = req.getParameter("mobile1")+"-"+req.getParameter("mobile2")+"-"+req.getParameter("mobile3");
		
		System.out.println("가져온 mobile값 : " + mobile);
		
		MemberDAO dao = new MemberDAO();
		String email = dao.emailFind(name, mobile);
		System.out.println("쿼리실행후 email : " + email);
		
		model.addAttribute("resultEmail",email);
	}

}
