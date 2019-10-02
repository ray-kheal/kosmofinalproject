package com.kosmo.phj;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.PHJCommandImpl;
import command.admin.AdBoardDeleteActionCommand;
import command.admin.AdBoardListCommand;
import command.admin.AdBoardListEditActionCommand;
import command.admin.AdBoardListEditCommand;
import command.admin.AdBoardListViewCommand;
import command.admin.AdBoardListWriteActionCommand;
import command.admin.AdEventListCommand;
import command.admin.AdEventListWriteActionCommand;
import command.admin.AdPlaceListCommand;
import command.admin.AdProductDeleteActionCommand;
import command.admin.AdProductListCommand;
import command.admin.AdQnaListCommand;
import command.admin.AdQnaListViewCommand;
import command.admin.AdRecipeListCommand;
import command.admin.AdRecipeListViewCommand;
import command.admin.AdRegistCommand;
import command.admin.AdReplyCommand;
import command.admin.Index_memberListCommand;
import command.admin.Index_noticeListCommand;
import command.admin.Index_qnaListCommand;
import command.admin.Index_recipeListCommand;
import command.admin.AdReplyActionCommand;
import command.admin.AdMemberListCommand;
import command.member.LoginActionCommand;
import command.member.RegistCommand;
import model.board.noticeDTO;
import model.board.serviceDTO;
import model.member.MemberDAO;
import model.member.MemberDTO;
@Controller
public class AdminController {
	
	PHJCommandImpl command = null;
	
	@RequestMapping("/admin/index.do")
	public String index(Model model,HttpServletRequest req) {
		model.addAttribute("req",req);
		
		command = new Index_memberListCommand();
		command.execute(model);
		
		command = new Index_qnaListCommand();
		command.execute(model);
		
		command = new Index_recipeListCommand();
		command.execute(model);
		
		command = new Index_noticeListCommand();
		model.addAttribute("board_type",1);
		command.execute(model);

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
	
	//관리자계정회원가입
	@RequestMapping(value="/admin/pages/samples/adminRegist.do",method=RequestMethod.POST)
	public String regist(Model model, HttpServletRequest req,MemberDTO memberDTO){
		
		model.addAttribute("req",req);
		model.addAttribute("memberDTO",memberDTO);
		command = new AdRegistCommand();
		command.execute(model);
		
		return "redirect:./login.do";
	}
	
	
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
		
		command = new AdMemberListCommand();
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
	
	//상품 삭제하기
	@RequestMapping("/admin/pages/tables/productDelete.do")
	public String productDelete(Model model, HttpServletRequest req) {
		
		System.out.println("delete 호출됨");
		
		model.addAttribute("req", req);
		command = new AdProductDeleteActionCommand();
		command.execute(model);

		String nowPage = req.getParameter("nowPage");
		String product_code = req.getParameter("product_code");
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("product_code", product_code);
		
		System.out.println("delete컨트롤러의product_code:"+product_code);
		
		return "redirect:./productManagement.do?";

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
	//공지사항수정하기액션 페이지
	@RequestMapping("/admin/pages/tables/boardManagementEditAction.do")
	public String boardManagementEditAction(Model model, HttpServletRequest req,noticeDTO noticeDTO) throws IOException{
		model.addAttribute("req",req);
		
		command = new AdBoardListEditActionCommand();
		command.execute(model);
		
		System.out.println("boardEditAction 익스큐트 실행");
		
			return "redirect:./boardManagement.do";
		
		// 뷰 호출이 아니고 페이지 이동
		
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
	//공지사항 삭제하기
	@RequestMapping("/admin/pages/tables/boardDelete.do")
	public String delete(Model model, HttpServletRequest req) {
		
		System.out.println("delete 호출됨");
		
		model.addAttribute("req", req);
		command = new AdBoardDeleteActionCommand();
		command.execute(model);

		String nowPage = req.getParameter("nowPage");
		model.addAttribute("nowPage", nowPage);
		//model.addAttribute("board_type", board_type);
		
		
		return "redirect:./boardManagement.do?nowPage="+nowPage;
		//return "redirect:./boardManagement.do?nowPage="+nowPage+"&board_type="+board_type;

	}
	
	
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
	
	//이벤트 게시판 수정하기 페이지
	@RequestMapping("/admin/pages/tables/eventManagementEdit.do")
	public String eventManagementEdit(Model model, HttpServletRequest req) throws IOException{
		model.addAttribute("req",req);
		model.addAttribute("board_type",2);
		
		command = new AdBoardListEditCommand();
		command.execute(model);
		
		System.out.println("boardEdit 익스큐트 실행");
		
		return "admin/pages/tables/eventManagementEdit";
	}
	//이벤트 게시판 수정하기액션 페이지
	@RequestMapping("/admin/pages/tables/eventManagementEditAction.do")
	public String eventManagementEditAction(Model model, HttpServletRequest req,noticeDTO noticeDTO) throws IOException{
		model.addAttribute("req",req);
	
		
		command = new AdBoardListEditActionCommand();
		command.execute(model);
		
		System.out.println("boardEditAction 익스큐트 실행");
		
			return "redirect:./eventManagement.do";
		
		// 뷰 호출이 아니고 페이지 이동
		
	}
		
		
	//////////////////////////////////////////////////////////////////////////////////////// 레시피관리
	//레시피 게시판 관리 페이지
	@RequestMapping("/admin/pages/tables/recipeManagement.do")
	public String recipeManagement(Model model, HttpServletRequest req) throws IOException {
		model.addAttribute("req", req);
		command = new AdRecipeListCommand();
		command.execute(model);
		return "admin/pages/tables/recipeManagement";
	}
	//레시피 게시판 상세보기 페이지
		@RequestMapping("/admin/pages/tables/recipeManagementView.do")
		public String recipeManagementView(Model model, HttpServletRequest req) throws IOException {
			model.addAttribute("req",req);
			command = new AdRecipeListViewCommand();
			command.execute(model);
			
			System.out.println("qnaManagementView 익스큐트 실행");
			return "admin/pages/tables/recipeManagementView";
		}
	//////////////////////////////////////////////////////////////////////////////////////// QnA 관리
	//QnA 게시판 관리 페이지
	@RequestMapping("/admin/pages/tables/qnaManagement.do")
	public String qnaManagement(Model model, HttpServletRequest req) throws IOException {
		model.addAttribute("req", req);
		command = new AdQnaListCommand();
		command.execute(model);
		return "admin/pages/tables/qnaManagement";
	}
	
	//QnA 게시판 상세보기 페이지
	@RequestMapping("/admin/pages/tables/qnaManagementView.do")
	public String qnaManagementView(Model model, HttpServletRequest req) throws IOException {
		model.addAttribute("req",req);
		
		command = new AdQnaListViewCommand();
		command.execute(model);
		
		System.out.println("qnaManagementView 익스큐트 실행");
		return "admin/pages/tables/qnaManagementView";
	}
	
	// 답글 달기
	@RequestMapping("/admin/pages/tables/qnaReply.do")
	public String qnaReply(HttpServletRequest req, Model model) throws IOException {
		System.out.println("reply() 메소드 호출됨");

		model.addAttribute("req", req);
		command = new AdReplyCommand();
		command.execute(model);

		model.addAttribute("idx", req.getParameter("idx"));
		return "admin/pages/tables/qnaReply";
	}
	
	
	// 답글 달기 액션
	@RequestMapping("/admin/pages/tables/qnaReplyAction.do")
	public String qnaReplyAction(HttpServletRequest req, Model model, serviceDTO serviceDTO) throws IOException {
		System.out.println("replyAction() 메소드 호출");
		// 답변글쓰기폼에서 폼값을 커맨드객체를 이용하여 한번에 받아 전달하기
		model.addAttribute("serviceDTO", serviceDTO);

		model.addAttribute("req", req);
		command = new AdReplyActionCommand();
		command.execute(model);

		System.out.println("qnaReplyAction 익스큐트 실행");
		
		model.addAttribute("nowPage", req.getParameter("nowPage"));

		return "redirect:./qnaManagement.do";
	}

	
}
