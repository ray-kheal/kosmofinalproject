package command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;

public class PlaceBookmarkCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		HttpSession session = (HttpSession)map.get("session");
		
		String email = session.getAttribute("EMAIL").toString();
		String placeCode = req.getParameter("place_code");
		
		MemberDAO dao = new MemberDAO();
		int result = dao.placeBookmark(email, placeCode);
		session.setAttribute("PLACE_BOOKMARK", placeCode);
		
		model.addAttribute("result",result);
		
	}
	

}
