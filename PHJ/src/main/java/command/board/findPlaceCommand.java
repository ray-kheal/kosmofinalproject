package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.place.PlaceDAO;
import model.place.PlaceDTO;
import model.stock.StockDAO;
import model.stock.StockDTO;
import util.PagingUtil;

public class findPlaceCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		int place_code = (Integer)paramMap.get("place_code");
		int product_code = (Integer)paramMap.get("product_code");
		
		PlaceDAO dao = new PlaceDAO();
		
		PlaceDTO dto = dao.searchPlace(place_code);
		
		String addQueryString = "";
		StockDAO sdao = new StockDAO();
	
		int totalRecordCount = sdao.getTotalCount(paramMap,place_code);

		int pageSize = 3;
		int blockPage = 3;
		System.out.println("확인 :" + totalRecordCount);

		int totalPage = (int) Math.ceil((double) totalRecordCount / pageSize);
		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals("")) ? 1
				: Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage - 1) * pageSize + 1;
		int end = nowPage * pageSize;
		paramMap.put("start", start);
		paramMap.put("end", end);

		ArrayList<StockDTO> sdto = sdao.stockPlace(paramMap, place_code);
		
		int virtualNum = 0;
		int countNum = 0;
		for (StockDTO row : sdto) {

			virtualNum = totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
			row.setVirtualNum(virtualNum);

	}

		String pagingImg = PagingUtil.pagingImg_phj(totalRecordCount, pageSize, blockPage, nowPage,
				req.getContextPath() + "/findPlace.do?product_code="+product_code+"&place_code="+place_code+"&");
		model.addAttribute("pagingImg", pagingImg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("dto",dto);		
		model.addAttribute("sdto",sdto);
	}

}
