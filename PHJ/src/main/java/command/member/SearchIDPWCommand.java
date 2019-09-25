package command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;

public class SearchIDPWCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//폼값받기
		String name = req.getParameter("name");
		String mobile = req.getParameter("mobile1")+"-"+req.getParameter("mobile2")+"-"+req.getParameter("mobile3");
		
		
		//dto객체에 폼값저장하기
		MemberDTO dto = new MemberDTO();
		dto.setName(name);
		dto.setMobile(mobile);
		
		
		MemberDAO dao = new MemberDAO();
		dao.searchID(dto);
	}

}
