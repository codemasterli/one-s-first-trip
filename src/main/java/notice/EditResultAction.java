package notice;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Notice_BoardDao;

import model.Notice_Board;
import service.CommandProcess;

public class EditResultAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	//	HttpSession session = request.getSession();
		//String id = (String) session.getAttribute("id");
		Notice_Board notice_board = new Notice_Board();
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		
		String pageNum = request.getParameter("pageNum");
		String id = request.getParameter("id");
		String notice_title = request.getParameter("notice_title");
		String notice_content = request.getParameter("notice_content");
       String notice_reg_date = request.getParameter("notice_reg_date");
		notice_board.setNotice_num(notice_num);
		notice_board.setNotice_title(notice_title);
		notice_board.setId(id);
		notice_board.setNotice_content(notice_content);
		notice_board.setNotice_reg_date(notice_reg_date);
		Notice_BoardDao bd = Notice_BoardDao.getInstance();
		int result  = bd.update(notice_board);
		
		request.setAttribute("notice_reg_date", notice_reg_date);
		request.setAttribute("notice_num", notice_num);
		request.setAttribute("id", id);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("result", result);
		
		return "/notice/editResult";
	}

}
