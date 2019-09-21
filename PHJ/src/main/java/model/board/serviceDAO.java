package model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.kosmo.phj.JdbcTemplateConst;

public class serviceDAO {
	Connection con;
	PreparedStatement psmt;
	ResultSet rs;
	JdbcTemplate template;	
	public serviceDAO() {
		this.template = JdbcTemplateConst.template;
	}
	public int getTotalCount(Map<String, Object> map) {
		System.out.println("getTotalCount() 메소드 실행.");
		
		String query = " SELECT COUNT(*) FROM PHJ_BOARD_SERVICE";
//	      if (map.get("Word") != null) {
//	         query += "WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%'";
//	      }
		return template.queryForObject(query, Integer.class);
	}
	
	public ArrayList<serviceDTO> list(Map<String, Object> map) {

		int start = 1;
		int end = 10;
		String query = " SELECT * FROM( " + "    SELECT Tb.*, ROWNUM rNum FROM( " + "      SELECT * FROM PHJ_BOARD_SERVICE ";

		if (map.get("Word") != null) {

			query += " WHERE " + map.get("Column") + " " + " LIKE '%" + map.get("Word") + "%' ";
		}

		query += " ORDER BY bgroup DESC, bstep asc ) Tb ) WHERE rNum BETWEEN " + start + " AND " + end;

		return (ArrayList<serviceDTO>) template.query(query,
				new BeanPropertyRowMapper<serviceDTO>(serviceDTO.class));
	}
	public serviceDTO view(String idx) {
		// 조회수 증가
		updateHit(idx);

		serviceDTO dto = null;

		String sql = "select * from PHJ_BOARD_SERVICE where idx= " + idx;
		try {

			dto = template.queryForObject(sql, new BeanPropertyRowMapper<serviceDTO>(serviceDTO.class));
		} catch (Exception e) {
			System.out.println("view()실행시 예외발생");
			dto = new serviceDTO();
		}

		return dto;
	}
	public void updateHit(final String idx) {
		String sql = "update PHJ_BOARD_SERVICE set VIEW_COUNT = VIEW_COUNT+1 where idx=?";
		
		template.update(sql, new PreparedStatementSetter() {

			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setInt(1, Integer.parseInt(idx));
			}
		});

	}
	public void write(final serviceDTO serviceDTO) {

		template.update(new PreparedStatementCreator() {

			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "INSERT INTO PHJ_BOARD_SERVICE(idx, name, title, content, view_count, postdate, bgroup, bstep, bindent)"
						+ "VALUES(SEQ_PHJ_BOARD_SERVICE.NEXTVAL, ?, ?, ?, 0, sysdate, SEQ_PHJ_BOARD_SERVICE.NEXTVAL, 0, 0)";

				PreparedStatement psmt = con.prepareStatement(sql);
				psmt.setString(1, serviceDTO.getName());
				psmt.setString(2, serviceDTO.getTitle());
				psmt.setString(3, serviceDTO.getContent());
				return psmt;
			}
		});
	}
	
	 public void reply (final serviceDTO dto) {
		   //답변글 쓰기 전 레코드 업데이트
		   replyPreUpdate (dto.getBgroup(),dto.getBstep());
		   
		   //답변글 입력
		   String sql = "INSERT INTO PHJ_BOARD_SERVICE(idx, name, title, content, view_count, postdate, bgroup, bstep, bindent)"
					+ "VALUES(SEQ_PHJ_BOARD_SERVICE.NEXTVAL, ?, ?, ?, 0, sysdate, ?, ?, ?)";
			  template.update(sql,new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {

					ps.setString(1, dto.getName());
					ps.setString(2, dto.getTitle());
					ps.setString(3, dto.getContent());
					ps.setInt(4, dto.getBgroup());
					ps.setInt(5, dto.getBstep()+1);
					ps.setInt(6, dto.getBindent()+1);
					
					
				}
			});
 }
	  public void replyPreUpdate(final int strGroup, final int strStep) {
		  
		  String query = "update PHJ_BOARD_SERVICE set bstep =bstep+1 where bgroup=? and bstep>?";
	
		  template.update(query, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
			
				ps.setInt(1, strGroup);
				ps.setInt(2, strStep);
				
			}
		});
  }
	  
	  public void edit(final serviceDTO dto) {
		  
		   String sql = "update PHJ_BOARD_SERVICE set name =?, title=?,content=? where idx=?";
		   	template.update(sql,new PreparedStatementSetter() {
				
				@Override
				public void setValues(PreparedStatement ps) throws SQLException {
					
					ps.setString(1, dto.getName());
					ps.setString(2, dto.getTitle());
					ps.setString(3, dto.getContent());
					ps.setInt(4, dto.getIdx());
					
					
				}
			});
  }
	  public void delete(final String idx) {
		   String sql = "delete from PHJ_BOARD_SERVICE where idx=? ";
		 template.update(sql, new PreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
			
				ps.setString(1, idx);
			}
		});
	}
}
