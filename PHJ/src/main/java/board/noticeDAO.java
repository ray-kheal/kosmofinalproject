package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.kosmo.phj.JdbcTemplateConst;

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

		String query = " SELECT COUNT(*) FROM PHJ_BOARD_NOTICE ";

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
		
	    System.out.println(map);
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
		// 조회수증가
		updateHit(idx);

		noticeDTO dto = null;

		String query = "SELECT * FROM springboard WHERE idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			if (rs.next()) {
				dto = new noticeDTO();

				dto.setIdx(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setView_count(rs.getInt(4));
				dto.setPostdate(rs.getDate(5));
				dto.setBoard_type(rs.getInt(6));
			}
		} catch (Exception e) {
			System.out.println("상세보기시 예외발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 조회수증가
	public void updateHit(String idx) {
		String sql = "UPDATE PHJ_BOARD_NOTICE SET VIEW_COUNT = VIEW_COUNT+1 WHERE idx=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
