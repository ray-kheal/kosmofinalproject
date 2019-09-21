package command.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;

public class emailOverlapCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		System.out.println("memberoverlapcommand -> execute로 진입.");
		
		Map<String, Object> paramMap = model.asMap();
		String email = (String)paramMap.get("email");
		System.out.println("커맨드 내부로 받아온 email : " + email);
		HttpServletResponse resp = (HttpServletResponse)paramMap.get("resp");
		
		MemberDAO dao = new MemberDAO();
		
		int isMember = dao.emailCheck(email);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("isMember", isMember);
		try {
			PrintWriter out = resp.getWriter();
			out.print(jsonObj.toJSONString());
		} catch(IOException e) {
			e.printStackTrace();
		}
		
	
	}

}
