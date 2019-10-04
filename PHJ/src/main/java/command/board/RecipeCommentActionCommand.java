package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		commentDTO commentDTO = (commentDTO)paramMap.get("commentDTO");
		
		//폼값받기
		String b_code = req.getParameter("b_code");
		String writer = req.getParameter("writer");
		String content = req.getParameter("content");
			
		//커맨드객체 받아서 확인하기
		
		commentDAO dao = new commentDAO();
		
		dao.write(commentDTO);
		
		System.out.println("RecipeCommenAction 익스큐드실행");
	
	}
	
}
