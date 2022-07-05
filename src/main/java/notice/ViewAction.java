package notice;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import dao.MemberDao;

import dao.Notice_BoardDao;

import model.Member;
import model.Notice_Board;
import service.CommandProcess;

public class ViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		String pageNum = request.getParameter("pageNum");
		String name = request.getParameter("name");
		String notice_reg_date = request.getParameter("notice_reg_date");
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
		
		Notice_BoardDao bd = Notice_BoardDao.getInstance();
		bd.read_cntUpdate(notice_num); // 조회수 증가
		Notice_Board notice_board = bd.select(notice_num);
		id = notice_board.getId();
  
		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(id);
		
		
	//	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd E a HH:mm:ss");
	//	String notice_reg_date = simpleDateFormat.format(board_notice.getNotice_reg_date());
		
		/*
		 * // noticelikes에 회원이 좋아요한 게시글 있는지 조회 NoticeLikesDao nld =
		 * NoticeLikesDao.getInstance(); String imgSrc = ""; if
		 * (session.getAttribute("id") != null) { id = (String)
		 * session.getAttribute("id"); int noticelikes = nld.select(id, boardno); if
		 * (noticelikes > 0) { // 좋아요 한 게시글이면 imgSrc = "../../images/heart.png";
		 * 
		 * } else if (noticelikes == 0) { // 좋아요 한 게시글이 아니면 imgSrc =
		 * "../../images/empty_heart.png"; } }
		 */
		/*
		 * System.out.println("notice_content"+notice_content);
		 * System.out.println("notice_title"+notice_title);
		 * System.out.println("notice_reg_date"+notice_reg_date);
		 */
		 request.setAttribute("name", name);
        request.setAttribute("notice_num", notice_num);
		request.setAttribute("id", id);
		request.setAttribute("notice_board", notice_board);
		request.setAttribute("pageNum", pageNum);
	//	request.setAttribute("notice_reg_date",notice_reg_date);
		
		
		return "/notice/View";
	}

}
