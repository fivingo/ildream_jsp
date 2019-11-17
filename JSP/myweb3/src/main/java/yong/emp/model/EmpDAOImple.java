package yong.emp.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class EmpDAOImple implements EmpDAO {
	private SqlSessionTemplate sqlMap;
	
	public EmpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	/** 사원 등록 (MyBatis) */
	public int empAdd(EmpDTO dto) {
		int count = sqlMap.insert("empInsert", dto);
		return count;
	}

	/** 사원 삭제 (MyBatis) */
	public int empDel(String ename) {
		int count = sqlMap.delete("empDelete", ename);
		return count;
	}

	/** 모든 사원 목록 (MyBatis) */
	public List empList() {
		List lists = sqlMap.selectList("empAllList");
		return lists;
	}

	/** 사원 검색 (MyBatis) */
	public List empSearch(String ename) {
		List lists = sqlMap.selectList("empSearch", ename);
		return lists;
	}

	/** 사원 수정-검색 (MyBatis) */
	public List empUpdate(int eidx) {
		List lists = sqlMap.selectList("empUpdate", eidx);
		return lists;
	}

	/** 사원 등록-수정 (MyBatis) */
	public int empUpdate_ok(EmpDTO dto) {
		int count = sqlMap.update("empUpdate_ok", dto);
		return count;
	}
}
