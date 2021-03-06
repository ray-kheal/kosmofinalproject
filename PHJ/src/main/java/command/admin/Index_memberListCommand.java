package command.admin;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;

public class Index_memberListCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
		
	Map<String, Object> paramMap = model.asMap();

	HttpServletRequest req = (HttpServletRequest) paramMap.get("req");

	// JDBCTemplate를 통한 DB연결 및 사용
	MemberDAO dao = new MemberDAO();

	int member_totalRecordCount = dao.getTotalCount(paramMap);

	int pageSize = 5;
	int blockPage = 5;

	// 전체 페이지수 계산하기
	int totalPage = (int) Math.ceil((double) member_totalRecordCount / pageSize);

	// 시작 및 끝 rownum 구하기
	int nowPage = (req.getParameter("nowPage") == null) || req.getParameter("nowPage").equals("") ? 1
			: Integer.parseInt(req.getParameter("nowPage"));
	// 게시물 select 시 구간으로 사용할 변수를 계산
	int start = (nowPage - 1) * pageSize + 1;
	int end = nowPage * pageSize;

	paramMap.put("start",start);
	paramMap.put("end",end);

	// 출력할 리스트 가져오기
	ArrayList<MemberDTO> viewRow = dao.list(paramMap);

	// 가상번호 계산하여 부여하기
	int virtualNum = 0;
	int countNum = 0;
	for(MemberDTO row:viewRow)
	{
		// 가상번호 연산 후 setter를 통해 값을 저장함
		virtualNum = member_totalRecordCount - (((nowPage - 1) * pageSize) + countNum++);
		row.setVirtualNum(virtualNum);

	}
	
	model.addAttribute("totalPage", totalPage);
	model.addAttribute("nowPage", nowPage);
	model.addAttribute("viewRow",viewRow);
	model.addAttribute("member_totalRecordCount",member_totalRecordCount);
	}
}
