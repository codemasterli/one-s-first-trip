package bay_board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Bay_Notice_BoardDao;
import dao.MemberDao;
import model.Bay_Notice_Board;
import model.Member;
import service.CommandProcess;

public class Bay_ViewAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session= request.getSession();
		String id =(String)session.getAttribute("id");
		int bay_notice_num = Integer.parseInt(request.getParameter("bay_notice_num"));
		String pageNum = request.getParameter("pageNum");		
		String bya_notice_reg_date = request.getParameter("bya_notice_reg_date");
		String bay_notice_title = request.getParameter("bay_notice_title");
		String bay_notice_content = request.getParameter("bay_notice_content");		
		Bay_Notice_BoardDao sb = Bay_Notice_BoardDao.getInstnace();
		// 조회수 +1
		sb.read_cntUpdate(bay_notice_num);
		
		
		// 데이터 로드
		Bay_Notice_Board board = sb.select(bay_notice_num);
		
		id= board.getId();	
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.select2(id);
		
		
		request.setAttribute("bay_notice_num", bay_notice_num);
		request.setAttribute("id", id);
		request.setAttribute("board", board);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("bay_notice_title", bay_notice_title);
		
		System.out.println("id : " + id);
		System.out.println("board : " + board);
		System.out.println("pageNum : " + pageNum);
		System.out.println("bay_notice_num : " + bay_notice_num);
			
		
		return "bay_view";
	}

}
