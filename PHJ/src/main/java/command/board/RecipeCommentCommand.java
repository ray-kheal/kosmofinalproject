package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.commentDAO;
import model.board.commentDTO;

public class RecipeCommentCommand  implements PHJCommandImpl{

	@Override
	public void execute(Model model) {

		System.out.println("RecipeCommentCommand > execute() 호출"); 
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		
		
		//jdbcTemplate dao
		commentDAO dao = new commentDAO();
		
		commentDTO dto = new commentDTO();
		ArrayList<commentDTO> listRows = dao.list(paramMap);
		System.out.println("command 안 listrow : "+listRows);
		
		//줄바꿈처리
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		
		model.addAttribute("listRows",listRows);
		
	}

}
