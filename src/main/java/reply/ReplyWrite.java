package reply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReplyDao;
import model.Reply;
import service.CommandProcess;

public class ReplyWrite implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
				HttpSession session = request.getSession();
				String id = (String) session.getAttribute("id");
				
				
				String content = request.getParameter("content");
				int review_num = Integer.parseInt(request.getParameter("review_num"));
				int re_no = Integer.parseInt(request.getParameter("re_no"));
				
				
				Reply reply = new Reply();
				reply.setContent(content);
				reply.setId(id);
				reply.setReview_num(review_num);
				reply.setRe_no(re_no);
				
				if (re_no != 0) { // 답변글일 때
					int ref = Integer.parseInt(request.getParameter("ref"));
					int ref_step = Integer.parseInt(request.getParameter("ref_step"));
					int ref_level = Integer.parseInt(request.getParameter("ref_level"));
					reply.setRef(ref);
					reply.setRef_step(ref_step);
					reply.setRef_level(ref_level);
				}
				
				
				ReplyDao rd = ReplyDao.getInstance();
				int result = rd.insert(reply);
				
				request.setAttribute("result", result);
				request.setAttribute("review_num", review_num);
		return "/reply/replyWrite";
	}

}
