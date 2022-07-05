package notice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Notice_BoardDao;
import service.CommandProcess;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));

		Notice_BoardDao bd = Notice_BoardDao.getInstance();
		int result = bd.delete(notice_num);
		
		request.setAttribute("result", result);
		request.setAttribute("notice_num", notice_num);
		return "/notice/delete";
	}

}
