package command.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import command.PHJCommandImpl;
import model.board.recipeDAO;
import model.board.recipeDTO;
import model.board.serviceDAO;
import model.board.serviceDTO;
import sun.net.www.protocol.http.logging.HttpLogFormatter;

public class RecipeEditFileActionCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
		
		System.out.println("요기는요?");
		
		Map<String, Object> map = model.asMap();
				
					
		recipeDAO dao = new recipeDAO();
		recipeDTO dto = (recipeDTO)map.get("recipeDTO");
		
		dao.write(dto);	
	}
}
