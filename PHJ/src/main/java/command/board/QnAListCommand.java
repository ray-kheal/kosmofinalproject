package command.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.omg.CORBA.Environment;
import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.board.serviceDAO;
import model.board.serviceDTO;

public class QnAListCommand implements PHJCommandImpl{
   @Override
   public void execute(Model model) {
      
      System.out.println("ListCommand > execute() 호출");
      
      Map<String, Object> paramMap = model.asMap();
      HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
      
      serviceDAO dao = new serviceDAO();
      
      String addQueryString = "";
      String searchColumn = req.getParameter("searchColumn");
      String searchWord = req.getParameter("searchWord");
      
      if(searchWord != null) {
         addQueryString = String.format("searchColumn=%s&searchWord=%s&", searchColumn, searchWord);
         paramMap.put("Column", searchColumn);
         paramMap.put("Word", searchWord);
      }
      int totalRecordCount = dao.getTotalCount(paramMap);
      
      int pageSize = 10;
      int blockPage = 10;
      
      int totalPage = (int)Math.ceil((double)totalRecordCount / pageSize);
      
      int nowPage = req.getParameter("nowPage")==null || req.getParameter("nowPage")=="" ? 1 : Integer.parseInt(req.getParameter("nowPage"));
      
      int start = (nowPage-1) * pageSize+1;
      int end = nowPage * pageSize;
      
      paramMap.put("start", start);
      paramMap.put("end", end);
      
      ArrayList<serviceDTO> listRows = dao.list(paramMap);

      int virtualNum = 0;
      int countNum = 0;
      
      for(serviceDTO row : listRows) {
         virtualNum = totalRecordCount - (((nowPage-1) * pageSize) + countNum++);
         row.setVirtualNum(virtualNum);
         String reSpace = "";
         if(row.getBindent() > 0) {
            //답변글을 indent만큼 들여쓰기
            for(int i=0; i<row.getBindent(); i++ ) {
               reSpace += "&nbsp;&nbsp;";
            }
            row.setTitle(reSpace+"<img src='../resources/images/re3.gif'>"+row.getTitle());
         }								
      }
      
      //페이지 처리를 위한 처리부분
      //String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/board/list.do?"+addQueryString);
      
     // model.addAttribute("pagingImg", pagingImg);
      model.addAttribute("totalPage", totalPage);
      model.addAttribute("nowPage", nowPage);
      model.addAttribute("listRows", listRows);
      
     
   }
}