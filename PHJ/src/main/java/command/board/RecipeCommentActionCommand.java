package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.commentDAO;
import model.board.commentDTO;

public class RecipeCommentActionCommand implements PHJCommandImpl{

	@Override
	public void execute(Model model) {
		//파라미터 한번에 전달받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = (HttpSession)paramMap.get("session");
		commentDTO dto = (commentDTO)paramMap.get("commentDTO");
		
		String email = session.getAttribute("EMAIL").toString();	
		dto.setB_code(Integer.parseInt(req.getParameter("idx")));
		dto.setWriter(req.getParameter("writer"));
		dto.setContent(req.getParameter("content"));
	
		dto.setEmail(email);
		commentDAO dao = new commentDAO();
		
		dao.write(dto);
		
		System.out.println("RecipeCommenAction 익스큐드실행");
		
	
	}
	
}
