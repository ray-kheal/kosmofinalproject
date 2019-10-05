package com.kosmo.phj;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import command.PHJCommandImpl;
import command.board.EditActionCommand;
import command.board.QnAViewCommand;
import command.board.RecipeCommentActionCommand;
//import command.board.RecipeCommentCommand;
import command.board.RecipeEditFileActionCommand;
import command.board.RecipeListViewCommand;
import command.board.RecommendCommand;
import command.board.StockListCommand;
import command.board.ViewCommand;
import command.board.WriteActionCommand;
import command.board.findPlaceCommand;
import command.board.recipeListCommand;
import model.board.commentDTO;
import model.board.recipeDAO;

import model.board.recipeDTO;
import model.board.serviceDTO;
import model.member.MemberDTO;


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
	
	
	//재고 상세 보기 
	@RequestMapping("product_view.do")
	public String productView(Model model, HttpServletRequest req){
		model.addAttribute("req",req);
		int product_code = Integer.parseInt(req.getParameter("product_code"));
		System.out.println("컨트롤러 내부의 product_code : " + product_code);
		model.addAttribute("product_code",product_code);
		command = new StockListCommand();
		command.execute(model);
		System.out.println("product 익스큐트 실행완료");
		return "general/product_view";
	}
	
	//재고 관련 편의점 찾기	
	@RequestMapping("findPlace.do")
	public String findPlace(Model model, HttpServletRequest req) {
		model.addAttribute("req",req);
		int product_code = Integer.parseInt(req.getParameter("product_code"));
		int place_code = Integer.parseInt(req.getParameter("place_code"));
		model.addAttribute("place_code",place_code);
		model.addAttribute("product_code",product_code);
		command = new findPlaceCommand();		
		command.execute(model);		
	
		System.out.println("findPlace 익스큐트 실행완료");
		
		return "general/findPlace";
	}
	
	// QnA게시판 글쓰기
	@RequestMapping("write.do")
	public String write(Model model) {
		System.out.println("write() 메소드 호출됨");
		return "general/QnAwrite";
	}

	@RequestMapping(value = "writeAction.do", method = RequestMethod.POST)
	public String writeAction(Model model, HttpServletRequest req, serviceDTO serviceDTO,HttpSession session) throws IOException {
		req.setCharacterEncoding("UTF-8");
		String email = session.getAttribute("EMAIL").toString();
		System.out.println("action 호출됨");
		model.addAttribute("req", req);
		model.addAttribute("session",session);
		model.addAttribute("email",email);
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
	
	
	// 레시피 글쓰기
		@RequestMapping("recipe_edit.do")
	public String Recipewrite(Model model) {
			System.out.println("write() 메소드 호출됨");
		return "general/recipe_edit";
		}
		
	//레시피 게시판 글쓰기 
	@RequestMapping(value="ReditAction.do", method = RequestMethod.POST)
	public String RecipeEditAction(HttpServletRequest req, Model model, recipeDTO dto, HttpSession session) {

		String path = req.getSession().getServletContext().getRealPath("/resources/imageUpload");
		try {
			
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest)req;
			//업로드폼의 file 속성 필드의 이름을 모두 읽음
			Iterator itr = mhsr.getFileNames();
			
			MultipartFile mfile = null;
			String fileName = "";

			//File객체를 통해 물리적 경로로 지정된 디렉토리가 존재하는지 확인 후 없으면 생성한다.
			File directory = new File(path);
			
			if(!directory.isDirectory()) {
				directory.mkdirs();
			}
			
			//업로드폼의 file속성의 필드 갯수만큼 반복
			while(itr.hasNext()) {
				fileName = (String)itr.next();
				
				//서버로 업로드된 임시 파일명 가져오기
				mfile = mhsr.getFile(fileName);
				System.out.println("mfile="+mfile);
				
				//한글깨짐방지 처리 후 업로드된 파일명을 가져옴
				String originalName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8");
				
				if("".equals(originalName)) {
					continue;
				}
				
				//파일의 확장자 가져오기
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				
				//UUID를 통해 생성된 문자열과 확장자 조립
				String saveFileName = getUuid()+ext;
				
				//설정한 경로에 파일저장
				File serverFullName = new File(path + File.separator + saveFileName);
				mfile.transferTo(serverFullName);
				
				dto.setThumbnail(saveFileName);
				model.addAttribute("session",session);
				String email = session.getAttribute("EMAIL").toString();
				model.addAttribute("email",email);
				command = new RecipeEditFileActionCommand();
				command.execute(model);
				
			}
			
		}
		catch(IOException e) {
			e.printStackTrace();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		// 뷰 호출이 아니고 페이지 이동
		return "redirect:recipe.do";
	}
	
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		uuid = uuid.replace("-", "");
		System.out.println("생성된 UUID: "+uuid);
		
		return uuid;
	}
	
	
	//레시피 상세보기 
	@RequestMapping("Rview.do")
	public String recipeView(Model model, HttpServletRequest req) throws IOException{
		model.addAttribute("req", req);
		command = new RecipeListViewCommand();
		command.execute(model);
		return "general/recipe_view";
	}
	
	//레시피 추천수 증가 
	@RequestMapping("recommend.do")
	public String recommend(Model model, HttpServletRequest req) {
		System.out.println("들어왔니?");
		model.addAttribute("req", req);
		
		command = new RecommendCommand();
		command.execute(model);

		model.addAttribute("nowPage", req.getParameter("nowPage"));
		return "redirect:recipe.do";
	}
	
	//레시피 댓글 작성 
	@RequestMapping("recipe_commentAction.do")
	public String recipe_commentAction(Model model, HttpServletRequest req, commentDTO commentDTO) {
		model.addAttribute("req", req);
		model.addAttribute("commentDTO",commentDTO);
		String b_code = req.getParameter("idx");
		command = new RecipeCommentActionCommand();
		command.execute(model);
		model.addAttribute("nowPage", req.getParameter("nowPage"));
		return "redirect:Rview.do?idx="+b_code;
	}

}

