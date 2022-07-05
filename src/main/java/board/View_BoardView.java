package board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ReplyDao;
import dao.Review_BoardDao;
import model.Member;
import model.Reply;
import model.Review_Board;
import service.CommandProcess;

public class View_BoardView implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		String pageNum = request.getParameter("pageNum");
		
		String review_reg_date = request.getParameter("review_reg_date");
		String review_title = request.getParameter("review_title");
		String review_content = request.getParameter("review_content");
		
		Review_BoardDao bd = Review_BoardDao.getInstance();
		
		// 조회수 +1
		bd.readcountUpdate(review_num);
		
		// 데이터 로드
		Review_Board board = bd.select(review_num);
		
		id = board.getId();
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(id);
		
		request.setAttribute("review_num", review_num);
		request.setAttribute("id", id);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("review_title", review_title);
		/*
		 * System.out.println("id : " + id); System.out.println("board : " + board);
		 * System.out.println("pageNum : " + pageNum);
		 * System.out.println("review_num : " + review_num);
		 */
		/* 댓글 */
		ReplyDao rd = ReplyDao.getInstance();
		List<Reply> list = rd.list(review_num); // 댓글 목록
		int reply_cnt = list.size(); // 게시글에 해당하는 댓글 수
		request.setAttribute("list", list);
		request.setAttribute("reply_cnt", reply_cnt);
		return "view_boardView";  
	}

}
