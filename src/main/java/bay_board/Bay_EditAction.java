package bay_board;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Bay_Notice_BoardDao;
import model.Bay_Notice_Board;
import service.CommandProcess;

public class Bay_EditAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();			
		String id = (String) session.getAttribute("id");		
		int bay_notice_num =Integer.parseInt(request.getParameter("bay_notice_num"));
		/*
		 * int sell_notice_price
		 * =Integer.parseInt(request.getParameter("sell_notice_price"));
		 */
		String pageNum = request.getParameter("pageNum");
		String bay_notice_title = request.getParameter("bay_notice_title");
		String bay_notice_content = request.getParameter("bay_notice_content");
		String bay_notice_reg_date = request.getParameter("bay_notice_reg_date");
		String thumbnail = (String)session.getAttribute("thumbnail");	
		Bay_Notice_BoardDao sd = Bay_Notice_BoardDao.getInstnace();
		Bay_Notice_Board board = sd.select(bay_notice_num);

		
		request.setAttribute("id", id);
		request.setAttribute("bay_notice_num", bay_notice_num);
		request.setAttribute("bay_notice_title", bay_notice_title);
		request.setAttribute("bay_notice_reg_date", bay_notice_reg_date);
		request.setAttribute("bay_notice_content", bay_notice_content);
		/* request.setAttribute("sell_notice_price", sell_notice_price); */
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("thumbnail", thumbnail);
				
	
		return "bay_edit";
	}

}
