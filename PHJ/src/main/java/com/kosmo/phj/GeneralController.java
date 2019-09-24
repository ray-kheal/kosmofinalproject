package com.kosmo.phj;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.PHJCommandImpl;
import command.placeMapCommand;
import command.admin.AdProductListCommand;
import command.board.ListCommand;
import command.board.ProductListCommand;
import command.board.QnAListCommand;
import command.board.QnAViewCommand;
import command.board.ViewCommand;
import command.board.WriteActionCommand;
import command.board.recipeListCommand;
import model.board.serviceDTO;
import model.place.PlaceDAO;
import model.place.PlaceDTO;


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
	
	//상품관리 게시판

	@RequestMapping("findproduct.do")
	public String findProduct(Model model, HttpServletRequest req){
		model.addAttribute("req",req);
		command = new ProductListCommand();
		command.execute(model);
		
		System.out.println("product 익스큐트 실행");
		return "general/findproduct";
	}
	
	//공지사항게시판
	@RequestMapping("notice.do")
	public String notice(Model model, HttpServletRequest req) {
		model.addAttribute("req",req);
		model.addAttribute("board_type",1);
		
		command = new ListCommand();
		command.execute(model);
		
		return "general/notice";
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

	
	
	//레시피 게시판
	@RequestMapping("recipe.do")
	public String recipe(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		command = new recipeListCommand();
		command.execute(model);
		return "general/recipe";
	}
	
	@RequestMapping("placemap.do")
	public String placemap(Model model, HttpServletRequest req) {
		
		model.addAttribute("req",req);
		command = new placeMapCommand();
		command.execute(model);
		
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

	//트위터
   @RequestMapping("twitter.do")
   public String twitter(Model model) {   

	   return "general/twitter";
   }
	//페이스북

	   @RequestMapping("facebook.do")
	   public String facebook(Model model) {   
		   
		   return "general/facebook";
	   }

	
	
}
