package command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.noticeDAO;
import model.board.noticeDTO;

public class AdBoardListWriteActionCommand implements PHJCommandImpl{

	@Override
	public void execute(Model model) {
		//파라미터 한번에 전달받기
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		noticeDTO noticeDTO = (noticeDTO)paramMap.get("noticeDTO");
		
		//폼값받기
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		String board_type = req.getParameter("board_type");
			
		//커맨드객체 받아서 확인하기
		
		noticeDAO dao = new noticeDAO();
		
		dao.write(noticeDTO);
		
		System.out.println("writeAction 익스큐드실행");
	
	}
	
}
