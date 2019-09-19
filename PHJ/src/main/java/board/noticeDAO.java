package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.kosmo.phj.JdbcTemplateConst;

import model.board.noticeDTO;

public class noticeDAO {

	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	JdbcTemplate template;

	public noticeDAO() {
		this.template = JdbcTemplateConst.template;
		// System.out.println("MemberDAO 생성자 호출 로그");
	}

	// 게시물 수 카운트
	public int getTotalCount(Map<String, Object> map) {
		System.out.println("getTotalCount() 메소드 실행.");
		int board_type = (Integer)map.get("board_type");
		String query = " SELECT COUNT(*) FROM PHJ_BOARD_NOTICE  where board_type=" + board_type;

//	      if (map.get("Word") != null) {
//	         query += "WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%'";
//	      }

		return template.queryForObject(query, Integer.class);

	}

	public ArrayList<noticeDTO> list(Map<String, Object> map) {
		System.out.println("list()메소드 실행");
		int start = Integer.parseInt(map.get("start").toString());
		int end = Integer.parseInt(map.get("end").toString());
		int board_type = (Integer)map.get("board_type");
		String query = " SELECT * FROM( " + "    SELECT Tb.*, ROWNUM rNum FROM( " + " SELECT * FROM PHJ_BOARD_NOTICE ";

		if (map.get("Word") != null) {

			query += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}

		query += " ) Tb ) WHERE rNum BETWEEN " + start + " AND " + end +" and board_type="+ board_type ;
		
	    
		return (ArrayList<noticeDTO>) template.query(query, new BeanPropertyRowMapper<noticeDTO>(noticeDTO.class));
	}
	/*
	 * //답변형 게시판 글쓰기 처리 public void write(noticeDTO dto) { try { String query =
	 * " INSERT INTO springboard (idx, name, title, contents,hits, bgroup, bstep, bindent,pass ) "
	 * +
	 * " VALUES (springboard_seq.NEXTVAL, ? , ?, ?, 0, springboard_seq.NEXTVAL , 0, 0, ?)"
	 * ;
	 * 
	 * psmt = con.prepareStatement(query); psmt.setString(1, dto.getName());
	 * psmt.setString(2, dto.getTitle()); psmt.setString(3, dto.getContents());
	 * psmt.setString(4, dto.getPass()); psmt.executeUpdate();
	 * 
	 * } catch(Exception e){ System.out.println("글쓰기중 예외발생"); e.printStackTrace(); }
	 * }
	 */

	// 답변형 게시판 상세보기및 답변글달기에서 사용
	public noticeDTO view(String idx) {
		// 조회수 증가
		updateHit(idx);

		noticeDTO dto = null;

		String sql = "select * from PHJ_BOARD_NOTICE where idx= " + idx;
		try {

			dto = template.queryForObject(sql, new BeanPropertyRowMapper<noticeDTO>(noticeDTO.class));
		} catch (Exception e) {
			System.out.println("view()실행시 예외발생");
			dto = new noticeDTO();
		}

		return dto;
	}
	

	// 조회수증가
	public void updateHit(final String idx) {
		String sql = "update PHJ_BOARD_NOTICE set view_count = view_count+1 where idx=?";
		
		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(idx));
			}
		});

	}
	/*
	 * public int password(String idx, String pass) { int retNum = 0; try { String
	 * sql = "SELECT * FROM springboard WHERE pass=? AND idx=?"; psmt =
	 * con.prepareStatement(sql); psmt.setString(1, pass); psmt.setString(2, idx);
	 * rs= psmt.executeQuery(); if(rs.next()) { retNum = rs.getInt(1); };
	 * 
	 * } catch(Exception e) { retNum = 0; e.printStackTrace(); } return retNum; }
	 */

	// 답변형 게시판 수정하기(DTO로 파라미터 받음)
	/*
	 * // public void edit(noticeDTO dto) { // try { // String query =
	 * " UPDATE springboard SET name=?, title=?, contents=? WHERE idx=? and pass=? "
	 * ; // // psmt = con.prepareStatement(query); // psmt.setString(1,
	 * dto.getName()); // psmt.setString(2, dto.getTitle()); // psmt.setString(3,
	 * dto.getContents()); // psmt.setInt(4, dto.getIdx()); // psmt.setString(5,
	 * dto.getPass()); // psmt.executeUpdate(); // // } catch(Exception e){ //
	 * System.out.println("글 수정중 예외발생"); // e.printStackTrace(); // } // }
	 */

	// 삭제하기
	public void delete(String idx, String pass) {
		try {
			String query = "DELETE FROM PHJ_BOARD_NOTICE WHERE idx=?";
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(idx));

			int rn = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("delete중 예외발생");
			e.printStackTrace();
		}
	}
}
