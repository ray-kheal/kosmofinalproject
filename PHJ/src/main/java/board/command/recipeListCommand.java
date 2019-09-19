package board.command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import board.recipeDAO;
import board.recipeDTO;
import board.util.FileReader;
import command.PHJCommandImpl;

public class recipeListCommand implements PHJCommandImpl {

	@Override
	public void execute(Model model) {
		
		System.out.println("recipeListCommand > execute() 호출");
		
		//컨트롤러에서 넘겨준 파라미터를 한번에 받기 위한 코드
		//asMap() 메소드를 통해 Model객체에 저장된 내용을 Map컬렉션으로 변환한다.
		Map<String, Object> paramMap = model.asMap();
		/*
		컨트롤러에서 전달된 request객체를 Command객체 내에서 사용하기 위해
		형변환 후 변수에 저장함.
		 */
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		//커넥션풀 DAO 호출
		/* SpringBbsDAO dao = new SpringBbsDAO(); */
		
		//JDBCTemplate을 통한 DB연결 및 작업
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
		
		//전체 레코드 수 카운트하기
		int totalRecordCount = dao.getTotalCount(paramMap);
		System.out.println("totalRecordCount = " + totalRecordCount);
		
		/*
		외부파일로 만든 파일에 저장된 게시판 페이징 설정값을 얻어온다.
		초기상태는 String 형태이므로 int형으로 변환한 후 저장한다.
		 */
		int pageSize = Integer.parseInt(FileReader.getValue("recipeBoard.properties", "recipeBoard.pageSize"));
		int blockPage = Integer.parseInt(FileReader.getValue("recipeBoard.properties", "recipeBoard.blockPage"));
		
		//전체 페이지 수 카운트하기
		int totalPage = (int)Math.ceil((double)totalRecordCount / pageSize);
		
		//시작 및 끝 rownum 구하기
		int nowPage = req.getParameter("nowPage")==null || req.getParameter("nowPage")=="" ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		//게시물 select 시 구각으로 사용할 변수를 계산
		int start = (nowPage-1) * pageSize+1;
		int end = nowPage * pageSize;
		
		//리스트 가져오기 위한 파라미터 저장
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		//출력할 리스트 가져오기
		ArrayList<recipeDTO> listRows = dao.list(paramMap);
		
		System.out.println("listRows : " + listRows);
		
		
		//가상번호 계산하여 부여하기
		int virtualNum = 0;
		int countNum = 0;
		
		/*
		 * for(recipeDTO row : listRows) { virtualNum = totalRecordCount - (((nowPage-1)
		 * * pageSize) + countNum++); row.setVirtualNum(virtualNum);
		 * 
		 * String reSpace = "";
		 * 
		 * if(row.getBindent() > 0) { //답변글을 indent만큼 들여쓰기 for(int i=0;
		 * i<row.getBindent(); i++ ) { reSpace += "&nbsp;&nbsp;"; }
		 * 
		 * row.setTitle(reSpace+"<img src='../images/re3.gif'>"+row.getTitle()); } }
		 */
		
		//페이지 처리를 위한 처리부분
		/*
		 * String pagingImg = PagingUtil.pagingImg(totalRecordCount, pageSize,
		 * blockPage, nowPage, req.getContextPath()+"/board/list.do?"+addQueryString);
		 */
		

		//model.addAttribute("pagingImg", pagingImg); model.addAttribute("totalPage", totalPage); 
		//model.addAttribute("nowPage", nowPage);
		model.addAttribute("listRows", listRows);

		

	}
}
