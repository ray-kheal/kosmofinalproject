package com.kosmo.phj;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
		model.addAttribute("serverTime", formattedDate );
		
		model.addAttribute("req",req);
		model.addAttribute("board_type",1);
		command = new home_notiCommand();
		command.execute(model);
		
		model.addAttribute("req",req);
		model.addAttribute("board_type",2);
		command = new home_eventCommand();
		command.execute(model);
	
	  command = new home_recipeCommand(); 
	  command.execute(model);
	 
		
		return "home";
	}
	private JdbcTemplate template;
	
	@Autowired
	public void setTemplate(JdbcTemplate template) {
		this.template = template;
		System.out.println("@Autowired->JDBCTemplate 연결성공");
		JdbcTemplateConst.template = this.template;
		
		/*
		 종속쓰레드 실행
		 */
		DaemonThread dt = new DaemonThread();
		dt.setName("난 데몬쓰레드");
		dt.setDaemon(true);
		dt.start();
	}
	
	class DaemonThread extends Thread{
		
		@Override
		public void run() {
			while(true) {
				System.out.println(String.format("쓰레드명 : %s] Jazz가 흘러요", getName()));
				try {
					sleep(3000);
					System.out.println("3초마다 자동저장!!");
				} catch(InterruptedException e) {
					System.out.println("자동저장시 오류발생");
				}
			}
		}
	}
	
	
}
