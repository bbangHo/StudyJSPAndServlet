package board;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import test.JDBConnect;

public class BoardDAO extends JDBConnect{
	public BoardDAO(ServletContext application) {
		super(application);
	}	//생성자  	
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM board ";
		if(map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " "
					+ "LIKE '%" + map.get("searchWord") + "%'";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return totalCount;
 	}
	
	public List<BoardDTO> selectList(Map<String, Object> map) {
		List<BoardDTO> blist = new Vector<BoardDTO>();
		
		String query = "SELECT * FROM "
						+ "("
						+ "SELECT b.*, rownum rN FROM"
							+ "("
							+ "SELECT * FROM board ";
		if(map.get("searchWord") != null) {
			query += "WHERE " + map.get("searchField") + " "
					+ "LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += "ORDER BY num DESC"
				+ ") b"
			+ ")"
			+ "WHERE rN BETWEEN ? and ? ";
		
		System.out.println(query);
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO bdto = new BoardDTO();
				
				bdto.setNum(rs.getString("num"));
				bdto.setTitle(rs.getString("title"));
				bdto.setId(rs.getString("id"));
				bdto.setContent(rs.getString("content"));
				bdto.setPostdate(rs.getDate("postdate"));
				bdto.setVisitcount(rs.getString("visitcount"));
				
				blist.add(bdto);
			}
		} catch (SQLException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		
		return blist;
	} //selectList
	
	public int writeView(BoardDTO dto) {
		int result = 0;
		
		String query = "INSERT INTO board ("
				+ " num, title, content, id, postdate, visitcount) "
				+ " VALUES ("
				+ " seq_board_num.NEXTVAL, ?, ?, ?, sysdate, 0)";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			
			result = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}

//		String query = "INSERT INTO board VALUES ("
//				+ "seq_board_num.NEXTVAL" + ", " 
//				+ "'" + dto.getTitle() + "', "
//				+ "'" + dto.getContent() + "', " 
//				+ "'" + dto.getId() + "', "
//				+ "SYSDATE" + ", "
//				+ 0
//				+ ")";
//		
//		try {
//			stmt = con.createStatement();
//			stmt.executeUpdate(query);
//			rs.next();
//			System.out.println(rs);
//		} catch (Exception e) {
//			e.getStackTrace();
//		}
		
		return result;
	} //writeView
	
	public BoardDTO selectBoard(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "SELECT * FROM board WHERE num LIKE '" + num + "'";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			if(rs.next()) {
			dto.setNum(rs.getString("num"));
			dto.setTitle(rs.getString("title"));
			dto.setContent(rs.getString("content"));
			dto.setId(rs.getString("id"));
			dto.setPostdate(rs.getDate("postdate"));
			dto.setVisitcount(rs.getString("visitcount"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	} //selectBoard
	
	public void visitCount(String num) {
		String query = "UPDATE board SET visitcount = visitcount + 1 WHERE num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	} //visitCount
	
	public void editBoard(BoardDTO dto) {
		String query = "UPDATE board SET title=?, content=?, postdate=sysdate WHERE num=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	} //editBoard
	
	public void deleteBoard(String num) {
		String query = "DELETE FROM board WHERE num='" + num + "'";
		
		try {
			stmt = con.createStatement();
			stmt.execute(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
