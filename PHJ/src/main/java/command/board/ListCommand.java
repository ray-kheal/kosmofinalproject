package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.kosmo.phj.boardController;

import command.PHJCommandImpl;
import model.board.noticeDAO;
import model.board.noticeDTO;

public class ListCommand implements PHJCommandImpl {
	@Override
	public void execute(Model model) {
		
		System.out.println("ListCommand클래스 > execute() 메소드 호출");
		
		Map<String, Object> paramMap = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		int board_type = (Integer)paramMap.get("board_type");
	
			
		noticeDAO dao = new noticeDAO();	
		
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
		System.out.println("확인 :" + totalRecordCount);
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals(""))?1:Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		paramMap.put("start", start);
		paramMap.put("end", end);
		ArrayList<noticeDTO> listRows = dao.list(paramMap);
		int virtualNum =0;
	    int countNum =0;
	    for(noticeDTO row : listRows) {
        
          virtualNum = totalRecordCount - (((nowPage-1)*pageSize) + countNum++)+2;
          row.setVirtualNum(virtualNum);
       }
	    String pagingImg =null;
	    if(board_type==1) {
	    pagingImg = util.PagingUtil.pagingImg(totalRecordCount,pageSize,blockPage, nowPage,
				req.getContextPath()+"/notice.do?"+addQueryString);
	    }else if(board_type==2) {
	    pagingImg = util.PagingUtil.pagingImg(totalRecordCount,pageSize,blockPage, nowPage,
				req.getContextPath()+"/event.do?"+addQueryString);
	    }
	    
		model.addAttribute("pagingImg",pagingImg);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("listRows",listRows);
	}
}
