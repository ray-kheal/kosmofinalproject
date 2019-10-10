package command;

import org.springframework.ui.Model;

//프로젝트의 모든 Command클래스가 구현할 인터페이스 정의.
public interface PHJCommandImpl {

	// 추상메소드 : 오버라이딩의 목적으로 정의함
	void execute(Model model);

}
