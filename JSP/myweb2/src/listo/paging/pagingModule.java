package listo.paging;

public class pagingModule {
	public static String makePage(
			String pageName, int totalCount, int listSize, int pageBlockSize, int cPage) {
		// 총 페이지 수
		int totalPage = (totalCount / listSize) + 1;
		if (totalCount % listSize == 0) totalPage--;

		// 그룹화
		int userGroup = cPage / pageBlockSize;
		if (cPage % pageBlockSize == 0)	userGroup--;
		
		// StringBuffer - 많은 문자열 결합에 효율적
		StringBuffer sb = new StringBuffer();
		if (userGroup != 0) {
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cPage=");
			int priGroup = (userGroup - 1) * pageBlockSize + pageBlockSize;
			sb.append(priGroup);
			sb.append("'>&lt;&lt;</a>");
		}
		
		for (int i = (userGroup * pageBlockSize + 1); i <= (userGroup * pageBlockSize + pageBlockSize); i++) {
			sb.append("&nbsp;");
			sb.append("<a href='");
			sb.append(pageName);
			sb.append("?cPage=");
			sb.append(i);
			sb.append("'>" + i + "</a>");
			sb.append("&nbsp;");
			if (i == totalPage) break;
		}
		
		if (userGroup != (totalPage / pageBlockSize) - (totalPage % 5 == 0 ? 1 : 0)) {
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
