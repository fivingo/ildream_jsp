package listo.bbs;

import java.sql.*;
import java.util.ArrayList;

public class BbsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	public static final int ERROR = -1;
	
	public BbsDAO() {
		
	}
	
	/**** 게시글 목록 출력 관련 메서드 */
	public ArrayList<BbsDTO> bbsList_myself() {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = 
					"SELECT * FROM jsp_bbs ORDER BY bidx DESC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while (rs.next()) {
				int bidx = rs.getInt("bidx");
				String bwriter = rs.getString("bwriter");
				String bpwd = null;
				String bsubject = rs.getString("bsubject");
				String bcontent = rs.getString("bcontent");
				Date bwriteDate = rs.getDate("bwriteDate");
				int breadCount = rs.getInt("breadCount");
				int breference = 0;
				int blevel = 0;
				int brank = 0;
				int brecommend = 0;
				
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
	
	/** 목록 관련 메서드 */
	public ArrayList<BbsDTO> bbsList(int cPage, int listSize) {
		try {
			conn = listo.db.ListoDb.getConn();
			int startNumber = (cPage - 1) * listSize + 1;
			int endNumber = cPage * listSize;
			/*
			SELECT * FROM (SubQuery(SubQuery) a) b WHERE conditions;
			ROWNUM: 조회한 결과에 순번을 지정하는 키워드
			AS: 특정 컬럼에 별칭을 지정하는 키워드
			ROWNUM AS rnum, a.* => a서브쿼리(하위쿼리)의 모든 컬럼을 rnum이라는 컬럼명으로 순번을 지정한다
			*/
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
	
	/**** 글쓰기 관련 메서드 */
	public int bbsWrite_myself(BbsDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql =
					"INSERT INTO jsp_bbs (bidx, bwriter, bpwd, bsubject, bcontent, bwriteDate) "
					+ "VALUES (jsp_bbs_idx.nextval, ?, ?, ?, ?, SYSDATE)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getBwriter());
			ps.setString(2, dto.getBpwd());
			ps.setString(3, dto.getBsubject());
			ps.setString(4, dto.getBcontent());
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
			return 0;
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
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
			return -1;
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
	
	/**** 게시판 본문 보기 관련 메서드 */
	public BbsDTO bbsContent_myself(int idx_temp) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM jsp_bbs WHERE bidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx_temp);
			rs = ps.executeQuery();
			BbsDTO dto = null;
			while (rs.next()) {
				int bidx = rs.getInt("bidx");
				String bwriter = rs.getString("bwriter");
				String bpwd = rs.getString("bpwd");
				String bsubject = rs.getString("bsubject");
				String bcontent = rs.getString("bcontent");
				Date bwriteDate = rs.getDate("bwriteDate");
				int breadCount = rs.getInt("breadCount");
				int breference = 0;
				int blevel = 0;
				int brank = 0;
				int brecommend = 0;
				
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
	
	/** 본문 관련 메서드 */
	public BbsDTO bbsContent(int bidx) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM jsp_bbs WHERE bidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, bidx);
			rs = ps.executeQuery();
			
			BbsDTO dto = null;
			while (rs.next()) {
				// bidx는 이미 있으니 생략
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
	
	/** 페이징 관련 메서드 */
	public ArrayList<BbsDTO[]> bbsListPaging(ArrayList<BbsDTO> arr, int numberPerPage) {
		int count = 0;
		try {
			ArrayList<BbsDTO[]> arr_paging = new ArrayList<BbsDTO[]>();
			for (int i = 0; i < (arr.size() / numberPerPage) + 1; i++) {	// 페이지화
				BbsDTO[] paging = new BbsDTO[numberPerPage];	// 글 5개짜리 배열 생성
				for (int j = 0; j < numberPerPage; j++) {		// arr의 글 5개씩 대입
					if (count + j < arr.size()) {
						paging[j] = arr.get(count + j);
					}
				}
				arr_paging.add(paging);		// 페이지 배열 생성
				count += numberPerPage;		// count 5씩 증가
			}
			return arr_paging;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("또 안됨 또 또");
			System.out.println("또 안됨 또 또");
			System.out.println("또 안됨 또 또");
			return null;
		}
	}
	
	/** 게시글 수정 관련 메서드 */
	public int updateContent(int idx, String pwd, String subject, String content) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT bpwd FROM jsp_bbs WHERE bidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			rs.next();
			if(rs.getString("bpwd").equals(pwd)){
				sql = "UPDATE jsp_bbs SET bsubject=?, bcontent=?, bwriteDate=SYSDATE WHERE bidx=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, subject);
				ps.setString(2, content);
				ps.setInt(3, idx);
				int count = ps.executeUpdate();
				return count;
			} else {
				return 0;
			}
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
	
	/** 게시글 삭제 관련 메서드 */
	public int deleteContent(int userIdx, String userPwd) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT bpwd FROM jsp_bbs WHERE bidx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, userIdx);
			rs = ps.executeQuery();
			String bpwd = null;
			while (rs.next()) {
				bpwd = rs.getString("bpwd");
			} 
			if(bpwd.equals(userPwd)){
				sql = "DELETE FROM jsp_bbs WHERE bidx=?";
				ps = conn.prepareStatement(sql);
				ps.setInt(1, userIdx);
				int result = ps.executeUpdate();
				return result;
			} else {
				return 0;
			}
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
	
	/** 총 게시글 관련 메서드 */
	public int getTotalCount() {
		try {
			conn = listo.db.ListoDb.getConn();
			// 함수 count(column_name): 중복값 포함, null값 제외한 컬럼의 개수 확인
			String sql = "SELECT COUNT(*) FROM jsp_bbs";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);		// 첫번째 인덱스의 값 반환
			return count == 0 ? 1 : count;	// ArithmeticException 발생대비 0대신 1반환
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
	
	/** 검색된 총 게시글 관련 메서드 */
	public int getTotalCount_search(String search_s, String search_t) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT COUNT(*) FROM jsp_bbs WHERE " + search_s + " LIKE '%" + search_t + "%'";
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
	
	/** 게시글 검색 관련 메서드 */
	public ArrayList<BbsDTO> listSearch(int cPage, int listSize, String search_s, String search_t) {
		try {
			int startNumber = (cPage - 1) * listSize + 1;
			int endNumber = cPage * listSize;
			
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, b.* FROM (SELECT * FROM"
					+ " (SELECT * FROM jsp_bbs WHERE " + search_s + " LIKE '%" + search_t + "%')"
					+ " a ORDER BY breference DESC, brank ASC) b )c WHERE rnum >= ? and rnum <= ?";
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
	
	/** 게시글 추천/비추천 관련 메서드 */
	public int ContentRecommend(int bidx, int brec, String user) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "UPDATE jsp_bbs SET brecommend = ? WHERE bidx = ?";
			ps = conn.prepareStatement(sql);
			if (user.equals("up")) {
				ps.setInt(1, brec + 1);
			} else if (user.equals("down")) {
				ps.setInt(1, brec - 1);
			}
			ps.setInt(2, bidx);
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
	
	/** 기본 목록 정렬 관련 메서드 */
	public ArrayList<BbsDTO> bbsListSort(int cPage, int listSize, String sort) {
		try {
			conn = listo.db.ListoDb.getConn();
			int startNumber = (cPage - 1) * listSize + 1;
			int endNumber = cPage * listSize;
			String sql = "SELECT * FROM "
						+ "(SELECT ROWNUM AS rnum, a.* FROM "
						+ "(SELECT * FROM jsp_bbs ORDER BY " + sort + " DESC) a) b "
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
	
	/** 게시글 검색 관련 메서드 */
	public ArrayList<BbsDTO> listSearchSort(int cPage, int listSize, String search_s, String search_t, String sort) {
		try {
			int startNumber = (cPage - 1) * listSize + 1;
			int endNumber = cPage * listSize;
			
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM (SELECT ROWNUM AS rnum, b.* FROM (SELECT * FROM"
					+ " (SELECT * FROM jsp_bbs WHERE " + search_s + " LIKE '%" + search_t + "%')"
					+ " a ORDER BY " + sort + " DESC) b )c WHERE rnum >= ? and rnum <= ?";
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
}
































