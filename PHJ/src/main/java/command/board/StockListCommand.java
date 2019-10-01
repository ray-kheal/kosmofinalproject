package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.stock.StockDAO;
import model.stock.StockDTO;
import util.PagingUtil;

public class StockListCommand implements PHJCommandImpl {
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();

		HttpServletRequest req = (HttpServletRequest) paramMap.get("req");
		int product_code = (Integer) paramMap.get("product_code");
		String addQueryString = "";
		StockDAO dao = new StockDAO();
		int totalRecordCount = dao.getTotalCount(paramMap);

		int pageSize = 10;
		int blockPage = 5;
		System.out.println("확인 :" + totalRecordCount);

		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) ? 1
				: Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		paramMap.put("start", start);
		paramMap.put("end", end);

		ArrayList<StockDTO> listRows = dao.list(paramMap, product_code);
		int virtualNum = 0;
		int countNum = 0;
		for (StockDTO row : listRows) {

			virtualNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
			row.setVirtualNum(virtualNum);

			// 점포명 재조립.
			if (row.getPlace_name2() != null) {
				if (row.getPlace_name().contains(row.getPlace_name2()) == true) {

				} else {
					row.setPlace_name(row.getPlace_name() + row.getPlace_name2());
				}

			}
		}

		String pagingImg = PagingUtil.pagingImg_phj(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/findproduct.do?" + addQueryString);

		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("listRows", listRows);
		model.addAttribute("product_code", product_code);
	}
}
