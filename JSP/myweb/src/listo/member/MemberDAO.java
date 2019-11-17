package listo.member;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MemberDAO() {
	}
	
	/** 회원 가입 관련 메서드 */
	public int memberJoin (MemberDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = 
					"INSERT INTO jsp_member VALUES (jsp_member_idx.nextval, ?, ?, ?, ?, ?, SYSDATE)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getMid());
			ps.setString(2, dto.getMpwd());
			ps.setString(3, dto.getMname());
			ps.setString(4, dto.getMemail());
			ps.setString(5, dto.getMaddr());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/** id 중복 검사 관련 메서드 */
	public boolean idCheck(String userid) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT mid FROM jsp_member WHERE mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/** 회원 검색 관련 메서드 */
	public ArrayList<MemberDTO> memberFind(String fKey, String fValue) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = null;
			if (fKey.equals("mname")) {
				sql = "SELECT * FROM jsp_member WHERE mname = ?";
			} else if (fKey.equals("mid")) {
				sql = "SELECT * FROM jsp_member WHERE mid = ?";
			} else {
				System.out.println("일단 뭔가 잘못됨");
			}
			// String sql = "SELECT * FROM jsp_member WHERE + fKey + = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, fValue);
			rs = ps.executeQuery();
			
			ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
			while (rs.next()) {
				int midx = rs.getInt("midx");
				String mid = rs.getString("mid");
				String mpwd = rs.getString("mpwd");
				String mname = rs.getString("mname");
				String memail = rs.getString("memail");
				String maddr = rs.getString("maddr");
				Date mjoinDate = rs.getDate("mjoinDate");
				
				MemberDTO dto = new MemberDTO(
						midx, mid, mpwd, mname, memail, maddr, mjoinDate);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/** 로그인 관련 메서드*/
	public int loginCheck(String userId, String userPwd) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM jsp_member WHERE mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			
			String mpwd = null;
			if (rs.next()) {	// 아이디 유무 체크
				mpwd = rs.getString("mpwd");
			} else {
				return 1;	// 아이디없으면 1 리턴
			}
			
			if (userPwd.equals(mpwd)) {	// 비밀번호 일치 체크
				sql = "SELECT mpwd FROM jsp_member WHERE mid = ?";
				return 3;	// 일치하면 3 리턴
			} else {
				return 2;	// 틀리면 2리턴
			}
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
				
	}
	
	/** 로그인 사용자 이름  관련 메서드 */
	public String getUserInfo(String id) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT mname FROM jsp_member WHERE mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if (rs.next()) {
				String mname = rs.getString("mname");
				return mname;
			} else {
				System.out.println("아이디없음");
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
	}
}
