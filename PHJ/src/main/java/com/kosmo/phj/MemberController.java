package com.kosmo.phj;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import command.LoginActionCommand;
import command.PHJCommandImpl;
import member.MemberDAO;
import member.MemberDTO;
@Controller
public class MemberController {
	
	PHJCommandImpl command = null;
	
	@RequestMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	//로그인 처리
	@RequestMapping("/loginAction.do")
	public String loginAction(Model model, HttpServletRequest req) {
		String page = null;
		
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		MemberDAO dao = new MemberDAO();
		System.out.println("memberinfo 실행 전 email, pass값 : " + email +", "+ pass);
		MemberDTO dto = dao.memberInfo(email, pass);
		
		if(dto.getEmail() == null) {
			System.out.println("로그인재시도 로그");
			model.addAttribute("loginError","일치하는 회원정보가 없습니다.");
			page = "member/login";		
		} else {
			model.addAttribute("req",req);
			model.addAttribute("dto",dto);
			command = new LoginActionCommand();
			command.execute(model);
			
			page="redirect:../phj";
		}
		
		return page;
	}
	//로그아웃 처리
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest req, HttpSession session) {
		
		session = req.getSession();

		session.invalidate();
		
		return "redirect:../phj";
	}
	
	//회원가입페이지 진입(약관)
	@RequestMapping("/join1.do")
	public String join1() {
		return "member/join01";
	}
	
	//회원가입페이지 진입(약관)
		@RequestMapping("/join2.do")
		public String join2() {
			return "member/join02";
		}
}
