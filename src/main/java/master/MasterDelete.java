package master;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service.CommandProcess;

public class MasterDelete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
		
		MemberDao md = MemberDao.getInstance();
		String id = request.getParameter("id");
		int result = md.delete2(id);
		/*
		 * try { // response.sendRedirect("masterUpdate.do?id="+id); } catch
		 * (IOException e) { // TODO Auto-generated catch block e.printStackTrace(); }
		 */
		request.setAttribute("id", id);
		request.setAttribute("result", result);
		return "/manager/masterDelete";
	}

}
