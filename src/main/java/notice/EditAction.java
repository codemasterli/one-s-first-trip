package notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Notice_BoardDao;
import model.Member;
import model.Notice_Board;
import service.CommandProcess;

public class EditAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		String pageNum = request.getParameter("pageNum");
		Notice_BoardDao bd = Notice_BoardDao.getInstance();
		Notice_Board notice_board = bd.select(notice_num);
		
		request.setAttribute("id", id);		
		request.setAttribute("notice_board", notice_board);
		request.setAttribute("pageNum", pageNum);
	
		
		return "/notice/Edit";
	}

}
