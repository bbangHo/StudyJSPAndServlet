package assistCh6;
import test.*;

public class MemberDAO extends JDBConnect {
	
	public MemberDAO(String driver, String url, String id, String pwd) {
		super(driver, url, id, pwd);
	}  // MemberDAO 생성자
	
	public MemberDTO getMemberDTO(String user_id, String user_pwd) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pass=?";	// db에서 일치하는 id와 pass를 찾기위한 쿼리문
		
		try {
			psmt = con.prepareStatement(query);		// 쿼리문 객체 생성
			psmt.setString(1, user_id);				// 인파라미터에 값 추가
			psmt.setString(2, user_pwd);
			rs = psmt.executeQuery();		// 쿼리문 실행
			
			/* rs값이 비어있다는 것은 query를 수행했을 때 값이 없다는 것을 뜻함
			 * 즉, DB에 user_id와 user_pw가 없다는 뜻
			 * */
			if(rs.next()) {	
				dto.setId(rs.getString(1));			//  dto.setId(rs.getString("id")); 로도 쓸 수 있다.
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}  // getMemberDTO()

}
