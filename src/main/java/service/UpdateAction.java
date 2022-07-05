package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;

public class UpdateAction implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String tel  = request.getParameter("tel");
		String address = request.getParameter("address");
		String mail = request.getParameter("mail");
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setTel(tel);
		member.setAddress(address);
		member.setMail(mail);

		MemberDao md =  MemberDao.getInstance();
		int result = md.update(member);
		request.setAttribute("result", result);
		return "/login/update";
	}

}
