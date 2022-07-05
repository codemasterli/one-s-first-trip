package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.Review_BoardDao;
import model.Member;
import model.Review_Board;

public class MainForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if (id != null) {
			MemberDao md = MemberDao.getInstance();
			Member member  = md.select(id);
			request.setAttribute("member", member);
		}
		Review_BoardDao bd = Review_BoardDao.getInstance();
		
		List<Review_Board> list = bd.mostView();
		request.setAttribute("list", list);
		System.out.println(list.size());
		return "/main/main";
	}

}
