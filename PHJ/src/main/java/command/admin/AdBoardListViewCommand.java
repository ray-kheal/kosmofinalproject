package command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.noticeDAO;
import model.board.noticeDTO;


public class AdBoardListViewCommand implements PHJCommandImpl{

	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		String board_type = req.getParameter("board_type");
		
		System.out.println("idx:"+idx+",nowPage:"+nowPage+",board_type:"+board_type);
		
		//jdbcTemplate dao
		noticeDAO dao = new noticeDAO();
		noticeDTO dto = new noticeDTO();
		
		dto = dao.view(idx); //상세보기
		System.out.println("dao.view 완료");
		//줄바꿈처리
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		
		model.addAttribute("viewRow",dto);
		System.out.println("dto:"+dto);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("board_type",board_type);
	}
}
