package com.kosmo.phj;

import java.io.IOException;
import java.io.PrintWriter;
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
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import command.PHJCommandImpl;
import command.home_eventCommand;
import command.home_notiCommand;
import command.home_recipeCommand;
import model.stock.StockDAO;
import model.stock.StockDTO;
import util.ContextUtil;

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
	public String home(Locale locale, Model model, HttpServletRequest req) {
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

		
		
		AlertThread dt = new AlertThread();
		
		
		HttpSession session = req.getSession();
		if (session.getAttribute("EMAIL") != null) {
			System.out.println("현재로그인된이메일 : " + session.getAttribute("EMAIL"));
			if (session.getAttribute("PRODUCTS_BOOKMARK") != null && session.getAttribute("PLACE_BOOKMARK") != null) {
				dt = new AlertThread(
						session.getAttribute("EMAIL").toString(),
						session.getAttribute("PRODUCTS_BOOKMARK").toString(),
						session.getAttribute("PLACE_BOOKMARK").toString(),
						session.getAttribute("ALERT").toString()
						);
				if (session.getAttribute("ALERT").equals("Y")) {
					
//					dt.setName("스레드테스트");
//					dt.start();
					
				} else {
					System.out.println("알림설정 off로 되어있음.");
				}

			} else {
				System.out.println("관심점포/상품 등록안됨");
			}

		} else {
			System.out.println("현재 로그인된 이메일 없음.");
		}

		return "home";
	}

	private JdbcTemplate template;

	@Autowired
	public void setTemplate(JdbcTemplate template, HttpServletResponse resp) {
		this.template = template;
		System.out.println("@Autowired->JDBCTemplate 연결성공");
		JdbcTemplateConst.template = this.template;
		
		//쓰레드 실행
		BackupThread bt = new BackupThread();
		bt.setDaemon(true);
		bt.start();
		
		
	}
	

}

class AlertThread extends Thread {
	String email, product_bookmark, place_bookmark, alert;
	int stock, stock_backup;
	
	public AlertThread() {}
	
	public AlertThread(String email, String product_bookmark, String place_bookmark, String alert) {
		this.email = email;
		this.product_bookmark = product_bookmark;
		this.place_bookmark = place_bookmark;
		this.alert = alert;
	}
	



	@Override
	public void run() {
		while(true) {
			try {
				StockDAO dao = new StockDAO();
				StockDTO dto = dao.isPlusStock(product_bookmark, place_bookmark);
				stock = Integer.parseInt(dto.getStock());
				stock_backup = Integer.parseInt(dto.getStock_backup());
				System.out.println(product_bookmark +" " + place_bookmark);
				System.out.println("실행주기테스트");
				sleep(3000);
				if(stock>stock_backup) {
					System.out.println(String.format("[쓰레드명 : %s] ", getName()));
					try{
						HttpServletResponse resp = ContextUtil.getResponse();
						resp.setContentType("text/html; charset=utf-8");
						PrintWriter out = resp.getWriter();
						out.print("<script>calculate()</script>");
					    out.flush();

						sleep(1000000);
						
					} catch(InterruptedException e) {
						System.out.println("스레드 잘못됨 뭐 그렇다구..");
					}
				} else {
				}
				
			} catch(Exception e){
				e.printStackTrace();
				System.out.println("스레드 처음부터 잘못됨 뭐 그렇다구..");	
			}
		}		
	}
}

class BackupThread extends Thread {
	
	@Override
	public void run() {
		while(true) {
			try {
				System.out.println("재고 백업은 10분마다 갱신합니다.");
				sleep(1000000);
				StockDAO dao = new StockDAO();
				dao.backup();
			} catch(InterruptedException e) {
				System.out.println("백업스레드 잘못됨.");
			}
		}
	}
	
}
