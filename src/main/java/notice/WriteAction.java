package notice;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.MemberDao;
import dao.Notice_BoardDao;
import dao.Review_BoardDao;
import model.Member;
import model.Notice_Board;
import model.Review_Board;
import service.CommandProcess;

public class WriteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
		}
		Notice_Board board_notice = new Notice_Board();		
		String pageNum = request.getParameter("pageNum");
		String notice_title = request.getParameter("notice_title");
		String id = request.getParameter("id");
		String notice_content = request.getParameter("notice_content");
		
		
		Notice_BoardDao bd = Notice_BoardDao.getInstance();
		int boardno1 = bd.notice_num();
		board_notice.setNotice_num(boardno1);
		board_notice.setNotice_title(notice_title);
		board_notice.setId(id);
		board_notice.setNotice_content(notice_content);
		
		int result = bd.insert(board_notice);
		
		request.setAttribute("result", result);
		request.setAttribute("pageNum", pageNum);
		
		
	
		return "/notice/write";
	}

}
