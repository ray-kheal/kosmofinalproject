package command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.recipeDAO;
import model.board.recipeDTO;
import model.board.serviceDAO;

public class AdRecipeRecommendCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		//폼값받기
		String idx = req.getParameter("idx");
		System.out.println("들어왔니???3 : " + idx);
		recipeDAO dao = new recipeDAO();
		
		dao.AdminRecommend(idx);
	}

}
