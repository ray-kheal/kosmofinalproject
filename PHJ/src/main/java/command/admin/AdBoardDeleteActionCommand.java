package command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.noticeDAO;

public class AdBoardDeleteActionCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//폼값받기
		String idx = req.getParameter("idx");
		noticeDAO dao = new noticeDAO();
		dao.delete(idx);
		
	}

}
