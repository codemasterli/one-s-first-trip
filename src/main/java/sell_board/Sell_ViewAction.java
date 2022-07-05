package sell_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Sell_Notice_BoardDao;
import model.Member;
import model.Sell_Notice_Board;
import service.CommandProcess;

public class Sell_ViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session= request.getSession();
		String id =(String)session.getAttribute("id");
		int sell_notice_num = Integer.parseInt(request.getParameter("sell_notice_num"));
		String pageNum = request.getParameter("pageNum");		
		String sell_notice_reg_date = request.getParameter("sell_notice_reg_date");
		String sell_notice_title = request.getParameter("sell_notice_title");
		String sell_notice_content = request.getParameter("sell_notice_content");		
		Sell_Notice_BoardDao sb = Sell_Notice_BoardDao.getInstnace();
		// 조회수 +1
		sb.read_cntUpdate(sell_notice_num);
		
		
		// 데이터 로드
		Sell_Notice_Board board = sb.select(sell_notice_num);
		
		id= board.getId();	
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(id);
		
		
		request.setAttribute("sell_notice_num", sell_notice_num);
		request.setAttribute("id", id);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("sell_notice_title", sell_notice_title);
		System.out.println("id : " + id);
		System.out.println("board : " + board);
		System.out.println("pageNum : " + pageNum);
		System.out.println("sell_notice_num : " + sell_notice_num);
		
		
		
		return "sell_view";
	}

}
