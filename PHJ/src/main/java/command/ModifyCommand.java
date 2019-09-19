package command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import member.MemberDTO;

public class ModifyCommand implements PHJCommandImpl{
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest req = (HttpServletRequest)map.get("req");
		
		//커맨드객체 가져오기.
		MemberDTO dto = (MemberDTO)map.get("memberDTO");
		
		System.out.println("수정될 회원정보 로그 : " + dto.getPass());
		
		
		
		
	}

}
