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
		commentDTO dto = (commentDTO)paramMap.get("commentDTO");
		
		
		
		//폼값받기
		
		//int b_code = dto.getB_CODE();
		//String writer = dto.getWRITER();
		//String content = dto.getCONTENT();
		
		//System.out.println("b_code : "+b_code+ "name: " + writer+" content : " +content );
		
		dto.setB_code(Integer.parseInt(req.getParameter("idx")));
		System.out.println("idx : "+req.getParameter("idx"));
		dto.setWriter(req.getParameter("writer"));
		dto.setContent(req.getParameter("content"));
		
		//커맨드객체 받아서 확인하기
		
		commentDAO dao = new commentDAO();
		
		dao.write(dto);
		
		System.out.println("RecipeCommenAction 익스큐드실행");
		
	
	}
	
}
