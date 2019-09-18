package board.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import board.noticeDAO;
import board.noticeDTO;
import command.PHJCommandImpl;

public class ListCommand implements PHJCommandImpl {
	@Override
	public void execute(Model model) {
		
		System.out.println("ListCommand클래스 > execute() 메소드 호출");
		
		Map<String, Object> paramMap = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
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
		int blockPage= 10;
		
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		
		int nowPage = (req.getParameter("nowPage") == null || req.getParameter("nowPage").equals(""))?1:Integer.parseInt(req.getParameter("nowPage"));
		int start = (nowPage-1) * pageSize +1;
		int end = nowPage * pageSize;
		paramMap.put("start", start);
		paramMap.put("end", end);
		ArrayList<noticeDTO> listRows = dao.list(paramMap);
		
		//페이지 처리를 위한 처리부분.
		//String pagingImg = util.PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath() + "/list.do?"+ addQueryString);
		
		//model.addAttribute("pagingImg",pagingImg);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("listRows",listRows);
		
		
	}

}
