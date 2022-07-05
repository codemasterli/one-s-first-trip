package sell_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Sell_Notice_BoardDao;
import model.Sell_Notice_Board;
import service.CommandProcess;

public class Sell_EditAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();			
		String id = (String) session.getAttribute("id");		
		int sell_notice_num =Integer.parseInt(request.getParameter("sell_notice_num"));	
	//	int sell_notice_price  =Integer.parseInt(request.getParameter("sell_notice_price"));
		String pageNum = request.getParameter("pageNum");
		String sell_notice_title = request.getParameter("sell_notice_title");
		String sell_notice_content = request.getParameter("sell_notice_content");
		String sell_notice_reg_date = request.getParameter("sell_notice_reg_date");
		String thumbnail = (String)session.getAttribute("thumbnail");	
		Sell_Notice_BoardDao sd = Sell_Notice_BoardDao.getInstnace();
		Sell_Notice_Board board = sd.select(sell_notice_num);

		
		request.setAttribute("id", id);
		request.setAttribute("sell_notice_num", sell_notice_num);
		request.setAttribute("sell_notice_reg_date", sell_notice_reg_date);
		request.setAttribute("sell_notice_content", sell_notice_content);
	//	request.setAttribute("sell_notice_price", sell_notice_price); 
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("thumbnail", thumbnail);
				
	
		return "/sell_board/sell_edit";
	}

}
