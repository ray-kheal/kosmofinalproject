package model.stock;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;

import org.springframework.jdbc.core.PreparedStatementSetter;

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

		String query = " SELECT COUNT(*) FROM phj_stock_log  ";

		return template.queryForObject(query, Integer.class);

	}

	// 편의점 별 재고 게시물 수 카운트
	public int getTotalCount(Map<String, Object> map, int place_code) {
		System.out.println("getTotalCount() 메소드 실행.");

		String query = " SELECT COUNT(*) FROM phj_stock_log  where place_code= " + place_code;

		return template.queryForObject(query, Integer.class);
	}

	// 레코드 페이지별로 가져오기
	public ArrayList<StockDTO> list(Map<String, Object> map, int product_code) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		System.out.println("DAO 내부의 product_code : " + product_code);
		String query = "  SELECT * FROM PHJ_stock_log ";
		query += " inner join phj_place " + "        on phj_stock_log.place_code = phj_place.place_code "
				+ "    inner join phj_product " + "        on phj_stock_log.product_code = phj_product.product_code "
				+ "  where phj_stock_log.product_code  =" + product_code;

		System.out.println("query : " + query);

		return (ArrayList<StockDTO>) template.query(query, new BeanPropertyRowMapper<StockDTO>(StockDTO.class));
	}

	// 점포별 재고량
	public ArrayList<StockDTO> stockPlace(Map<String, Object> map, int place_code) {

		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());

		String query = "SELECT * FROM ( " + " SELECT tb.*, rownum rNum from (" + " SELECT * FROM phj_stock_log "
				+ "    inner join phj_product " + "        on phj_stock_log.product_code = phj_product.product_code "
				+ "	where place_code = " + place_code + " ) tb " + " ) where rNum BETWEEN " + start + " AND " + end;

		return (ArrayList<StockDTO>) template.query(query, new BeanPropertyRowMapper<StockDTO>(StockDTO.class));
	}

	// 알림을 위해 기존재고백업과 신규재고백업을 비교하기위해 가져옴.
	public StockDTO isPlusStock(String products_bookmark, String place_bookmark) {
		StockDTO dto = null;
		String sql = " SELECT * FROM phj_stock_log " + " inner join phj_place "
				+ "        on phj_stock_log.place_code = phj_place.place_code " + "    inner join phj_product "
				+ "        on phj_stock_log.product_code = phj_product.product_code "
				+ " where phj_stock_log.place_code = '" + place_bookmark + "' AND phj_stock_log.product_code = '"
				+ products_bookmark + "'";
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
		System.out.println("재고 백업 완료");
	}

	// 재고량
	public void plusStock(final String place_code, final String product_code, final String stock) {
		System.out.println("dao 내부의 place_code" + place_code);
		template.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "UPDATE phj_board_stock SET stock=stock+" + stock + " WHERE place_code=" + place_code
						+ " AND product_code=" + product_code;
				System.out.println(sql);
				PreparedStatement psmt = con.prepareStatement(sql);
				return psmt;
			}
		});

		System.out.println("재고 입력 완료");
	}
}
