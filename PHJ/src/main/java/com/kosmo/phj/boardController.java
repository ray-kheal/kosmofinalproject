package com.kosmo.phj;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class boardController {
	
	/*
	 * board.command.BbsCommandImpl command = null;
	 * 
	 * @RequestMapping("/general/notice.do") public String list(Model model,
	 * HttpServletRequest req) {
	 * 
	 * return "general/notice"; }
	 */
	/*
	 * //게시판 글쓰기.
	 * 
	 * @RequestMapping("/board/write.do") public String write(Model model) {
	 * 
	 * System.out.println("write()메소드 호출됨."); return "06Board/write"; } //게시판 글쓰기 처리
	 * 
	 * @RequestMapping(value="/board/writeAction.do", method=RequestMethod.POST)
	 * public String writeAction(Model model,HttpServletRequest req, SpringBbsDTO
	 * springBbsDTO) { model.addAttribute("req",req);
	 * model.addAttribute("springBbsDTO", springBbsDTO); command = new
	 * WriteActionCommand(); command.execute(model);
	 * 
	 * 
	 * return "redirect:list.do?nowPage=1"; }
	 * 
	 * //게시글 상세보기
	 * 
	 * @RequestMapping("/board/view.do") public String view(Model model,
	 * HttpServletRequest req) { model.addAttribute("req",req); command = new
	 * ViewCommand(); command.execute(model);
	 * 
	 * return "06Board/view"; }
	 * 
	 * //수정 삭제전 패스워드 확인페이지
	 * 
	 * @RequestMapping("/board/password.do") public String password(Model model,
	 * HttpServletRequest req) { model.addAttribute("idx",req.getParameter("idx"));
	 * return "06Board/password"; }
	 * 
	 * //패스워드를 전송 후 검증
	 * 
	 * @RequestMapping("/board/passwordAction.do") public String
	 * passwordAction(Model model, HttpServletRequest req) { String modePage = null;
	 * 
	 * //파라미터받기 String mode = req.getParameter("mode"); String idx =
	 * req.getParameter("idx"); String nowPage = req.getParameter("nowPage"); String
	 * pass = req.getParameter("pass");
	 * 
	 * //커넥션풀을 이용한 DAO SpringBbsDAO dao = new SpringBbsDAO(); int rowExist =
	 * dao.password(idx,pass); dao.close();
	 * 
	 * if(rowExist<=0) { model.addAttribute("isCorrMsg","패스워드가 일치하지 않습니다.");
	 * model.addAttribute("idx",idx);
	 * 
	 * modePage = "06Board/password"; } else { if(mode.equals("edit")) { //수정이면
	 * 수정폼으로 이동한다. model.addAttribute("req",req); command = new EditCommand();
	 * command.execute(model);
	 * 
	 * modePage = "06Board/edit"; } else if(mode.equals("delete")) { //삭제시 삭제액션 호출.
	 * model.addAttribute("req",req); command = new DeleteActionCommand();
	 * command.execute(model);
	 * 
	 * model.addAttribute("nowPage",req.getParameter("nowPage")); modePage =
	 * "redirect:list.do"; } System.out.println("패스워드 일치 로그"); } return modePage; }
	 * 
	 * @RequestMapping("/board/editAction.do") public String
	 * EditAction(HttpServletRequest req, Model model, SpringBbsDTO springBbsDTO) {
	 * 
	 * //커맨드객체로 받은 폼값 확인하기 System.out.println("springBbsDTO[제목] : " +
	 * springBbsDTO.getTitle());
	 * 
	 * model.addAttribute("req",req);
	 * model.addAttribute("springBbsDTO",springBbsDTO); command = new
	 * EditActionCommand(); command.execute(model);
	 * 
	 * //redirect를 이용해서 페이지 이동을 할 때 쿼리스트링을 연결하려면 아래와 같이 model에 속성을 저장하면 된다. //즉,
	 * view.do?idx=xx&nowPage=xx와 같은 형태로 이동한다.
	 * model.addAttribute("idx",req.getParameter("idx"));
	 * model.addAttribute("nowPage",req.getParameter("nowPage")); //뷰호출이 아니고 페이지이동임.
	 * return "redirect:view.do"; }
	 * 
	 * //답변글쓰기 폼
	 * 
	 * @RequestMapping("/board/reply.do") public String reply(HttpServletRequest
	 * req, Model model) {
	 * 
	 * System.out.println("reply()메소드 호출"); model.addAttribute("req", req); command
	 * = new ReplyCommand(); command.execute(model);
	 * 
	 * model.addAttribute("idx",req.getParameter("idx")); return "06Board/reply"; }
	 * 
	 * @RequestMapping("board/replyAction.do") public String
	 * replyAction(HttpServletRequest req, Model model, SpringBbsDTO springBbsDTO) {
	 * 
	 * System.out.println("replyAction()메소드 호출"); //답변글쓰기폼에서 폼값을 커맨드객체를 이용하여 한번에 받아
	 * 전달하기. model.addAttribute("springBbsDTO",springBbsDTO);
	 * model.addAttribute("req",req);
	 * 
	 * command = new ReplyActionCommand(); command.execute(model);
	 * 
	 * model.addAttribute("nowPage",req.getParameter("nowPage")); return
	 * "redirect:list.do"; }
	 * 
	 */
}
