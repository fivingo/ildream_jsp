package yong.member.model;

public interface MemberDAO {
	public int memberJoin(MemberDTO dto);
	public boolean idCheck(String mid);
	public int loginCheck(String userId, String userPwd);
}
