package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.commentDAO;
import model.board.commentDTO;
import model.board.recipeDAO;
import model.board.recipeDTO;

public class RecipeListViewCommand implements PHJCommandImpl{

	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		int commentNum = Integer.parseInt(idx);
		System.out.println("listview의 idx:"+idx);
		String nowPage = req.getParameter("nowPage");
		
		
		//jdbcTemplate dao
		recipeDAO dao = new recipeDAO();
		
		recipeDTO dto = new recipeDTO();
		
		dto = dao.view(idx); //상세보기
		
		//줄바꿈처리
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		
		
		commentDAO cDao = new commentDAO();
		int totalCommentCount = cDao.getTotalCount(paramMap,commentNum);
		ArrayList<commentDTO> cDto = cDao.commentList(idx); 
		
		System.out.println("갯수 : "+ totalCommentCount);
		model.addAttribute("cDto", cDto);
		model.addAttribute("viewRow",dto);
		model.addAttribute("TotalCount",totalCommentCount);
		//model.addAttribute("page",page);
		model.addAttribute("nowPage",nowPage);
		
	}
}
