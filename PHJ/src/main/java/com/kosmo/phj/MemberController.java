package com.kosmo.phj;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import command.LoginActionCommand;
import command.PHJCommandImpl;
import command.RegistCommand;
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
	
	//회원가입페이지 진입(가입폼)
	@RequestMapping("/join2.do")
	public String join2() {
		return "member/join02";
	}
	
	//카카오로그인 매핑
	@RequestMapping(value="/kakaologin.do",method=RequestMethod.GET)
	public String kakaologin(HttpServletRequest req, HttpSession session) {
		System.out.println("카카오로그인 이메일 : "+ req.getParameter("email"));
		
		session.setAttribute("EMAIL", req.getParameter("email"));
		session.setAttribute("PASS", req.getParameter("pass"));
		session.setAttribute("NAME", req.getParameter("name"));
		return "redirect:../phj";
	}
	
	//구글로그인 매핑
	@RequestMapping(value="/googlelogin.do",method=RequestMethod.GET)
	public String googlelogin(HttpServletRequest req, HttpSession session) {
		System.out.println("구글로그인 이메일 : "+ req.getParameter("email"));
		
		session.setAttribute("EMAIL", req.getParameter("email"));
		session.setAttribute("PASS", req.getParameter("pass")); 
		session.setAttribute("NAME", req.getParameter("name"));
		return "redirect:../phj";
	}
	
	//회원가입
	@RequestMapping(value="/regist.do",method=RequestMethod.POST)
	public String regist(Model model, HttpServletRequest req) throws IOException {
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req",req);
		command = new RegistCommand();
		command.execute(model);
		
		model.addAttribute("name",req.getParameter("name"));
		
		return "member/join03";
	}
}
