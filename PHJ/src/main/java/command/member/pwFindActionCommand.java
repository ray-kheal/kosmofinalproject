package command.member;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;

public class pwFindActionCommand implements PHJCommandImpl {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		HttpServletResponse resp = (HttpServletResponse)map.get("resp");
		
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile1")+"-"+req.getParameter("mobile2")+"-"+req.getParameter("mobile3");

		String pass = new MemberDAO().pwFind(email, mobile).toString();
		String rndPass = "";
		System.out.println("pass값"+pass);
		for(int i=0; i<4; i++) { 
			int rndVal = (int)(Math.random() * 62); 
			
			if(rndVal < 10) { 
				rndPass += rndVal; 
			} 
			else if(rndVal > 35) { 
				rndPass += (char)(rndVal + 61); 
			} 
			else { 
				rndPass += (char)(rndVal + 55); 
			} 
		}
		
		try {
			if(pass == "ERROR") {
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('회원 정보가 없습니다.');</script>");
				out.flush();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("rndPass"+rndPass);
		model.addAttribute("resultPass", pass);
		pass = String.valueOf(map.get("resultPass"));
	}
}
