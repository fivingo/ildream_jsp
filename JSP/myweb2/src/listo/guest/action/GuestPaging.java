package listo.guest.action;

public class GuestPaging {
	public static String makePage(
			String pageName, int totalCount, int listSize, int pageBlockSize, int cPage) {
		// 총 페이지 수
		int totalPage = (totalCount / listSize) + 1;
		if (totalCount % listSize == 0) totalPage--;
		
		// 그룹화
		int userGroup = cPage / pageBlockSize;
		if (cPage % pageBlockSize == 0) userGroup--;
		
		StringBuffer sb = new StringBuffer();
		if (userGroup != 0) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cPage=");
			int prigroup = (userGroup - 1) * pageBlockSize + pageBlockSize;
			sb.append(prigroup);
			sb.append("'>&triangleleft;이전</a>");
		}
		sb.append("&nbsp;&nbsp;&nbsp;");
		if (userGroup != (totalPage / pageBlockSize) - (totalPage % pageBlockSize == 0 ? 1 : 0)) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cPage=");
			int nextGroup = (userGroup + 1) * pageBlockSize + 1;
			sb.append(nextGroup);
			sb.append("'>&gt;&gt;</a>");
		}
		return sb.toString();
	}
}
