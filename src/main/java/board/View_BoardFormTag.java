package board;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Review_BoardDao;
import model.Review_Board;
import service.CommandProcess;

public class View_BoardFormTag implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Review_BoardDao bd = Review_BoardDao.getInstance();

		String review_hb_tag = request.getParameter("review_hb_tag");
		System.out.println("review_hb_tag : " + review_hb_tag);
		final int ROW_PER_PAGE = 10; // 한 페이지에 게시글 15개 씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지 씩

		String pageNum = request.getParameter("pageNum"); // 페이지 번호
		if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지
		
		int total = bd.getTotal(review_hb_tag); // 총 게시글 수
		System.out.println("전체 태그 게시물 수 : " + total);
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
		int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)

		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지

		if (endPage > totalPage)
			endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우

		List<Review_Board> hb_tag_list = bd.hb_tag_list(); // 취미 태그 리스트
		List<Review_Board> hb_list = bd.hb_list(startRow, endRow, review_hb_tag); // 선택한 취미로 최신순 리스트
		
		Set<String> hb_tag = new HashSet<String>();
		for(Review_Board rb:hb_tag_list) {
			hb_tag.add(rb.getReview_hb_tag());
		}
		request.setAttribute("hb_tag_list", hb_tag);
		request.setAttribute("hb_list", hb_list);
		request.setAttribute("review_hb_tag", review_hb_tag);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		
		
		
		return "/board/view_boardFormTag";
	}

}
