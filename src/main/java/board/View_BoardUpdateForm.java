package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Review_BoardDao;
import model.Review_Board;
import service.CommandProcess;

public class View_BoardUpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		String thumbnail = (String) session.getAttribute("thumbnail");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String pageNum = request.getParameter("pageNum");
		String content = request.getParameter("review_content");
		String title = request.getParameter("review_title");
		String review_hb_tag = request.getParameter("review_hb_tag");
		Review_BoardDao bd = Review_BoardDao.getInstance();
		Review_Board review_board = bd.select(review_num);

		request.setAttribute("id", id);
		request.setAttribute("review_title", title);
		request.setAttribute("review_board", review_board);
		request.setAttribute("pageNum", pageNum);
		System.out.println("pageNum : " + pageNum);
		request.setAttribute("thumbnail", thumbnail);
		request.setAttribute("content", content);
		request.setAttribute("review_hb_tag", review_hb_tag);
		return "/board/view_boardUpdateForm";
	}

}
