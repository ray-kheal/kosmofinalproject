package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.commentDAO;
import model.board.commentDTO;
import model.board.recipeDAO;
import model.board.recipeDTO;
import util.FileReader;
import util.PagingUtil;

public class RecipeListViewCommand implements PHJCommandImpl{

	@Override
	public void execute(Model model) {

		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		String idx = req.getParameter("idx");
		int commentNum = Integer.parseInt(idx);
		System.out.println("listview의 idx:"+idx);
		String nowPage = req.getParameter("nowPage");
		
		
		//jdbcTemplate dao
		recipeDAO dao = new recipeDAO();
		
		recipeDTO dto = new recipeDTO();
		
		dto = dao.view(idx); //상세보기
		
		//줄바꿈처리
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		
		
		commentDAO cDao = new commentDAO();
		String addQueryString = "";
		int totalCommentCount = cDao.getTotalCount(paramMap,commentNum);
		int pageSize = 5;
	    int blockPage = 5;

	      int totalPage = (int)Math.ceil((double)totalCommentCount / pageSize);
	      int nowCommentPage = req.getParameter("nowPage")==null || req.getParameter("nowPage")=="" ? 1 : Integer.parseInt(req.getParameter("nowPage"));
	      
	      int start = (nowCommentPage-1) * pageSize+1;
	      int end = nowCommentPage * pageSize;

	      paramMap.put("start", start);
	      paramMap.put("end", end);
	    
	      
		
		ArrayList<commentDTO> cDto = cDao.commentList(paramMap, idx); 
		 int virtualNum = 0;
	      int countNum = 0;
	      
	      for(commentDTO row : cDto) {
	         virtualNum = totalCommentCount-(((nowCommentPage-1)*pageSize)+countNum++);
	         row.setVirtualNum(virtualNum);
	      }
	      String pagingImg = PagingUtil.pagingImg_phj(totalCommentCount, pageSize,
	    	      blockPage, nowCommentPage, req.getContextPath()+"/Rview.do?idx="+idx+"&"+addQueryString);

		
		System.out.println("갯수 : "+ totalCommentCount);
		model.addAttribute("cDto", cDto);
		model.addAttribute("viewRow",dto);
		model.addAttribute("TotalCount",totalCommentCount);
		model.addAttribute("nowPage",nowPage);
		model.addAttribute("pagingImg",pagingImg);
		
	}
}
