package listo.emp;

import java.sql.*;
import java.util.*;
// DAO : 데이터 접근 객체 (Data access object)
public class EmpDAO { // 기능처리 후 결과만 제공 (결과처리x)
	// 자주쓰는 컴포넌트 생성
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public EmpDAO() {
	}
	
	
	/** 사원 등록 관련 메서드 */
	// DTO의 데이터 제공받음
	public int empAdd(EmpDTO dto) {
		// 기본적인 형식: try-catch-finally - try-catch
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "INSERT INTO employee VALUES (employee_idx.nextval, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getEname());
			ps.setString(2, dto.getEemail());
			ps.setString(3, dto.getEdept());
			int count = ps.executeUpdate();
			return count;	// 기능 처리 후 결과만 반환
		} catch (Exception e){
			e.printStackTrace();
			return -1;	// 기능 처리 제대로 안될경우 count가 0보다 작을수는 없으니 임의의 -1 설정
		} finally {
			try {	
				// 결과가 안나와도 일단 서버는 닫음
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2){}
		}
	}
	
	/** 사원 삭제 관련 메서드 */
	public int empDelete(EmpDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "DELETE FROM employee WHERE ename = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getEname());
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
	
	/** 모든 사원 관련 메서드 */
	public EmpDTO[] empList() {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM employee ORDER BY eidx DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();	// 조회결과 rs에 저장
			// EmpDTO 객체를 저장하기위한 Vector 객체 생성
			// 제네릭은 EmpDTO 타입 설정
			// 조회하는 row의 개수가 정해지지 않았으므로 컬렉션 이용
			Vector<EmpDTO> v = new Vector<EmpDTO>();
			// rs에 다음 데이터가 있다면 반복
			while (rs.next()) {
				// 4가지 column값을 변수에 저장
				int eidx = rs.getInt("eidx");
				String ename = rs.getString("ename");
				String eemail = rs.getString("eemail");
				String edept = rs.getString("edept");
				
				// 4개 변수를 매개로 새로운 EmpDTO 객체 생성
				EmpDTO dto = new EmpDTO(eidx, ename, eemail, edept);
				// 새 EmpDTO 객체 Vector에 추가
				v.add(dto);
			}
			// 모든 EmpDTO객체 생성후 Vector의 크기와 같은 EmpDTO타입의 배열 생성
			EmpDTO[] dtos = new EmpDTO[v.size()];
			// Vector값을 생성한 배열에 복사
			v.copyInto(dtos);	// 배열 내용 복사: Vector 고유 메서드 (ArrayList에는 없음)
			return dtos;
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
	
	/** 모든 사원 관련 메서드2: ResultSet 객체 바로 넘김 - close()불가 */
	public ResultSet empList2() {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM employee ORDER BY eidx DESC";
			PreparedStatement ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			return rs;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				// 닫기 불가
			} catch (Exception e2) {}
		}
	}
	
	/** 사원 검색 관련 메서드 */
	public EmpDTO[] empSearch(EmpDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM employee WHERE ename = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getEname());
			rs = ps.executeQuery();	// 조회결과 rs에 저장
			// EmpDTO 객체를 저장하기위한 Vector 객체 생성
			// 제네릭은 EmpDTO 타입 설정
			// 조회하는 row의 개수가 정해지지 않았으므로 컬렉션 이용
			Vector<EmpDTO> v = new Vector<EmpDTO>();
			// rs에 다음 데이터가 있다면 반복
			while (rs.next()) {
				// 4가지 column값을 변수에 저장
				int eidx = rs.getInt("eidx");
				String ename = rs.getString("ename");
				String eemail = rs.getString("eemail");
				String edept = rs.getString("edept");
				
				// 4개 변수를 매개로 새로운 EmpDTO 객체 생성
				EmpDTO dto_temp = new EmpDTO(eidx, ename, eemail, edept);
				// 새 EmpDTO 객체 Vector에 추가
				v.add(dto_temp);
			}
			EmpDTO[] dtos = new EmpDTO[v.size()];
			// Vector값을 생성한 배열에 복사
			v.copyInto(dtos);
			return dtos;
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
	
	/** 사원 수정 관련(출력) 관련 메서드 */
	public EmpDTO empUpdate(EmpDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "SELECT * FROM employee WHERE eidx = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getEidx());
			rs = ps.executeQuery();
			EmpDTO dto_temp = null;
			while (rs.next()) {
				int eidx = rs.getInt("eidx");
				String ename = rs.getString("ename");
				String eemail = rs.getString("eemail");
				String edept = rs.getString("edept");
				
				dto_temp = new EmpDTO(eidx, ename, eemail, edept);
			}
			// 인덱스로 한명만 지정하므로 배열대신 객체 그대로 반환
			return dto_temp;
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
	public int empUpdate_ok(EmpDTO dto) {
		try {
			conn = listo.db.ListoDb.getConn();
			String sql = "UPDATE employee SET ename = ?, eemail = ?, edept = ? WHERE eidx = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(4, dto.getEidx());
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
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
	}
}
