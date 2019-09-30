package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.serviceDAO;
import model.board.serviceDTO;

public class WriteActionCommand implements PHJCommandImpl{

	@Override
	public void execute(Model model) {
		//파라미터 한번에 전달받기
		System.out.println("execute는 들어오나?");
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		HttpSession session = (HttpSession)paramMap.get("session");
		serviceDTO serviceDTO = (serviceDTO)paramMap.get("serviceDTO");
		
		//폼값받기
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String email = session.getAttribute("EMAIL").toString();
		System.out.println(email);
		serviceDAO dao = new serviceDAO();
		
		serviceDTO.setEmail(email);
		dao.write(serviceDTO);
		System.out.println(dao);
	
	}
	
}
