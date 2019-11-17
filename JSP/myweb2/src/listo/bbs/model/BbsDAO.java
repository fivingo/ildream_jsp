package listo.bbs.model;

import java.sql.*;
import java.util.ArrayList;

import oracle.net.aso.s;

public class BbsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int ERROR = -1;
	
	public BbsDAO() {
	}
	
	/** 총 게시글 개수 관련 메서드 */
	public int getTotalCount() {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT COUNT(*) FROM jsp_bbs";
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
	
	/** 목록 관련 메서드 */
	public ArrayList<BbsDTO> bbsList(int cPage, int listSize) {
		try {
			conn = listo.db.ListoDb.getConn();
			int startNumber = (cPage - 1) * listSize + 1;
			int endNumber = cPage * listSize;
			String sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS rnum, a.* FROM "
						+ "(SELECT * FROM jsp_bbs ORDER BY breference DESC, brank ASC) a) b "
						+ "WHERE rnum >= ? and rnum <= ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, startNumber);
			ps.setInt(2, endNumber);
			rs = ps.executeQuery();
			
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while (rs.next()) {
				int bidx = rs.getInt("bidx");
				String bwriter = rs.getString("bwriter");
				String bpwd = rs.getString("bpwd");
				String bsubject = rs.getString("bsubject");
				String bcontent = rs.getString("bcontent");
				Date bwriteDate = rs.getDate("bwriteDate");
				int breadCount = rs.getInt("breadCount");
				int breference = rs.getInt("breference");
				int blevel = rs.getInt("blevel");
				int brank = rs.getInt("brank");
				int brecommend = rs.getInt("brecommend");
				
				BbsDTO dto = new BbsDTO(bidx, bwriter, bpwd, bsubject, bcontent, 
						bwriteDate, breadCount, breference, blevel, brank, brecommend);
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
	
	/** 페이징 관련 메서드 */
	
	/** breference 마지막값 구하는 메서드 */
	public int getMaxRef() {
		try {
			String sql = "SELECT MAX(breference) FROM jsp_bbs";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int max = 0;
			if (rs.next()) {
				max = rs.getInt(1);
			}
			return max;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				
			} catch (Exception e2) {}
		}
	}
	
	/** 글쓰기 관련 메서드 */
	public int bbsWrite(BbsDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			int ref = getMaxRef();
			String sql = "INSERT INTO jsp_bbs "
					+ "VALUES (jsp_bbs_idx.nextval, ?, ?, ?, ?, SYSDATE, 0, ?, 0, 0, 0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getBwriter());
			ps.setString(2, dto.getBpwd());
			ps.setString(3, dto.getBsubject());
			ps.setString(4, dto.getBcontent());
			ps.setInt(5, ref + 1);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		} finally {
			try {
				if (ps != null) ps.close();
				if (rs != null)	rs.close();
			} catch (Exception e2) {}
		}
	}
	
	/** 본문 관련 메서드 */
	public BbsDTO bbsContent(int bidx) {
		try {
			conn =  listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM jsp_bbs WHERE bidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bidx);
			rs = ps.executeQuery();
			
			BbsDTO dto = null;
			while (rs.next()) {
				String bwriter = rs.getString("bwriter");
				String bpwd = rs.getString("bpwd");
				String bsubject = rs.getString("bsubject");
				String bcontent = rs.getString("bcontent");
				Date bwriteDate = rs.getDate("bwriteDate");
				int breadCount = rs.getInt("breadCount");
				int breference = rs.getInt("breference");
				int blevel = rs.getInt("blevel");
				int brank = rs.getInt("brank");
				int brecommend = rs.getInt("brecommend");
				
				dto = new BbsDTO(bidx, bwriter, bpwd, bsubject, bcontent,
						bwriteDate, breadCount, breference, blevel, brank, brecommend);
			}
			return dto;
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
	
	/** 게시글 조회수 관련 메서드 */
	public void readCount(int bidx, int breadCount) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "UPDATE jsp_bbs SET breadcount = ? WHERE bidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(2, bidx);
			ps.setInt(1, breadCount + 1);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/** 순번변경 관련 메서드 */
	public void setRankUpdate(int breference, int brank) {
		try {
			String sql =
					"UPDATE jsp_bbs SET brank = brank + 1 WHERE breference = ? and brank >= ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, breference);
			ps.setInt(2, brank);
			ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) ps.close();
			} catch (Exception e2) {}
		} 
	}
	
	/** 답변쓰기 관련 메서드 */
	public int bbsReWrite(BbsDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			setRankUpdate(dto.getBreference(), dto.getBrank() + 1);
			String sql =
					"INSERT INTO jsp_bbs VALUES(jsp_bbs_idx.nextval, ?, ?, ?, ?, SYSDATE, 0, ?, ?, ?, 0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getBwriter());
			ps.setString(2, dto.getBpwd());
			ps.setString(3, dto.getBsubject());
			ps.setString(4, dto.getBcontent());
			ps.setInt(5, dto.getBreference());
			ps.setInt(6, dto.getBlevel() + 1);
			ps.setInt(7, dto.getBrank() + 1);
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
}
