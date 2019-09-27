package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

//프로젝트의 모든 Command클래스가 구현할 인터페이스 정의.
public interface PHJCommandImpl {
	
	//추상메소드 : 오버라이딩의 목적으로 정의함
	void execute(Model model);

//	void profileUpload(String email, MultipartFile file, HttpServletRequest req, HttpServletResponse res);
}
