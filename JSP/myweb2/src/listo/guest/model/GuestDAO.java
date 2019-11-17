package listo.guest.model;

import java.sql.*;
import java.util.Vector;

public class GuestDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int ERROR = -1;
	
	public GuestDAO() {
		
	}
	
	/** 방명록 쓰기 관련 메서드 */
	public int guestWrite(String gwriter, String gcontent) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "INSERT INTO jsp_guestbook VALUES (jsp_guestbook_idx.nextval, ?, ?, SYSDATE, 0, 0, null)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, gwriter);
			ps.setString(2, gcontent);
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
	
	/** 총 방명록 글 관련 메서드 */
	public int getTotalCount() {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT COUNT(*) FROM jsp_guestbook";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			return count == 0 ? 1 : count;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/** 방명록 목록 관련 메서드 */
	public Vector<GuestDTO> guestList(int cPage, int listSize) {
		try {
			conn = listo.db.ListoDb.getConn();
			int startNumber = (cPage - 1) * listSize + 1;
			int endNumber = cPage * listSize;
			
			String sql = "SELECT * FROM "
					+ "(SELECT ROWNUM AS rnum, a.* FROM "
					+ "(SELECT * FROM jsp_guestbook WHERE gcomref = 0 ORDER BY gidx DESC) a) b "
					+ "WHERE rnum >= ? and rnum <= ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startNumber);
			ps.setInt(2, endNumber);
			rs = ps.executeQuery();
			
			Vector<GuestDTO> v = new Vector<GuestDTO>();
			while (rs.next()) {
				int gidx = rs.getInt("gidx");
				String gid = rs.getString("gid");
				String gcontent = rs.getString("gcontent");
				Date gwriteDate = rs.getDate("gwritedate");
				int gcomCount = rs.getInt("gcomcount");
				int gcomRef = rs.getInt("gcomref");
				String gipAddr = rs.getString("gipaddr");
				
				GuestDTO dto = new GuestDTO(gidx, gid, gcontent, gwriteDate, gcomCount, gcomRef, gipAddr);
				v.add(dto);
			}
			return v;
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
