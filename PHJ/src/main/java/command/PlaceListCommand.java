package command;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import place.PlaceDAO;
import place.PlaceDTO;




public class PlaceListCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		
		System.out.println("PlaceListCommand > exectue()");
		
		//파라미터 한번에 전달받기
		Map<String, Object> paramMap = model.asMap();
		
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		
		//JDBCTemplate를 통한 DB연결 및 사용
		PlaceDAO dao = new PlaceDAO();

		int totalRecordCount = dao.getTotalCount(paramMap);
		
		
		//출력할 리스트 가져오기
		ArrayList<PlaceDTO> viewRow = dao.list(paramMap);
		
		System.out.println("viewRow"+viewRow);
		
		//가상번호 계산하여 부여하기
		/*
		 * int virtualNum =0; int countNum =0; for(DTO row : viewRow) { //가상번호 연산 후
		 * setter를 통해 값을 저장함 virtualNum = totalRecordCount - (((nowPage-1)*pageSize) +
		 * countNum++); row.setVirtualNum(virtualNum);
		 * 
		 * String reSpace ="";
		 * 
		 * }
		 */
				
		//모델에 저장(뷰로 데이터를 넘겨주기 위해
		model.addAttribute("viewRow",viewRow);
		System.out.println("리스트커맨드 잘끝냄 ^^");
		System.out.println();		

	}

}