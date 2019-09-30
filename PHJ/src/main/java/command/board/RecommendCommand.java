package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.recipeDAO;
import model.board.serviceDAO;

public class RecommendCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//폼값받기
		String idx = req.getParameter("idx");
		//String pass = req.getParameter("pass");
		
		recipeDAO dao = new recipeDAO();
		dao.updateRecommend(idx);
		
	}

}
