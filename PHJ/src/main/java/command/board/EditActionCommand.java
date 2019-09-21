package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.serviceDAO;
import model.board.serviceDTO;

public class EditActionCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//커맨드객체 가져오기
		serviceDTO serviceDTO = (serviceDTO)map.get("serviceDTO");
		
		//폼값 확인
		System.out.println("[command]serviceDTO[내용]="+serviceDTO.getContent());
		serviceDAO dao = new serviceDAO();
		
		dao.edit(serviceDTO);
	}

}
