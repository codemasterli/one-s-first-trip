package bay_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Bay_Notice_BoardDao;
import service.CommandProcess;

public class Bay_Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int bay_notice_num = Integer.parseInt(request.getParameter("bay_notice_num"));

		Bay_Notice_BoardDao bd = Bay_Notice_BoardDao.getInstnace();
		int result = bd.delete(bay_notice_num);
		
		System.out.println("result:" +result);

		request.setAttribute("result", result);
		request.setAttribute("bay_notice_num", bay_notice_num);
		return "bay_DeleteChk";
	}

}
