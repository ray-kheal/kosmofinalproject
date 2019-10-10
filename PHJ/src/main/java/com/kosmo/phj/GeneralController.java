package com.kosmo.phj;

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
import command.NotificationCommand;
import command.PHJCommandImpl;
import command.placeMapCommand;
import command.board.ListCommand;
import command.board.ProductListCommand;
import command.board.QnAListCommand;
import command.board.StockCommand;
import command.board.recipeListCommand;

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

		return "redirect:notification.do";
	}

	// 재고백업시 알림 실행 매핑
	@RequestMapping("notification.do")
	public String notification(Model model, HttpServletRequest req, HttpSession session, HttpServletResponse resp) {
		String page = "/general/stock";

		model.addAttribute("session", session);
		model.addAttribute("resp", resp);

		if (session.getAttribute("EMAIL") != null) {
			System.out.println("현재로그인된이메일 : " + session.getAttribute("EMAIL"));
			if (session.getAttribute("PRODUCTS_BOOKMARK") != null && session.getAttribute("PLACE_BOOKMARK") != null) {

				if (session.getAttribute("ALERT").equals("Y")) {
					command = new NotificationCommand();
					command.execute(model);

					page = "/general/stock";

				} else {
					System.out.println("알림설정 off로 되어있음.");
				}

			} else {
				System.out.println("관심점포/상품 등록안됨");
			}

		} else {
			System.out.println("현재 로그인된 이메일 없음.");
		}

		return page;
	}

}
