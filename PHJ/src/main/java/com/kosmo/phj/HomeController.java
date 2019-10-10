package com.kosmo.phj;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import command.PHJCommandImpl;
import command.home_eventCommand;
import command.home_notiCommand;
import command.home_recipeCommand;
import model.stock.StockDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	PHJCommandImpl command = null;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpServletRequest req, HttpSession session) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);

		model.addAttribute("req", req);
		model.addAttribute("board_type", 1);
		command = new home_notiCommand();
		command.execute(model);

		model.addAttribute("req", req);
		model.addAttribute("board_type", 2);
		command = new home_eventCommand();
		command.execute(model);

		command = new home_recipeCommand();
		command.execute(model);

		if (req.getParameter("fcm_token") != null) {
			String fcm_token = req.getParameter("fcm_token");
			session.setAttribute("FCM_TOKEN", fcm_token);
		}

		return "home";
	}

	private JdbcTemplate template;

	@Autowired
	public void setTemplate(JdbcTemplate template, HttpServletResponse resp) {
		this.template = template;
		System.out.println("@Autowired->JDBCTemplate 연결성공");
		JdbcTemplateConst.template = this.template;

		// 쓰레드 실행
		BackupThread bt = new BackupThread();
		bt.setDaemon(true);
		bt.start();

	}

}

class BackupThread extends Thread {

	@Override
	public void run() {
		while (true) {
			try {
				System.out.println("재고 백업은 10분마다 갱신합니다.");
				sleep(600000);
				StockDAO dao = new StockDAO();
				dao.backup();
			} catch (InterruptedException e) {
				System.out.println("백업스레드 잘못됨.");
			}
		}
	}

}
