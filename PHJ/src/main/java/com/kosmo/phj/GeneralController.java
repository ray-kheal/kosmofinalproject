package com.kosmo.phj;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import command.NotificationCommand;
import command.PHJCommandImpl;
import command.placeMapCommand;
import command.board.ListCommand;
import command.board.ProductListCommand;
import command.board.QnAListCommand;
import command.board.StockCommand;
import command.board.recipeListCommand;
import model.notify.NotifyDAO;
import model.notify.NotifyDTO;
import util.FCMUtil;

@Controller
public class GeneralController {

	PHJCommandImpl command = null;

	// 상품재고 게시판 진입
	@RequestMapping("findproduct.do")
	public String findProduct(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		command = new ProductListCommand();
		command.execute(model);

		System.out.println("product 익스큐트 실행완료");
		return "general/findproduct";
	}

	// 공지사항게시판
	@RequestMapping("notice.do")
	public String notice(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		model.addAttribute("board_type", 1);
		command = new ListCommand();
		command.execute(model);

		return "general/notice";
	}

	// 이벤트 게시판
	@RequestMapping("event.do")
	public String event(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		model.addAttribute("board_type", 2);
		command = new ListCommand();
		command.execute(model);
		return "general/event";
	}

	// 레시피 게시판
	@RequestMapping("recipe.do")
	public String recipe(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		command = new recipeListCommand();
		command.execute(model);
		return "general/recipe";
	}

	// 편의점찾기 페이지
	@RequestMapping("placemap.do")
	public String placemap(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		command = new placeMapCommand();
		command.execute(model);

		return "general/placemap";
	}

	// 1대1문의
	@RequestMapping("mail.do")
	public String mailing() {
		return "general/mail";
	}

	// Q&A 게시판
	@RequestMapping("qna.do")
	public String qna(Model model, HttpServletRequest req) {
		model.addAttribute("req", req);
		command = new QnAListCommand();
		command.execute(model);
		return "general/qna";
	}

	// 트위터
	@RequestMapping("twitter.do")
	public String twitter(Model model) {

		return "sns_page/twitter";
	}

	// 페이스북
	@RequestMapping("facebook.do")
	public String facebook(Model model) {
		return "sns_page/facebook";
	}

	// 1:1 문의하기 메일 메소드
	@Autowired
	private JavaMailSenderImpl mailSender;

	@RequestMapping(value = "/InquireEmail.do", method = RequestMethod.POST)
	public String InquireEmail(final HttpServletRequest req, Model model) {

		final String fromEmail = "pwyank10321@naver.com";
		final String toEmail = "pwyank10321@naver.com";
		final String subject = req.getParameter("email") + "(" + req.getParameter("name") + ")" + "님의 문의내역: "
				+ req.getParameter("subject");
		final String contents = req.getParameter("contents").replace("\r\n", "<br/>");

		final MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {

				final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				helper.setFrom(fromEmail);
				helper.setTo(toEmail);
				helper.setSubject(subject);
				helper.setText(contents, true);
			}
		};

		try {
			mailSender.send(preparator);
			System.out.println("메일이 정상발송 되었습니다");
		} catch (Exception e) {
			System.out.println("예외발생");
			System.out.println("메일발송오류");
			e.printStackTrace();
		}

		return "redirect:../phj";
	}

	// 재고 페이지 진입
	@RequestMapping("stock.do")
	public String stock(Model model, HttpServletRequest req) {

		return "general/stock";
	}

	// 재고 백업 커맨드
	@RequestMapping("stockPlus.do")
	public String stockPlus(Model model, HttpServletRequest req) {

		model.addAttribute("req", req);
		command = new StockCommand();
		command.execute(model);

		String place_code = req.getParameter("place_code");

		return "redirect:notification.do?place_code=" + place_code;
	}

	// 재고백업시 알림 실행 매핑
	@RequestMapping("notification.do")
	public @ResponseBody String notification(Model model, HttpServletRequest req) throws Exception {
		String place_code = req.getParameter("place_code");
		NotifyDAO dao = new NotifyDAO();
		ArrayList<NotifyDTO> dto = dao.notiInfo(place_code);
		for (int i = 0; i < dto.size(); i++) {
			if (dto.get(i).getMobile_alert().equals("Y")) {
				if (dto.get(i).getStock() > dto.get(i).getStock_backup()) {
					if (dto.get(i).getFcm_token() != null) {
						// 점포명 재조립.
						if (dto.get(i).getPlace_name2() != null) {
							if (dto.get(i).getPlace_name().contains(dto.get(i).getPlace_name2()) == true) {

							} else {
								dto.get(i).setPlace_name(dto.get(i).getPlace_name() + dto.get(i).getPlace_name2());
							}

						}
						
						String tokenId = dto.get(i).getFcm_token();
						String title = "편히점 알림메시지!";
						String content = dto.get(i).getPlace_name() + "에 " + dto.get(i).getProduct_name()+" 상품이 들어왔습니다!";

						FCMUtil FcmUtil = new FCMUtil();
						FcmUtil.send_FCM(tokenId, title, content);
					} else {
						System.out.println("DB에 저장된 FCM토큰이 없음.");
					}
				} else {
					System.out.println("재고와 재고백업이 일치함.");
				}
			} else {
				System.out.println("알람설정을 off해놓음.");
			}
		}

		return "정상적으로 상품입고 되었음.";
	}

	

}
