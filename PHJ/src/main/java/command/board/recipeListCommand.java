package command.board;

import java.util.ArrayList;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.recipeDAO;
import model.board.recipeDTO;
import util.FileReader;
import util.PagingUtil;

public class recipeListCommand implements PHJCommandImpl {

   @Override
   public void execute(Model model) {
      
      System.out.println("recipeListCommand > execute() 호출");
      
      Map<String, Object> paramMap = model.asMap();
      HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
      recipeDAO dao = new recipeDAO();
      
      //검색기능 구현
      String addQueryString = "";
      String searchColumn = req.getParameter("searchColumn");
      String searchWord = req.getParameter("searchWord");
      
      if(searchWord != null) {
         addQueryString = String.format("searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
         paramMap.put("Column", searchColumn);
         paramMap.put("Word", searchWord);
      }
      
      int totalRecordCount = dao.getTotalCount(paramMap);
      System.out.println("totalRecordCount = " + totalRecordCount);

      int pageSize = Integer.parseInt(FileReader.getValue("recipeBoard.properties", "recipeBoard.pageSize"));
      int blockPage = Integer.parseInt(FileReader.getValue("recipeBoard.properties", "recipeBoard.blockPage"));

      int totalPage = (int)Math.ceil((double)totalRecordCount / pageSize);
      int nowPage = req.getParameter("nowPage")==null || req.getParameter("nowPage")=="" ? 1 : Integer.parseInt(req.getParameter("nowPage"));
      
      int start = (nowPage-1) * pageSize+1;
      int end = nowPage * pageSize;

      paramMap.put("start", start);
      paramMap.put("end", end);
      
      ArrayList<recipeDTO> listRows = dao.list(paramMap);
      
      System.out.println("listRows : " + listRows);
      
      int virtualNum = 0;
      int countNum = 0;
      
      for(recipeDTO row : listRows) {
         virtualNum = totalRecordCount-(((nowPage-1)*pageSize)+countNum++);
         row.setVirtualNum(virtualNum);
      }
      
      //페이지 처리를 위한 처리부분
      String pagingImg = PagingUtil.pagingImg_phj(totalRecordCount, pageSize,
      blockPage, nowPage, req.getContextPath()+"/recipe.do?"+addQueryString);

      model.addAttribute("pagingImg", pagingImg); 
      model.addAttribute("totalPage", totalPage); 
      model.addAttribute("nowPage", nowPage);
      model.addAttribute("listRows", listRows);

   }
}