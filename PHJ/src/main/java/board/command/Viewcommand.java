package board.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import board.noticeDAO;
import board.noticeDTO;
import command.PHJCommandImpl;

public class Viewcommand implements PHJCommandImpl{

	
	@Override
	public void execute(Model model) {
		Map<String, Object>paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		String nowPage = req.getParameter("nowPage");
		
		noticeDAO dao = new noticeDAO();
		noticeDTO dto = new noticeDTO();
		//상세보기
		dto =dao.view(idx);
		//줄바꿈처리 : getter로 줄바꿈 처리 후 다시 setter로 저장
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		
		//모델에 저장(뷰로 데이터를 넘겨주기 위해)
		model.addAttribute("viewRow",dto);
		model.addAttribute("nowPage",nowPage);
	}
}