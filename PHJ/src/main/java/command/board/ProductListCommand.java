package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.phj.boardController;

import command.PHJCommandImpl;
import model.board.noticeDAO;
import model.board.noticeDTO;
import model.product.ProductDAO;
import model.product.ProductDTO;

public class ProductListCommand implements PHJCommandImpl {
	@Override
	public void execute(Model model) {
		
		System.out.println("ListCommand클래스 > execute() 메소드 호출");
		
		Map<String, Object> paramMap = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
					
		ProductDAO dao = new ProductDAO();	
		
		String addQueryString = "";
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		if(searchColumn!= null) {
			addQueryString = String.format("searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
			paramMap.put("Column", searchColumn);
			paramMap.put("Word", searchWord);
		}
		int totalRecordCount = dao.getTotalCount(paramMap);
		
		int pageSize= 10;
		int blockPage= 5;
		//System.out.println("확인 :" + totalRecordCount);
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals(""))?1:Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		paramMap.put("start", start);
		paramMap.put("end", end);
		ArrayList<ProductDTO> listRows = dao.list(paramMap);
		int virtualNum =0;
	    int countNum =0;
	    for(ProductDTO row : listRows) {
        
          virtualNum = totalRecordCount - (((nowPage-1)*pageSize) + countNum++);
          row.setVirtualNum(virtualNum);
       }
	    
	    String pagingImg = util.MainPagingUtil.pagingImg(totalRecordCount,pageSize,blockPage, nowPage,
				req.getContextPath()+"/findproduct.do?"+addQueryString);
	    
		model.addAttribute("pagingImg",pagingImg);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("listRows",listRows);
	}
}
