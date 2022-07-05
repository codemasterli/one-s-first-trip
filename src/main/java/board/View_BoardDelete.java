package board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Review_BoardDao;
import service.CommandProcess;

public class View_BoardDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int review_num = Integer.parseInt(request.getParameter("review_num"));

		Review_BoardDao bd = Review_BoardDao.getInstance();
		int result = bd.delete(review_num);

		request.setAttribute("result", result);
		request.setAttribute("review_num", review_num);
		return "view_boardDelete"; 
	}
 
}
