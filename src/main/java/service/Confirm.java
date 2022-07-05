package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class Confirm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		String msg  = "";
		if (member != null) msg="이미 사용중이니 다른 아이디를 쓰세요";
		else msg="사용 가능한 아이디입니다";
		
		request.setAttribute("msg", msg);
		return "/login/confirm";
	}

}
