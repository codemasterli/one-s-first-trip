package board;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Review_BoardDao;
import model.Review_Board;
import service.CommandProcess;

public class View_BoardForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Review_BoardDao bd = Review_BoardDao.getInstance();

		final int ROW_PER_PAGE = 10; // 한 페이지에 게시글 15개 씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩

		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		String review_hb_tag = "";
		int total = bd.getTotal(review_hb_tag); // 총 게시글 수
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)

		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지

		if (endPage > totalPage)
			endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우

		List<Review_Board> list = bd.list(startRow, endRow); // order by bno (최신순)
		List<Review_Board> hb_tag_list = bd.hb_tag_list(); // 취미 태그 리스트

		Set<String> hb_tag = new HashSet<String>();
		for (Review_Board rb : hb_tag_list) {
			hb_tag.add(rb.getReview_hb_tag());
		}
		request.setAttribute("list", list);
		request.setAttribute("hb_tag_list", hb_tag);

		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);

		System.out.println("size = " + list.size());
		System.out.println("pageNum : " + pageNum);
		System.out.println("현재 페이지 : " + currentPage);
		System.out.println("total : " + total);
		System.out.println("totalPage : " + totalPage);
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);

		System.out.println("hb_tag_list : " + hb_tag_list.size());

		return "/board/view_boardForm";
	}

}
