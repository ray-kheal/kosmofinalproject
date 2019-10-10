package model.notify;

import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.kosmo.phj.JdbcTemplateConst;

public class NotifyDAO {

	// 멤버변수
	JdbcTemplate template;

	// 생성자
	public NotifyDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("StockDAO()생성자 호출");
	}
	
	public ArrayList<NotifyDTO> notiInfo(String place_code){
		String sql = "SELECT mobile_alert, place_bookmark, products_bookmark, stock, stock_backup, fcm_token " + 
				" FROM phj_member " + 
				" INNER JOIN phj_product on phj_member.products_bookmark=phj_product.product_code " + 
				" INNER JOIN phj_place on phj_member.place_bookmark=phj_place.place_code " + 
				" INNER JOIN phj_stock_log on phj_member.place_bookmark=phj_stock_log.place_code " + 
				" AND phj_member.products_bookmark=phj_stock_log.product_code " + 
				" WHERE place_bookmark= " + place_code;
		
		return (ArrayList<NotifyDTO>)template.query(sql, new BeanPropertyRowMapper<NotifyDTO>(NotifyDTO.class));
		
	}

}
