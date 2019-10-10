package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.commentDAO;
import model.board.serviceDAO;

public class CommentDeleteActionCommand implements PHJCommandImpl {

	@Override
	public void execute(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest) map.get("req");

		// 폼값받기
		String idx = req.getParameter("idx");
	
		commentDAO dao = new commentDAO();
		dao.delete(idx);

	}

}
