package model.product;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import com.kosmo.phj.JdbcTemplateConst;

import model.board.serviceDTO;
import model.member.MemberDTO;


public class ProductDAO {
	//멤버변수
	JdbcTemplate template;
	
	//생성자
	public ProductDAO() {
		this.template = JdbcTemplateConst.template;
		System.out.println("ProductDAO()생성자 호출");
	}
	
	//게시물 수 카운트
	public int getTotalCount(Map<String, Object> map) {
		/*
		  int start = Integer.parseInt(map.get("start").toString()); int end =
		  Integer.parseInt(map.get("end").toString());
		 */
		System.out.println("getTotalCount() 메소드 실행.");
		
		String query = " SELECT COUNT(*) FROM PHJ_PRODUCT ";

		if (map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%'";
		}
		if (map.get("priceRange") != null) {
			
			if(map.get("priceRange").equals("1500to5000")||map.get("priceRange")=="1500to5000") {//1500-5000사이 추리기
				query += " AND product_price between 1500 and 5000 ";
			}
			
			else{
				query += " AND product_price " + map.get("priceRange") ;
			}
			
		}
		
		System.out.println("query : " + query);
	
		return template.queryForObject(query, Integer.class);
		
	}
	
	
   //레코드 페이지별로 가져오기
   public ArrayList<ProductDTO> list(Map<String, Object> map) {
      
      int start = Integer.parseInt(map.get("start").toString());
      int end = Integer.parseInt(map.get("end").toString());
      
      String query = " SELECT * FROM( "
            +"    SELECT Tb.*, ROWNUM rNum FROM( " 
            + "      SELECT * FROM PHJ_PRODUCT WHERE 1=1";

		if (map.get("searchWord") != null) {
			query += " AND " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		if (map.get("priceRange") != null) {
			
			if(map.get("priceRange").equals("1500to5000")||map.get("priceRange")=="1500to5000") {//1500-5000사이 추리기
				query += " AND product_price between 1500 and 5000 ";
			}
			
			else{
				query += " AND product_price " + map.get("priceRange") ;
			}
			
			System.out.println("priceRange:"+map.get("priceRange"));
			
		}
		
		query += ") Tb ) WHERE rNum BETWEEN "+start+" AND "+end;
		
		System.out.println(map);
		
		return (ArrayList<ProductDTO>)template.query(query, new BeanPropertyRowMapper<ProductDTO>(ProductDTO.class));
	}
   
	//레코드 가격별로 가져오기
	public ArrayList<ProductDTO> listSort(Map<String, Object> map) {
		
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		
		String query = " SELECT * FROM( "
				+"    SELECT Tb.*, ROWNUM rNum FROM( " 
				+ "      SELECT * FROM PHJ_PRODUCT ";
		
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchColumn") + " " + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		query += ") Tb ) WHERE rNum BETWEEN "+start+" AND "+end +"ORDER BY PRODUCT_PRICE DESC";
		
		System.out.println(map);
		
		return (ArrayList<ProductDTO>)template.query(query, new BeanPropertyRowMapper<ProductDTO>(ProductDTO.class));
	}
		
		
	//상품 삭제하기
	public void delete(final String product_code) {

		System.out.println("delete할 product_code:"+product_code);
		String sql = "DELETE FROM PHJ_PRODUCT WHERE product_code=? ";
		 template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
			
				ps.setString(1, product_code);
			}
		});
		
	}
	
	//상품이름 불러오기
	public ProductDTO searchProduct(String productCode) {
		ProductDTO dto;
		
		String sql = "SELECT product_name FROM phj_product WHERE product_code ="+productCode;
		
		try {
			dto = template.queryForObject(sql, new BeanPropertyRowMapper<ProductDTO>(ProductDTO.class));
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("상품명 가져오기 실행시 예외발생.");
			dto = new ProductDTO();
		}
		return dto;
	}
		
}
