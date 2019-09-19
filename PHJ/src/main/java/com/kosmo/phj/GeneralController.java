package com.kosmo.phj;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import board.command.ListCommand;
import board.command.QnAListCommand;
import command.PHJCommandImpl;

@Controller
public class GeneralController {
	
	PHJCommandImpl command = null;

	@RequestMapping("left-sidebar.do")
	public String left_sidebar() {
		return "general/left-sidebar";
	}
	@RequestMapping("right-sidebar.do")
	public String right_sidebar() {
		return "general/right-sidebar";
	}
	
	@RequestMapping("no-sidebar.do")
	public String no_sidebar() {
		return "general/no-sidebar";
	}
			
	
	//공지사항게시판

	@RequestMapping("notice.do")
	public String notice(Model model, HttpServletRequest req) {
		//System.out.println("컨트롤러 안 진입 성공");
		model.addAttribute("req",req);
		model.addAttribute("board_type",1);
		
		command = new ListCommand();
		command.execute(model);
		
		return "general/notice";
	}
	//공지사항 상세보기
	 @RequestMapping("view.do")
	   public String view(Model model, HttpServletRequest req) {
		   model.addAttribute("req",req);
		   command = new board.command.Viewcommand();
		   command.execute(model);
		   return "general/view";
	   }
	//이벤트 게시판
		@RequestMapping("event.do")
		public String event(Model model, HttpServletRequest req) {
			
			model.addAttribute("req",req);
			model.addAttribute("board_type",2);
			command = new ListCommand();
			command.execute(model);
			
			return "general/event";
		}
		//이벤트 게시판 상섹보기
		 @RequestMapping("Eview.do")
		   public String event_view(Model model, HttpServletRequest req) {
			   model.addAttribute("req",req);
			   command = new board.command.Viewcommand();
			   command.execute(model);
			   return "general/event_view";
		   }
	
	
	//리스트게시판
	@RequestMapping("recipe.do")
	public String recipe() {
		return "general/recipe";
	}
	@RequestMapping("placemap.do")
	public String placemap() {
		return "general/placemap";
	}
	
	@RequestMapping("mail.do")
	public String mailing() {
		return "general/mail";
	}
	//Q&A 게시판
	@RequestMapping("qna.do")
	public String qna(Model model, HttpServletRequest req) {
		model.addAttribute("req",req);
		command = new QnAListCommand();
		command.execute(model);
		return "general/qna";
	}
	
	
		
	//재고 게시판
	@RequestMapping("findproduct.do")
	public String findproduct() {
		return "general/findproduct";
	}
	
	
	
}
