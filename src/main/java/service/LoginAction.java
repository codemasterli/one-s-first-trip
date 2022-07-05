package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;

public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberDao md = MemberDao.getInstance();
		Member member = md.select(id);
		if (member == null) 
			result = -1; // 없는 아이디
		else {
			if (member.getPassword().equals(password)) {
//	jsp에서 session 내장객체이지만 java에서는 객체를 생성해서 사용			
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				result = 1;  // 로그인 성공
			}
		}
		request.setAttribute("result", result);
		
		return "/login/login";
	}

}
