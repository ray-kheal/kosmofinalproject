package command;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.phj.boardController;

import model.board.noticeDAO;
import model.board.noticeDTO;

public class home_eventCommand implements PHJCommandImpl {

	@Override
	public void execute(Model model) {
		noticeDAO dao = new noticeDAO();
		String queryStr = "";
		 Map<String, Object> param = model.asMap();
		HttpServletRequest req = (HttpServletRequest) param.get("req");
		param.get("board_type");
		int totalRecordCount = dao.pregetTotalCount(param);
		System.out.println(totalRecordCount);
		int pageSize = 5;
		int blockPage = 5;
		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = (req.getParameter("nowPage") == null) || req.getParameter("nowPage").equals("") ? 1
				: Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		param.put("start", start);
		param.put("end", end);
		ArrayList<noticeDTO> listRows = dao.list(param);
		int virtualNum = 0;
		int countNum = 0;
		for (noticeDTO row : listRows) {
			virtualNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
			row.setVirtualNum(virtualNum);
		}
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("eventRows", listRows);

	}
}
