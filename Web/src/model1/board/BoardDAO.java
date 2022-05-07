package model1.board;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletContext;

import JDBC.JDBConnect;

// DAO는 데이터베이스의 data에 접근하기 위한 객체입니다. 
// DataBase에 접근 하기 위한 로직 & 비지니스 로직을 분리하기 위해 사용합니다.

public class BoardDAO extends JDBConnect {
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//게시물 개수를 세는 함수
	public int selectCount(Map<String, Object> map) {
		int total = 0;
		
		String query = "SELECT COUNT(*) FROM board ";		//쿼리
		if(map.get("searchField") != null) {
			query += "WHERE " + map.get("searchField") + " "
					+ "LiKE '%" + map.get("searchWord") + "%' ";
			
		}
		try {
			stmt = con.createStatement();		//쿼리 실행 객체 생성
			rs = stmt.executeQuery(query);		//쿼리 실행
			rs.next();							//select에 의해 가져온 값 전에 있던 커서를 옮김
			total = rs.getInt(1);			//저장
			
		} catch (Exception e) {
			System.out.println("게시물 처리 중 예외발생");
			e.printStackTrace();
		}
		
		return total;
	}

	// 게시물을 읽어서 가져오는 함수
	public ArrayList<BoardDTO> selectList(Map<String, Object> map) {
			ArrayList<BoardDTO> bdto = new ArrayList<BoardDTO>();
		
		String query = "SELECT * FROM board ";
		if(map.get("searchField") != null) {
			query += "WHERE " + map.get("searchField") + " "
					+ "LiKE '%" + map.get("searchWord") + "%' ";
		}
		query += "ORDER BY num DESC";
		
		try {
			stmt = con.createStatement();		//쿼리 실행 객체 생성
			rs = stmt.executeQuery(query);

			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				
                dto.setNum(rs.getString("num"));          // 일련번호
                dto.setTitle(rs.getString("title"));      // 제목
                dto.setContent(rs.getString("content"));  // 내용
                dto.setPostdate(rs.getDate("postdate"));  // 작성일
                dto.setId(rs.getString("id"));            // 작성자 아이디
                dto.setVisitcount(rs.getString("visitcount"));  // 조회수
				
				bdto.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bdto;
	}
}

