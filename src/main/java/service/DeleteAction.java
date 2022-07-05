package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;

public class DeleteAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberDao md = MemberDao.getInstance();
		int result = md.delete(id);
	
		if (result > 0) {
			// 탈퇴한 브라우저 닫지 않더라도 현사이트를 사용 못하게 세션 삭제
			session.invalidate(); 
		}
		
		request.setAttribute("result", result);
		return "/manager/masterDelete";
	}

}
