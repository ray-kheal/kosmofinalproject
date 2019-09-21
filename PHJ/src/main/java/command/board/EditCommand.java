package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.serviceDAO;
import model.board.serviceDTO;

public class EditCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
	
		//파라미터 한번에 받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		
		serviceDAO dao = new serviceDAO();
		serviceDTO dto = dao.view(idx);
		model.addAttribute("viewRow",dto);
	
	}

}
