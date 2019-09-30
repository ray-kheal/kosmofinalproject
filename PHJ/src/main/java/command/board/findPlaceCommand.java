package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.place.PlaceDAO;
import model.place.PlaceDTO;

public class findPlaceCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		int place_code = (Integer)paramMap.get("place_code");
		
		PlaceDAO dao = new PlaceDAO();
		
		PlaceDTO dto = dao.searchPlace(place_code);
		
		model.addAttribute("dto",dto);
		
		
		
	}

}
