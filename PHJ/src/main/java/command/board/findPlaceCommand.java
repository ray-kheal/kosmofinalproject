package command.board;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;

public class findPlaceCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		
		
	}

}
