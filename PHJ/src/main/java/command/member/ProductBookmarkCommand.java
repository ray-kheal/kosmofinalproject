package command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;

public class ProductBookmarkCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		HttpSession session = (HttpSession)map.get("session");
		
		String email = session.getAttribute("EMAIL").toString();
		String productCode = "";
		String[] productCode_arr = req.getParameterValues("product_code");
		for(String s : productCode_arr){
			productCode += "," + s;
		}
		
		MemberDAO dao = new MemberDAO();
		int result = dao.productBookmark(email, productCode);
		session.setAttribute("PRODUCTS_BOOKMARK", productCode);
		
		model.addAttribute("result",result);
		
	}
	

}
