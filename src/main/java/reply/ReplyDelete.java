package reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReplyDao;
import service.CommandProcess;

public class ReplyDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int review_num = Integer.parseInt(request.getParameter("review_num"));
		int re_no = Integer.parseInt(request.getParameter("re_no"));

		ReplyDao rd = ReplyDao.getInstance();
		int result = rd.delete(re_no);
		
		request.setAttribute("result", result);
		request.setAttribute("review_num", review_num);
		
		return "/reply/replyDelete";
	}

}
