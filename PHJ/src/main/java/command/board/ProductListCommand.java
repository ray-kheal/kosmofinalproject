package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.product.ProductDAO;
import model.product.ProductDTO;
import model.stock.StockDAO;
import model.stock.StockDTO;
import util.PagingUtil;

public class ProductListCommand implements PHJCommandImpl {
	@Override
	public void execute(Model model) {
		
		System.out.println("ProductListCommand > exectue()");
		
		//파라미터 한번에 전달받기
		Map<String, Object> paramMap = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		
		//JDBCTemplate를 통한 DB연결 및 사용
		ProductDAO dao = new ProductDAO();

		
		//검색기능 구현
		String addQueryString ="";
		
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		
		if(searchWord !=null ) {
			addQueryString = String.format("searchColumn=%s&searchWord=%s&",searchColumn, searchWord);
			paramMap.put("searchColumn", searchColumn);
			paramMap.put("searchWord", searchWord);
		}
				
		//가격검색기능 구현
		String priceQueryString ="";
		
		String priceRange = req.getParameter("priceRange");
		
		if(priceRange !=null ) {
			priceQueryString = String.format("priceRange=%s&", priceRange );
			paramMap.put("priceRange", priceRange);
		}
		int pageSize = 9;
		int blockPage = 5;
		int nowPage = req.getParameter("nowPage")==null? 1: Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage -1 )* pageSize +1;
		int end = nowPage * pageSize;
		paramMap.put("start", start);
		paramMap.put("end", end);		
		int totalRecordCount = dao.getTotalCount(paramMap);
		
		
		//전체 페이지수 계산하기
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
				
		//시작 및 끝 rownum 구하기
		
		//게시물 select 시 구간으로 사용할 변수를 계산

		//출력할 리스트 가져오기
		ArrayList<ProductDTO> viewRow = dao.list(paramMap);	
		
		//가상번호 계산하여 부여하기
		int virtualNum =0;
		int countNum =0;
		for(ProductDTO row : viewRow) {
			//가상번호 연산 후 setter를 통해 값을 저장함
			virtualNum = totalRecordCount - (((nowPage-1)*pageSize) + countNum++);
			row.setVirtualNum(virtualNum);
		}
		String pagingImg = util.PagingUtil.pagingImg_phj(totalRecordCount,pageSize,blockPage, nowPage,
				req.getContextPath()+"/findproduct.do?"+addQueryString+priceQueryString);
		model.addAttribute("pagingImg",pagingImg);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("nowPage",nowPage);
				
		//모델에 저장(뷰로 데이터를 넘겨주기 위해
		model.addAttribute("viewRow",viewRow);
		System.out.println("Product 리스트커맨드 잘끝냄 ^^");
		System.out.println();		

	}

}
