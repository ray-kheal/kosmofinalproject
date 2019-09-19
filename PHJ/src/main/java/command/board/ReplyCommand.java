package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.serviceDAO;
import model.board.serviceDTO;

public class ReplyCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		String idx = req.getParameter("idx");
		
	
		serviceDAO dao = new serviceDAO();
		serviceDTO dto = dao.view(idx);
		
		dto.setTitle("[re]" +dto.getTitle());
		dto.setContent("\n\r\r\r --- [원본글] --- \n\r"+ dto.getContent());
		model.addAttribute("replyRow",dto);
	
		
	}

}
