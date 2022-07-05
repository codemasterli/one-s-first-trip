package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;

public class MyPage implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		if (id != null) {
			MemberDao md = MemberDao.getInstance();
			Member member  = md.select(id);
			request.setAttribute("member", member);
		}			
		return "/mypage/mypage";
	}

}
