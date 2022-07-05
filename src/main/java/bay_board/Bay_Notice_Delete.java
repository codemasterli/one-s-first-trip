package bay_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Bay_Notice_BoardDao;
import dao.Review_BoardDao;
import dao.Sell_Notice_BoardDao;
import service.CommandProcess;

public class Bay_Notice_Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int bay_notice_num = Integer.parseInt(request.getParameter("bay_notice_num"));

		Bay_Notice_BoardDao sd = Bay_Notice_BoardDao.getInstnace();
		int result = sd.delete(bay_notice_num);

		
		request.setAttribute("result", result);
		request.setAttribute("bay_notice_num", bay_notice_num);
		return "bay_delet"; 
	}
 
}
