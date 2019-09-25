package command.admin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.noticeDAO;
import model.board.noticeDTO;

public class AdBoardListEditActionCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//커맨드객체 가져오기
		noticeDTO noticeDTO = (noticeDTO)map.get("noticeDTO");
		
		//폼값 확인
		System.out.println("[command]noticeDTO[내용]="+noticeDTO.getContent());
		noticeDAO dao = new noticeDAO();
		
		dao.edit(noticeDTO);
	}

}
