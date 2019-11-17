package listo.guestbook;

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
	public int guestWrite(GuestDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "INSERT INTO jsp_guestbook VALUES (jsp_guestbook_idx.nextval, ?, ?, SYSDATE, 0, 0, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getGid());
			ps.setString(2, dto.getGcontent());
			ps.setString(3, dto.getGipAddr());
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
			return 0;
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
	
	/** 방명록 수정 관련 메서드 */
	public int updateContent(int gidx, String gcontent) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "UPDATE jsp_guestbook SET gcontent = ?, gwriteDate = SYSDATE WHERE gidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, gcontent);
			ps.setInt(2, gidx);
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
	
	/** 방명록 삭제 관련 메서드 */
	public int deleteContent(int gidx) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "DELETE FROM jsp_guestbook WHERE gidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, gidx);
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
	
	/** 방명록 검색 관련 메서드 */
	public Vector<GuestDTO> guestSearch(int cPage, int listSize, String search_id) {
		try {
			int startNumber = (cPage - 1) * listSize + 1;
			int endNumber = cPage * listSize;
			
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, b.* FROM (SELECT * FROM"
					+ " (SELECT * FROM jsp_guestbook WHERE gid LIKE '%" + search_id + "%')"
					+ " a ORDER BY gidx DESC) b )c WHERE rnum >= ? and rnum <= ?";
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
	
	/** 방명록 댓글 수 관련 메서드 */
	public void guestComCount(int idx) {
		try {
			String sql = "UPDATE jsp_guestbook SET gcomcount = gcomcount + 1 WHERE gidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) ps.close();
			} catch (Exception e2) {}
		}
	}
	
	/** 방명록 댓글 등록 관련 메서드 */
	public int guestComment(GuestDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			guestComCount(dto.getGidx());
			
			String sql = "INSERT INTO jsp_guestbook VALUES (jsp_guestbook_idx.nextval, ?, ?, SYSDATE, 0, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getGid());
			ps.setString(2, dto.getGcontent());
			ps.setInt(3, dto.getGidx());
			ps.setString(4, dto.getGipAddr());
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
	
	/** 방명록 댓글 목록 관련 메서드 */
	public Vector<GuestDTO> guestListComment(int idx) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM jsp_guestbook WHERE gcomref = ? ORDER BY gidx DESC";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
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
