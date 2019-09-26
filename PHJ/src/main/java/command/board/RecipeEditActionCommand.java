package command.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import command.PHJCommandImpl;
import model.board.recipeDAO;
import model.board.recipeDTO;
import model.board.serviceDAO;
import model.board.serviceDTO;
import sun.net.www.protocol.http.logging.HttpLogFormatter;

public class RecipeEditActionCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		recipeDTO dto = (recipeDTO)map.get("recipeDTO");
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String IMAGE_NAME = req.getParameter("IMAGE_NAME");
		String content = req.getParameter("content");
		
		
		
		recipeDAO dao = new recipeDAO();
		//dao.write(dto);
	}
	
}
