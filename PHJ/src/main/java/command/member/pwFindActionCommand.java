package command.member;

import java.util.HashMap;
import java.util.Map;

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
		
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile1")+"-"+req.getParameter("mobile2")+"-"+req.getParameter("mobile3");

		String pass = new MemberDAO().pwFind(email, mobile).toString();

		for(int i=0; i<4; i++) { 
			int rndVal = (int)(Math.random() * 62); 
			
			if(rndVal < 10) { 
				pass += rndVal; 
			} 
			else if(rndVal > 35) { 
				pass += (char)(rndVal + 61); 
			} 
			else { 
				pass += (char)(rndVal + 55); 
			} 
		}

		System.out.println(pass);

		Map<String,String> findContent = new HashMap<String,String>();

		findContent.put("fromEmail","pwyank10321@naver.com");
		findContent.put("toEmail",req.getParameter("email"));
		/*
		 * findContent.put("subject",req.getParameter("subject"));
		 * findContent.put("contents",req.getParameter("contents"));
		 */
		
		model.addAttribute("resultPass", pass);
	}
}
