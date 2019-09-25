package com.kosmo.phj;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.swing.plaf.multi.MultiFileChooserUI;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import command.PHJCommandImpl;
import command.board.EditActionCommand;
import command.board.QnAViewCommand;
import command.board.RecipeEditActionCommand;
import command.board.ViewCommand;
import command.board.WriteActionCommand;
import model.board.recipeDTO;
import model.board.serviceDTO;


@Controller
public class boardController {
	PHJCommandImpl command = null;

	// 공지사항 상세보기
	@RequestMapping("view.do")
	public String view(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);

		command = new command.board.ViewCommand();

		command.execute(model);
		return "general/view";
	}

	// 이벤트 게시판 상세보기
	@RequestMapping("Eview.do")
	public String event_view(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		command = new ViewCommand();
		command.execute(model);
		return "general/event_view";
	}

	// QnA 상세보기
	@RequestMapping("qna_view.do")
	public String qna_view(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		command = new QnAViewCommand();
		command.execute(model);
		return "general/qna_view";
	}

	// QnA게시판 글쓰기
	@RequestMapping("write.do")
	public String write(Model model) {
		System.out.println("write() 메소드 호출됨");
		return "general/QnAwrite";
	}

	@RequestMapping(value = "writeAction.do", method = RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, serviceDTO serviceDTO) throws IOException {
		req.setCharacterEncoding("UTF-8");
		System.out.println("action 호출됨");
		model.addAttribute("req", req);
		model.addAttribute("serviceDTO.", serviceDTO);
		command = new WriteActionCommand();
		command.execute(model);
		return "redirect:qna.do?nowPage=1";
	}

	// 답글 달기
	@RequestMapping("reply.do")
	public String reply(HttpServletRequest req, Model model) {
		System.out.println("reply() 메소드 호출됨");

		model.addAttribute("req", req);
		command = new command.board.ReplyCommand();
		command.execute(model);

		model.addAttribute("idx", req.getParameter("idx"));
		return "general/reply";
	}

	@RequestMapping("replyAction.do")
	public String replyAction(HttpServletRequest req, Model model, serviceDTO serviceDTO) {
		System.out.println("replyAction() 메소드 호출");
		// 답변글쓰기폼에서 폼값을 커맨드객체를 이용하여 한번에 받아 전달하기
		model.addAttribute("serviceDTO", serviceDTO);

		model.addAttribute("req", req);
		command = new command.board.replyActionCommand();
		command.execute(model);

		model.addAttribute("nowPage", req.getParameter("nowPage"));

		return "redirect:qna.do";
	}

	// 수정하기
	@RequestMapping("edit.do")
	public String edit(Model model, HttpServletRequest req) {
		System.out.println("write() 메소드 호출됨");

		model.addAttribute("req", req);
		command = new command.board.EditCommand();
		command.execute(model);

		return "general/edit";
	}

	@RequestMapping("editAction.do")
	public String EditAction(HttpServletRequest req, Model model, serviceDTO serviceDTO) {

		// 커맨드객체로 받은 폼값 확인하기
		System.out.println("serviceDTO[제목] = " + serviceDTO.getTitle());
		model.addAttribute("req", req);
		model.addAttribute("serviceDTO", serviceDTO);
		command = new EditActionCommand();
		command.execute(model);

		// redirect를 이용해서 페이지 이동을 할때 쿼리스트링을 연결하려면 아래와 같이 model에 속성을 저장하면 된다. 즉
		// view/do?idx=nowPage=xx와 같은 형태로 이동한다.
		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));

		// 뷰 호출이 아니고 페이지 이동
		return "redirect:qna.do";
	}

	// 삭제하기
	@RequestMapping("delete.do")
	public String delete(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		command = new command.board.DeleteActionCommand();
		command.execute(model);

		model.addAttribute("nowPage", req.getParameter("nowPage"));
		return "redirect:qna.do";

	}
	
	//레시피 게시판 글쓰기 
	@RequestMapping("ReditAction.do")
	public String RecipeEditAction(HttpServletRequest req, Model model, recipeDTO recipeDTO) {

		// 커맨드객체로 받은 폼값 확인하기
		model.addAttribute("req", req);
		model.addAttribute("recipeDTO", recipeDTO);
		command = new RecipeEditActionCommand();
		command.execute(model);

		model.addAttribute("idx", req.getParameter("idx"));
		model.addAttribute("nowPage", req.getParameter("nowPage"));

		// 뷰 호출이 아니고 페이지 이동
		return "redirect:recipe.do";
	}
	
	/*
	  @RequestMapping(value="/imageUpload",method=RequestMethod.POST)
	  @ResponseBody
	  public String imageUpload(MultipartHttpServletRequest req) throws IOException{
		  MultiValueMap<String, MultipartFile> multiFileMap = req.getMultiFileMap();
		  List<MultipartFile> list = multiFileMap.get(FILE);
		  
	  }

	
	
	*/
}
;