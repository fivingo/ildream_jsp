package listo.emp.model;

import java.util.*;
import java.sql.*;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public EmpDAO() {
	}
	
	/** 사원 등록 관련 메서드 */
	public int empAdd(EmpDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "INSERT INTO employee VALUES(employee_idx.nextval, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getEname());
			ps.setString(2, dto.getEemail());
			ps.setString(3, dto.getEdept());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null ) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/** 사원 삭제 관련 메서드 */
	public int empDel(int idx) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "DELETE FROM employee WHERE eidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null ) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/** 모든 사원 내역 보기 관련 메서드 */
	public ArrayList<EmpDTO> empAllList() {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM employee ORDER BY eidx DESC";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			
			ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();
			while (rs.next()) {
				int eidx = rs.getInt("eidx");
				String ename = rs.getString("ename");
				String eemail = rs.getString("eemail");
				String edept = rs.getString("edept");
				
				EmpDTO dto = new EmpDTO(eidx, ename, eemail, edept);
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
				if (conn != null ) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/** 사원 검색 관련 메서드 */
	public ArrayList<EmpDTO> empSearch(String name) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM employee WHERE ename = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			rs = ps.executeQuery();
			ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();
			while (rs.next()) {
				int eidx = rs.getInt("eidx");
				String ename = rs.getString("ename");
				String eemail = rs.getString("eemail");
				String edept = rs.getString("edept");
				
				EmpDTO dto = new EmpDTO(eidx, ename, eemail, edept);
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
	
	/** 사원 수정(출력) 관련 메서드 */
	public ArrayList<EmpDTO> empUpdate(int idx) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM employee WHERE eidx = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			ArrayList<EmpDTO> arr = new ArrayList<EmpDTO>();
			while (rs.next()) {
				int eidx = rs.getInt("eidx");
				String ename = rs.getString("ename");
				String eemail = rs.getString("eemail");
				String edept = rs.getString("edept");
				
				EmpDTO dto = new EmpDTO(eidx, ename, eemail, edept);
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
	
	/** 사원 수정 관련(수정) 관련 메서드 */
	public int empUpdate_ok(int idx, String name, String email, String dept) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "UPDATE employee SET ename = ?, eemail = ?, edept = ? WHERE eidx = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, dept);
			ps.setInt(4, idx);
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
}
