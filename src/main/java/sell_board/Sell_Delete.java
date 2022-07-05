package sell_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Sell_Notice_BoardDao;
import service.CommandProcess;

public class Sell_Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int sell_notice_num = Integer.parseInt(request.getParameter("sell_notice_num"));
		
		Sell_Notice_BoardDao sb = Sell_Notice_BoardDao.getInstnace();
		int result = sb.delete(sell_notice_num);
		
		
		request.setAttribute("result", result);
		request.setAttribute("sell_notice_num", sell_notice_num);
		
		return "sell_boardDelete";
	}

}
