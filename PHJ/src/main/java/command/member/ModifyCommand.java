package command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;
import model.place.PlaceDAO;
import model.place.PlaceDTO;

public class ModifyCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
		System.out.println("회원정보 수정 execute()메소드 호출");
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//커맨드객체 가져오기.
		MemberDTO dto = (MemberDTO)map.get("memberDTO");
		PlaceDTO dto1 = (PlaceDTO)map.get("PlaceDTO");
		String mobile = req.getParameter("mobile1")+"-"+req.getParameter("mobile2")+"-"+req.getParameter("mobile3");
		dto.setMobile(mobile);
		
		System.out.println("수정될 회원 이름 : " + dto.getName());
		System.out.println("수정될 회원정보 비밀번호 : " + dto.getPass());
		System.out.println("수정될 회원정보 전화번호 : " + dto.getMobile());
		System.out.println("수정될 회원정보 관심점포 : " + dto1.getPlace_name());
		
		
		MemberDAO dao = new MemberDAO();
		PlaceDAO dao1 = new PlaceDAO();

		
		dao.modify(dto);
		
		
		
	}

}
