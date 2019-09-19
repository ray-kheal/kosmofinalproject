package board.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import board.serviceDAO;
import board.serviceDTO;
import command.PHJCommandImpl;

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
