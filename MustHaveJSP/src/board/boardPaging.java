package board;

public class boardPaging {
	public static String pageStr(int totalCount, int pageNum, int pageSize, int pageBlock, String requestUrl) {
		String pageStr = "";
		int totalPage = (int) Math.ceil((double)totalCount / pageSize);
		
		if(pageNum != 1) {
			pageStr += "<a href=" + requestUrl + "?pageNum=1> [첫 페이지] </a>";
			pageStr += "<a href=" + requestUrl + "?pageNum=" + (pageNum - 1) + "> [이전 페이지] </a>";
		}
		
		// 페이징 넘버
		int temp = (int) pageNum / 5;
		for(int i = temp * 5 + 1; i < i + 5; i++) {
			pageStr += "&nbsp" + "<a href=" + requestUrl + "?pageNum=" + i + ">" + i + "</a>";
			if(i == totalPage) 
				break;
		}
		
		if(pageNum != totalPage) {
			pageStr += "<a href=" + requestUrl + "?pageNum=" + (pageNum + 1) + "> [다음 페이지] </a>";
			pageStr += "<a href=" + requestUrl + "?pageNum=" + totalPage + "> [마지막 페이지] </a>";
		}
		
		return pageStr;
	}
}
