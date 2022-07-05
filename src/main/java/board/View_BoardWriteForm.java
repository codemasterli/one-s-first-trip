package board;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Review_BoardDao;
import model.Review_Board;
import service.CommandProcess;

public class View_BoardWriteForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		Review_BoardDao bd = Review_BoardDao.getInstance();
		HttpSession session = request.getSession();
		
		String review_hb_tag = "";
		
		List<Review_Board> hb_tag_list = bd.hb_tag_list(); // 취미 태그 리스트
		
		Set<String> hb_tag = new HashSet<String>();
		for (Review_Board rb : hb_tag_list) {
			hb_tag.add(rb.getReview_hb_tag());
		}
		request.setAttribute("hb_tag_list", hb_tag);

		return "/board/view_boardWriteForm";
	}

}
