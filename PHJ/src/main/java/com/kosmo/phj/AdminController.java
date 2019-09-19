package com.kosmo.phj;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import command.MemberListCommand;
import command.PHJCommandImpl;
import command.AdBoardListCommand;
import command.AdBoardListViewCommand;
import command.AdEventListCommand;
import command.AdPlaceListCommand;
import command.AdProductListCommand;
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
	
	@RequestMapping("/admin/pages/samples/login.do")
	public String login() {
		return "admin/pages/samples/login";
	}
	
	@RequestMapping("/admin/pages/samples/register.do")
	public String register() {
		return "admin/pages/samples/register";
	}
	
	@RequestMapping("/admin/pages/tables/basic-table.do")
	public String basic_table() {
		return "admin/pages/tables/basic-table";
	}
	
	//고객관리 페이지
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
	//공지사항글쓰기 페이지
	@RequestMapping("/admin/pages/tables/boardManagementWrite.do")
	public String boardManagementWrite() {
		return "admin/pages/tables/boardManagementWrite";
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
	public String eventManagementWrite() {
		return "admin/pages/tables/eventManagementWrite";
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
