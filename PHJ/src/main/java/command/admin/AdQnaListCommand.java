package command.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.serviceDAO;
import model.board.serviceDTO;
import util.PagingUtil;


public class AdQnaListCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		
		System.out.println("AdrecipeListCommand > exectue()");
		
		//파라미터 한번에 전달받기
		Map<String, Object> paramMap = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		
		//JDBCTemplate를 통한 DB연결 및 사용
		serviceDAO dao = new serviceDAO();

		
		//검색기능 구현
		String addQueryString ="";
		
		String searchColumn = req.getParameter("searchColumn");
		String searchWord = req.getParameter("searchWord");
		
		if(searchWord !=null ) {
			addQueryString = String.format("searchColumn=%s&searchWord=%s&",searchColumn, searchWord);
			paramMap.put("searchColumn", searchColumn);
			paramMap.put("searchWord", searchWord);
		}
				
				
		int totalRecordCount = dao.getTotalCount(paramMap);
		System.out.println("totalRecordCount:"+totalRecordCount);
		
		int pageSize = 10;
		int blockPage = 5;
		
		//전체 페이지수 계산하기
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
				
		//시작 및 끝 rownum 구하기
		int nowPage = req.getParameter("nowPage")==null? 1: Integer.parseInt(req.getParameter("nowPage"));
		
			
		//게시물 select 시 구간으로 사용할 변수를 계산
		int start = (nowPage -1 )* pageSize +1;
		int end = nowPage * pageSize;
		
		paramMap.put("start", start);
		paramMap.put("end", end);		
		
		
		
		//출력할 리스트 가져오기
		ArrayList<serviceDTO> viewRow = dao.list(paramMap);
		
		
		//가상번호 계산하여 부여하기
		int virtualNum =0;
		int countNum =0;
		for(serviceDTO row : viewRow) {
			//가상번호 연산 후 setter를 통해 값을 저장함
			virtualNum = totalRecordCount - (((nowPage-1)*pageSize) + countNum++);
			row.setVirtualNum(virtualNum);
			
			String reSpace = "";
	         if(row.getBindent() > 0) {
	            //답변글을 indent만큼 들여쓰기
	            for(int i=0; i<row.getBindent(); i++ ) {
	            	
	               reSpace += "&nbsp;&nbsp;";
	            }
	            //row.setTitle(reSpace+"<img src='../resources/images/re3.gif'>"+row.getTitle());
	            //row.setTitle(reSpace+"<img src='https://img.lovepik.com/element/40067/8474.png_860.png' style='width:20px;'>"+row.getTitle());
	            //row.setTitle(reSpace+"<img src='../../../../phj/images/re3.gif' style='width:20px;'>"+row.getTitle());
	            row.setTitle(reSpace+"<i class='mdi mdi-arrow-right-bold'></i>"+row.getTitle());
	         }		
			
		}
		String pagingImg =PagingUtil.pagingImg(totalRecordCount,pageSize,blockPage, nowPage,
				req.getContextPath()+"/admin/pages/tables/qnaManagement.do?"+addQueryString);
		model.addAttribute("pagingImg",pagingImg);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("nowPage",nowPage);
				
		//모델에 저장(뷰로 데이터를 넘겨주기 위해
		model.addAttribute("viewRow",viewRow);
		System.out.println("qna리스트커맨드 잘끝냄 ^^");
			

	}

}