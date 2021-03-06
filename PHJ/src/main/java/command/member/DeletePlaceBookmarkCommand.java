package command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;

public class DeletePlaceBookmarkCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		HttpSession session = (HttpSession)map.get("session");
		
		String email = session.getAttribute("EMAIL").toString();
		
		MemberDAO dao = new MemberDAO();
		int result = dao.deletePlaceBookmark(email);
		session.removeAttribute("PLACE_BOOKMARK");
		
		model.addAttribute("result",result);
		
	}
	

}
