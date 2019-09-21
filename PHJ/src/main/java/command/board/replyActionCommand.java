package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.serviceDAO;
import model.board.serviceDTO;

public class replyActionCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {

		//request 한꺼번에 전달받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		serviceDTO dto = (serviceDTO)paramMap.get("serviceDTO");
		
		//JDBCTemplate
		serviceDAO dao = new serviceDAO();
		dao.reply(dto);
	}

}
