package listo.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int ERROR = -1;
	
	/** 회원 가입 관련 메서드 */
	public int memberJoin (MemberDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = 
					"INSERT INTO jsp_member VALUES (jsp_member_idx.nextval, ?, ?, ?, ?, ?, SYSDATE)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getMid());
			ps.setString(2, dto.getMname());
			ps.setString(3, dto.getMpwd());
			ps.setString(4, dto.getMemail());
			ps.setString(5, dto.getMaddr());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
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
}
