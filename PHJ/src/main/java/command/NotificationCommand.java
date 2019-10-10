package command;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import model.stock.StockDAO;
import model.stock.StockDTO;

public class NotificationCommand implements PHJCommandImpl {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession) map.get("session");

		String products_bookmark = session.getAttribute("PRODUCTS_BOOKMARK").toString();
		String place_bookmark = session.getAttribute("PLACE_BOOKMARK").toString();

		StockDAO sDao = new StockDAO();
		StockDTO sDto = sDao.isPlusStock(products_bookmark, place_bookmark);

		String place_name = sDto.getPlace_name();
		String product_name = sDto.getProduct_name();
		System.out.println("place_name : " + place_name);

		int stock = Integer.parseInt(sDto.getStock());
		int stock_backup = Integer.parseInt(sDto.getStock_backup());

		if (stock > stock_backup) {
			System.out.println("알림메시지 보내는로그");

		}

	}

}
