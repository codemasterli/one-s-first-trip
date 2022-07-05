package search;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Notice_BoardDao;
import model.Notice_Board;
import service.CommandProcess;

public class SearchAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String search = request.getParameter("search");
		Notice_BoardDao md = Notice_BoardDao.getInstance();
		
		final int ROW_PER_PAGE = 10; // 한 페이지에 게시글 5개 씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩

		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int endRow = startRow + ROW_PER_PAGE - 1;

		int total = md.getSearchTotal(search);

		int notice_num = total - startRow + 1;

		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수

		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지

		if (endPage > totalPage)
			endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
		
		List<Notice_Board> listSearch = md.listSearch(startRow, endRow, search);
		List<Notice_Board> listSearch2 = md.listSearch2(startRow, endRow, search);
		//List<Notice_Board> listSearch3 = md.listSearch3(startRow, endRow, search);
		
		
		request.setAttribute("search", search);
		request.setAttribute("listSearch", listSearch);
		request.setAttribute("listSearch2", listSearch2);
		request.setAttribute("notice_num", notice_num);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);

		return "/search/search";
	}

}
