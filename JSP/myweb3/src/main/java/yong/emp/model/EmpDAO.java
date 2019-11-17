package yong.emp.model;

import java.util.*;

public interface EmpDAO {
	public int empAdd(EmpDTO dto);
	public int empDel(String ename);
	public List empList();
	public List empSearch(String ename);
	public List empUpdate(int eidx);
	public int empUpdate_ok(EmpDTO dto);
}
