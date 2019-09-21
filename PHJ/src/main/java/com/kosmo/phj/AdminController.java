package com.kosmo.phj;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.PHJCommandImpl;
import command.admin.AdBoardListCommand;
import command.admin.AdBoardListEditCommand;
import command.admin.AdBoardListViewCommand;
import command.admin.AdBoardListWriteActionCommand;
import command.admin.AdEventListCommand;
import command.admin.AdEventListWriteActionCommand;
import command.admin.AdPlaceListCommand;
import command.admin.AdProductListCommand;
import command.admin.MemberListCommand;
import command.member.LoginActionCommand;
import model.board.noticeDTO;
import model.board.serviceDTO;
import model.member.MemberDAO;
import model.member.MemberDTO;
@Controller
public class AdminController {
	
	PHJCommandImpl command = null;
	
	@RequestMapping("/admin/index.do")
	public String index() {
		return "admin/index";
	}
	@RequestMapping("/admin/pages/charts/chartjs.do")
	public String chartjs() {
		return "admin/pages/charts/chartjs";
	}
	@RequestMapping("/admin/pages/forms/basic_elements.do")
	public String basic_elements() {
		return "admin/pages/forms/basic_elements";
	}
	
	@RequestMapping("/admin/pages/icons/mdi.do")
	public String mdi() {
		return "admin/pages/icons/mdi";
	}
	
	@RequestMapping("/admin/pages/samples/blank-page.do")
	public String blank_page() {
		return "admin/pages/samples/blank-page";
	}
	
	@RequestMapping("/admin/pages/samples/error-404.do")
	public String error_404() {
		return "admin/pages/samples/error-404";
	}
	
	@RequestMapping("/admin/pages/samples/error-500.do")
	public String error_500() {
		return "admin/pages/samples/error-500";
	}
	
	
	
	@RequestMapping("/admin/pages/tables/basic-table.do")
	public String basic_table() {
		return "admin/pages/tables/basic-table";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////// 회원관련
	
	//관리자계정 로그인페이지 진입
	@RequestMapping("/admin/pages/samples/login.do")
	public String login() {
		return "admin/pages/samples/login";
	}
	
	//로그인작업 수행
	@RequestMapping("admin/adminLogin.do")
	public String adminLogin(Model model, HttpServletRequest req) {
		String page = null;
		
		String email = req.getParameter("email");
		String pass = req.getParameter("pass");
		
		MemberDAO dao = new MemberDAO();
		System.out.println("memberinfo 실행 전 email, pass값 : " + email +", "+ pass);
		MemberDTO dto = dao.memberInfo(email, pass);
		
		if(dto.getEmail() == null) {
			System.out.println("로그인재시도 로그");
			model.addAttribute("loginError","일치하는 회원정보가 없습니다.");
			page = "redirect:./pages/samples/login.do";		
		} else {
			model.addAttribute("req",req);
			model.addAttribute("dto",dto);
			command = new LoginActionCommand();
			command.execute(model);
			
			page="admin/index";
		}
		
		return page;
	}
	
	//로그아웃 처리
	@RequestMapping("/admin/adminLogout.do")
	public String logout(HttpServletRequest req, HttpSession session) {
		
		session = req.getSession();

		session.invalidate();
		
		return "redirect:./pages/samples/login.do";
	}
	
	//관리자계정 가입페이지
	@RequestMapping("/admin/pages/samples/register.do")
	public String register() {
		
		
		return "admin/pages/samples/register";
	}
	
	
	
	//회원관리 페이지
	@RequestMapping("/admin/pages/tables/memberManagement.do")
	public String memberManagement(Model model, HttpServletRequest req) throws IOException {
		
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req",req);
		
		command = new MemberListCommand();
		command.execute(model);
		
		System.out.println("member 익스큐트 실행");
		
		return "admin/pages/tables/memberManagement";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////// 상품관리
	
	//상품관리 페이지
	@RequestMapping("/admin/pages/tables/productManagement.do")
	public String productManagement(Model model, HttpServletRequest req) throws IOException{
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req",req);
		
		command = new AdProductListCommand();
		command.execute(model);
		
		System.out.println("product 익스큐트 실행");
		return "admin/pages/tables/productManagement";
	}
	//상품글쓰기 페이지
	@RequestMapping("/admin/pages/tables/productManagementWrite.do")
	public String productManagementWrite() {
		return "admin/pages/tables/productManagementWrite";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////// 점포관리
	//점포관리 페이지
	@RequestMapping("/admin/pages/tables/placeManagement.do")
	public String placeManagement(Model model, HttpServletRequest req) throws IOException{
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req",req);
		
		command = new AdPlaceListCommand();
		command.execute(model);
		
		System.out.println("place 익스큐트 실행");
		return "admin/pages/tables/placeManagement";
	}
	
	//점포등록 페이지
	@RequestMapping("/admin/pages/tables/placeManagementWrite.do")
	public String placeManagementWrite() {
		return "admin/pages/tables/placeManagementWrite";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////// 공지사항관리
	
	//공지사항관리 페이지
	@RequestMapping("/admin/pages/tables/boardManagement.do")
	public String boardManagement(Model model, HttpServletRequest req) throws IOException{
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req",req);
		model.addAttribute("board_type",1);
		
		command = new AdBoardListCommand();
		command.execute(model);
		
		System.out.println("board 익스큐트 실행");
		
		return "admin/pages/tables/boardManagement";
	}
	
	//공지사항상세보기 페이지
	@RequestMapping("/admin/pages/tables/boardManagementView.do")
	public String boardManagementView(Model model, HttpServletRequest req) throws IOException{
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req",req);
		model.addAttribute("board_type",1);
		
		command = new AdBoardListViewCommand();
		command.execute(model);
		
		System.out.println("boardView 익스큐트 실행");
		
		return "admin/pages/tables/boardManagementView";
	}
	//공지사항수정하기 페이지
	@RequestMapping("/admin/pages/tables/boardManagementEdit.do")
	public String boardManagementEdit(Model model, HttpServletRequest req) throws IOException{
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req",req);
		model.addAttribute("board_type",1);
		
		command = new AdBoardListEditCommand();
		command.execute(model);
		
		System.out.println("boardEdit 익스큐트 실행");
		
		return "admin/pages/tables/boardManagementEdit";
	}
	//공지사항글쓰기 페이지
	@RequestMapping("/admin/pages/tables/boardManagementWrite.do" )
	public String boardManagementWrite(Model model) throws IOException {
		System.out.println("write 호출됨");
		return "admin/pages/tables/boardManagementWrite";
	}
	//공지사항글쓰기 액션
	@RequestMapping(value="/admin/pages/tables/boardManagementWriteAction.do", method=RequestMethod.POST )
	public String boardManagementWriteAction(Model model,HttpServletRequest req,noticeDTO noticeDTO) throws IOException {
		
		System.out.println("writeAction 호출됨");
		int board_type = Integer.parseInt(req.getParameter("board_type"));
		System.out.println("board_type:"+board_type);
		
		model.addAttribute("req",req);
		model.addAttribute("noticeDTO",noticeDTO);
		command = new AdBoardListWriteActionCommand();
		command.execute(model);
		
			return "redirect:./boardManagement.do";
		
		}
		
		/*String board_type = req.getParameter("board_type");
		System.out.println("board_type:"+board_type);
		
		model.addAttribute("req",req);
		model.addAttribute("noticeDTO",noticeDTO);
		command = new AdBoardListWriteActionCommand();
		command.execute(model);
		if(board_type=="1") {
			return "redirect:./boardManagement.do";
			
		}else {
			return "redirect:./eventManagement.do";
		}*/
		
	
	/*@RequestMapping(value="/admin/pages/tables/boardManagementWriteAction.do",method=RequestMethod.POST )
	public String boardManagementWriteAction(Model model,HttpServletRequest req,noticeDTO noticeDTO) {
		
		System.out.println("writeAction 호출됨");
		String nowPage = req.getParameter("nowPage");
		model.addAttribute("req",req);
		model.addAttribute("noticeDTO",noticeDTO);
		command = new WriteActionCommand();
		command.execute(model);
		
		return "admin/pages/tables/boardManagement.do?nowPage="+nowPage;
		
	}
	*/
	 
	
	
	//////////////////////////////////////////////////////////////////////////////////////// 이벤트관리
	//이벤트 게시판 관리 페이지
	@RequestMapping("/admin/pages/tables/eventManagement.do")
	public String eventManagement(Model model, HttpServletRequest req) throws IOException {
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req",req);
		model.addAttribute("board_type",2);
		
		command = new AdEventListCommand();
		command.execute(model);
		
		System.out.println("event 익스큐트 실행");
		return "admin/pages/tables/eventManagement";
	}
	//이벤트 게시판 쓰기 페이지
	@RequestMapping("/admin/pages/tables/eventManagementWrite.do")
	public String eventManagementWrite(Model model) throws IOException {
		System.out.println("eventwrite 호출됨");
	
		return "admin/pages/tables/eventManagementWrite";
	}
	//이벤트글쓰기 액션
	@RequestMapping(value="/admin/pages/tables/eventManagementWriteAction.do", method=RequestMethod.POST )
	public String eventManagementWriteAction(Model model,HttpServletRequest req,noticeDTO noticeDTO) throws IOException {
		
		System.out.println("eventwriteAction 호출됨");
		int board_type = Integer.parseInt(req.getParameter("board_type"));
		System.out.println("board_type:"+board_type);
		
		model.addAttribute("req",req);
		model.addAttribute("noticeDTO",noticeDTO);
		command = new AdEventListWriteActionCommand();
		command.execute(model);
		
			return "redirect:./eventManagement.do";
		
		}
	//이벤트 게시판 상세보기 페이지
	@RequestMapping("/admin/pages/tables/eventManagementView.do")
	public String eventManagementView(Model model, HttpServletRequest req) throws IOException {
		req.setCharacterEncoding("UTF-8");
		model.addAttribute("req",req);
		model.addAttribute("board_type",2);
		
		command = new AdBoardListViewCommand();
		command.execute(model);
		
		System.out.println("eventboardView 익스큐트 실행");
		return "admin/pages/tables/eventdManagementView";
	}
	
	//////////////////////////////////////////////////////////////////////////////////////// 레시피관리
	//레시피 게시판 관리 페이지
	@RequestMapping("/admin/pages/tables/recipeManagement.do")
	public String recipeManagement() {
		return "admin/pages/tables/recipeManagement";
	}
	
	
	
	
	
	

}
