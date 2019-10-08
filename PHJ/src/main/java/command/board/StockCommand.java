package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;
import model.stock.StockDAO;
import model.stock.StockDTO;

public class StockCommand implements PHJCommandImpl {

	@Override
	public void execute(Model model) {
		Map<String, Object> paramMap = model.asMap();

		HttpServletRequest req = (HttpServletRequest) paramMap.get("req");
		
		String place_code = req.getParameter("place_code");
		String product_code = req.getParameter("product_code");
		String stock = req.getParameter("stock");
		
		System.out.println("place_code:"+place_code);
		
		//dto객체에 폼값저장하기
		StockDTO dto = new StockDTO();
		dto.setPlace_code(place_code);
		dto.setProduct_code(product_code);
		dto.setStock(stock);
		
		StockDAO dao = new StockDAO();
		dao.plusStock(place_code, product_code, stock);
		
		model.addAttribute("success",1);
	}
}
