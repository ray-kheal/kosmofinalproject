package command.member;

import java.io.BufferedReader;
import java.io.FileReader;
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
		HttpServletRequest req = (HttpServletRequest) map.get("req");
		HttpServletResponse resp = (HttpServletResponse) map.get("resp");

		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile1") + "-" + req.getParameter("mobile2") + "-"
				+ req.getParameter("mobile3");

		String pass = new MemberDAO().pwFind(email, mobile).toString();
		
		model.addAttribute("resultPass", pass);
		System.out.println("pass값 : " + pass);
		pass = String.valueOf(map.get("resultPass"));
	}
}
