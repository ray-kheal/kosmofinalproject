package command.member;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import command.PHJCommandImpl;
import model.member.MemberDAO;
import model.member.MemberDTO;
import model.place.PlaceDAO;
import model.place.PlaceDTO;
import model.product.ProductDAO;
import model.product.ProductDTO;

public class MemberEditCommand implements PHJCommandImpl {
	
	@Override
	public void execute(Model model) {
		System.out.println("memberEditCommand -> execute()진입");
		
		Map<String, Object> paramMap = model.asMap();
		HttpServletRequest req = (HttpServletRequest)paramMap.get("req");
		
		HttpSession session = req.getSession();
		String email = (String)session.getAttribute("EMAIL");
				
		MemberDAO dao = new MemberDAO();
		
		//session에 저장된 이메일 정보를 통하여 회원정보 가져오기.
		MemberDTO dto = dao.memberView(email);
		
		System.out.println("회원이름 : " + dto.getName());
		System.out.println("회원등급 : " + dto.getMembertype());
		System.out.println("메일수신 : " + dto.getEmail_alert() +", 문자수신 : "+ dto.getMobile_alert());
		model.addAttribute("dto",dto);
		//전화번호는 여기서 3부분으로 쪼개서 model에 넣음.
		String[] mobileArr = dto.getMobile().split("-");
		model.addAttribute("mobile1",mobileArr[0]);
		model.addAttribute("mobile2",mobileArr[1]);
		model.addAttribute("mobile3",mobileArr[2]);
		
		//메일수신동의여부, SMS수신여부도 여기서 처리.
		if(dto.getEmail_alert().equals("Y")) {
			model.addAttribute("emailY","checked");
		} else {
			model.addAttribute("emailN","checked");
		}
		
		if(dto.getMobile_alert().equals("Y")) {
			model.addAttribute("mobileY","checked");
		} else {
			model.addAttribute("mobileN","checked");
		}
		
		PlaceDAO pDao = new PlaceDAO();
		PlaceDTO pDto;
		//점포명 재조립.
		String place_bookmark = "";
		if(dto.getPlace_bookmark() != null) {
			pDto = pDao.searchPlace(Integer.parseInt(dto.getPlace_bookmark()));
	        if(pDto.getPlace_name2() != null) {	           
	           if(pDto.getPlace_name().contains(pDto.getPlace_name2())==true) {
	              model.addAttribute("place_bookmark",pDto.getPlace_name());
	           } else {
	              place_bookmark = pDto.getPlace_name()+pDto.getPlace_name2();
	              model.addAttribute("place_bookmark",place_bookmark);
	           }
	        } else {
	        	 model.addAttribute("place_bookmark",pDto.getPlace_name());
	        }
		}
		
		//상품명
		ProductDAO prDao = new ProductDAO();
		ProductDTO prDto;
		if(dto.getProducts_bookmark() != null) {
			prDto = prDao.searchProduct(dto.getProducts_bookmark());
			model.addAttribute("products_bookmark", prDto.getProduct_name());
		}
        
		
		
	}

}
