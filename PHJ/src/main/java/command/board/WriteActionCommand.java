package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.serviceDAO;
import model.board.serviceDTO;

public class WriteActionCommand implements PHJCommandImpl{

	@Override
	public void execute(Model model) {
		//파라미터 한번에 전달받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		serviceDTO serviceDTO = (serviceDTO)paramMap.get("serviceDTO");
		
		//폼값받기
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
			
		//커맨드객체 받아서 확인하기
		
		serviceDAO dao = new serviceDAO();
		
		dao.write(serviceDTO);
	
	}
	
}
