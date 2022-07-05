package notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Notice_BoardDao;
import model.Member;
import model.Notice_Board;
import service.CommandProcess;

public class NoticeAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		final int ROW_PER_PAGE = 10;
		final int PAGE_PER_BLOCK = 5;
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		// 시작번호	(페이지번호 - 1) * 페이지당 갯수+ 1
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		// 끝번호 	시작번호 + 페이지당개수 - 1			
		int endRow = startRow + ROW_PER_PAGE - 1;
		Notice_BoardDao bd = Notice_BoardDao.getInstance();
		int total = bd.getTotal();
		int notice_num = total - startRow + 1; // 번호 보기 좋게
		int totalPage = (int)Math.ceil((double)total / ROW_PER_PAGE);
	// 시작페이지 구하는 식 : 현재페이지 - (현재페이지 - 1)%10(블럭당 페이지 숫자)
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
	// endPage구하는 식 : 시작페이지 + 블록당페이지 수 -1
		int endPage = startPage + PAGE_PER_BLOCK - 1;
//		만약 endPage가 총페이지보다 크면 endPage는 총페이지로 변경
		if (endPage > totalPage) endPage = totalPage;
		List<Notice_Board> list = bd.list(startRow, endRow);
		System.out.println("list:"+list.size());
		// jsp에서 사용할 객체를 전달 
		request.setAttribute("list", list);
		request.setAttribute("notice_num", notice_num);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);	
		
		
		return "/notice/Notice";
	}

}
