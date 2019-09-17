package com.kosmo.phj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public String notice() {
		return "general/notice";
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
	public String qna() {
		return "general/qna";
	}
	
	//이벤트 게시판
	@RequestMapping("event.do")
	public String event() {
		return "general/event";
	}
		
	//재고 게시판
	@RequestMapping("findproduct.do")
	public String findproduct() {
		return "general/findproduct";
	}
	

	
}
