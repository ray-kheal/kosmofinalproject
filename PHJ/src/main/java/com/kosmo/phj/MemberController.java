package com.kosmo.phj;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import command.PHJCommandImpl;
import command.member.LoginActionCommand;
import command.member.MemberEditCommand;
import command.member.ModifyCommand;
import command.member.RegistCommand;
import command.member.emailOverlapCommand;
import command.member.emailFindActionCommand;
import model.member.MemberDAO;
import model.member.MemberDTO;
@Controller
public class MemberController {
	
	PHJCommandImpl command = null;
	
	@RequestMapping("/login.do")
	public String login() {
		return "member/login";
	}
	
	//로그인 처리
	@RequestMapping("/loginAction.do")
	public String loginAction(Model model, HttpServletRequest req, HttpServletResponse resp) {
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
			if(dto.getMembertype().equals("master")) {
				System.out.println("관리자가 일반페이지에 접근함.");
				model.addAttribute("loginError","관리자님! 관리자페이지에서 로그인 해주세요!");
				page = "member/login";		
			} else {
				model.addAttribute("req",req);
				model.addAttribute("dto",dto);
				model.addAttribute("resp",resp);
				command = new LoginActionCommand();
				command.execute(model);
				
				page="redirect:../phj";
			}
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
	public String kakaologin(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse resp)  {
		String page = null;
		System.out.println("카카오로그인 아이디 : "+ req.getParameter("kakao_id"));
		String kakao_id = req.getParameter("kakao_id");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		MemberDAO dao = new MemberDAO();
		int isKakaoMember = dao.isKakaoMember(kakao_id);
		
		if(isKakaoMember == 0) {
			MemberDTO dto = new MemberDTO();
			dto.setEmail(email);
			dto.setKakao_id(kakao_id);
			dto.setName(name);
			
			model.addAttribute("dto",dto);
			model.addAttribute("req",req);
			resp.setContentType("text/html; charset=utf-8");
			try {
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('카카오 최초 로그인 시도 시 회원정보 추가 기입을 해주셔야 합니다..');</script>");
				out.flush();
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			page = "member/join02";
			
		} else if(isKakaoMember ==1 ) {
			session.setAttribute("EMAIL", req.getParameter("email"));  
			session.setAttribute("KAKAO_ID", req.getParameter("kakao_id"));
			session.setAttribute("NAME", req.getParameter("name"));
			page = "redirect:../phj";
		}
		
		return page;
	}
	
	//구글로그인 매핑
	@RequestMapping(value="/googlelogin.do",method=RequestMethod.GET)
	public String googlelogin(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse resp) throws IOException {
		String page = null;
		System.out.println("구글로그인 아이디 : "+ req.getParameter("google_id"));
		String google_id = req.getParameter("google_id");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		
		MemberDAO dao = new MemberDAO();
		int isGoogleMember = dao.isGoogleMember(google_id);
		
		if(isGoogleMember == 0) {
			MemberDTO dto = new MemberDTO();
			dto.setEmail(email);
			dto.setGoogle_id(google_id);
			dto.setName(name);
			
			model.addAttribute("dto",dto);
			resp.setContentType("text/html; charset=utf-8");
			PrintWriter out = resp.getWriter();
			out.println("<script>alert('구글 최초 로그인 시도 시 회원정보 추가 기입을 해주셔야 합니다..');</script>");
			out.flush();
			
			page = "member/join02";
		}
		else if(isGoogleMember == 1) {
			session.setAttribute("EMAIL", req.getParameter("email"));
			session.setAttribute("GOOGLE_ID", req.getParameter("google_id")); 
			session.setAttribute("NAME", req.getParameter("name"));
			
			page = "redirect:../phj";
		}
		
		return page;
	}
	
	//이메일 중복검사!
	@RequestMapping("emailOverLap.do")
	public void emailOverLap(Model model, HttpServletRequest req, HttpServletResponse resp) {
		
		String email = req.getParameter("email");
		System.out.println("ajax를 통하여 받은 이메일주소 : " + email);
		model.addAttribute("email",email);
		model.addAttribute("resp",resp);
		command = new emailOverlapCommand();
		command.execute(model);
	}
	
	
	//회원가입
	@RequestMapping(value="/regist.do",method=RequestMethod.POST)
	public String regist(Model model, HttpServletRequest req){
		model.addAttribute("req",req);
		command = new RegistCommand();
		command.execute(model);
		
		model.addAttribute("name",req.getParameter("name"));
		
		return "member/join03";
	}
	
	
	
	//회원정보수정페이지 진입(수정폼)
	@RequestMapping("/memberEdit.do")
	public String memberEdit(Model model, HttpServletRequest req) {
		model.addAttribute("req",req);
		command = new MemberEditCommand();
		command.execute(model);
		
		System.out.println("excute 완료");
		
		
		return "member/memberEdit";
	}
	
	//회원정보수정
	@RequestMapping(value="/modify.do", method=RequestMethod.POST)
	public String modify(Model model, HttpServletRequest req, MemberDTO dto) {
		model.addAttribute("req",req);
		model.addAttribute("memberDTO", dto);
		command = new ModifyCommand();
		command.execute(model);
		
		return "redirect:../phj";
	}
	

	//아이디 / 비밀번호 찾기 진입 메소드
	@RequestMapping("/accountfind.do")
	public String accountfind() {
		return "member/accountfind";
	}


	


}
