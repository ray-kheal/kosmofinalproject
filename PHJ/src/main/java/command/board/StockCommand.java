package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.stock.StockDAO;
import model.stock.StockDTO;

public class StockCommand implements PHJCommandImpl {

	@Override
	public void execute(Model model) {
		Map<String, Object> paramMap = model.asMap();

		HttpServletRequest req = (HttpServletRequest) paramMap.get("req");
		int product_code = (Integer) paramMap.get("product_code");
		String addQueryString = "";
		StockDAO dao = new StockDAO();
		int totalRecordCount = dao.getStockCount(paramMap);
		
		ArrayList<StockDTO> listRows = dao.list(paramMap, product_code);
	}
}
