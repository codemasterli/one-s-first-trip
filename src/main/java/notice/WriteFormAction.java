package notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Notice_BoardDao;
import model.Member;
import model.Notice_Board;
import service.CommandProcess;

public class WriteFormAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
       String id = request.getParameter("id");
		
			
			Notice_BoardDao nb = Notice_BoardDao.getInstance();
			/* List<Notice_Board> list = nb.list(id); */
			

			/* request.setAttribute("list", list); */
			
		
		return "/notice/WriteForm";
	}

}
