package model.stock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import com.kosmo.phj.JdbcTemplateConst;

import model.board.serviceDTO;
import model.member.MemberDTO;
import model.place.PlaceDTO;

public class StockDAO {

	// 멤버변수
	JdbcTemplate template;

	// 생성자
	public StockDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("StockDAO()생성자 호출");
	}

	// 게시물 수 카운트
	public int getTotalCount(Map<String, Object> map) {
		System.out.println("getTotalCount() 메소드 실행.");

		String query = " SELECT COUNT(*) FROM phj_board_stock  ";

		return template.queryForObject(query, Integer.class);

	}

	// 편의점 별 재고 게시물 수 카운트
	public int getTotalCount(Map<String, Object> map, int place_code) {
		System.out.println("getTotalCount() 메소드 실행.");

		String query = " SELECT COUNT(*) FROM phj_board_stock  where place_code= " + place_code;

		return template.queryForObject(query, Integer.class);
	}

	// 레코드 페이지별로 가져오기
	public ArrayList<StockDTO> list(Map<String, Object> map, int product_code) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		System.out.println("DAO 내부의 product_code : " + product_code);
		String query = "  SELECT * FROM PHJ_board_stock ";
		query += " inner join phj_place " + "        on phj_board_stock.place_code = phj_place.place_code "
				+ "    inner join phj_product " + "        on phj_board_stock.product_code = phj_product.product_code "
				+ "  where phj_board_stock.product_code  =" + product_code;

		System.out.println("query : " + query);

		return (ArrayList<StockDTO>) template.query(query, new BeanPropertyRowMapper<StockDTO>(StockDTO.class));
	}

	public ArrayList<StockDTO> stockPlace(Map<String, Object> map, int place_code) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());

		String query = "SELECT * FROM ( " + " SELECT tb.*, rownum rNum from ("
				+ " SELECT * FROM phj_board_stock where place_code = " + place_code + " ) tb "
				+ " ) where rNum BETWEEN " + start + " AND " + end;

		return (ArrayList<StockDTO>) template.query(query, new BeanPropertyRowMapper<StockDTO>(StockDTO.class));

	}

	public StockDTO isPlusStock(String product_bookmark, String place_bookmark) {
		StockDTO dto = null;
		String sql = "SELECT stock, stock_backup FROM phj_stock_log where place_code = '" + place_bookmark
				+ "' AND product_code = '" + product_bookmark + "'";
		try {
			dto = template.queryForObject(sql, new BeanPropertyRowMapper<StockDTO>(StockDTO.class));

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("재고 백업데이터 실행시 예외발생.");
			dto = new StockDTO();
			dto.setStock("0");
			dto.setStock_backup("0");
		}

		return dto;
	}
	
	public void backup() {
		template.update(new PreparedStatementCreator() {
			
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "UPDATE phj_stock_log set stock_backup = stock ";
				PreparedStatement psmt = con.prepareStatement(sql);
				return psmt;
			}
		});
	}
}
