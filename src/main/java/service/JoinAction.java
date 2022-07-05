package service;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;


public class JoinAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String gender = request.getParameter("gender");
		String mail = request.getParameter("mail");
		String mail2 = request.getParameter("mail2");
		mail += "@"+mail2;
		
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		member.setName(name);
		member.setAge(age);
		member.setAddress(address);
		member.setTel(tel);
		member.setGender(gender);
		member.setMail(mail);
		
		MemberDao md = MemberDao.getInstance();
		Member member1 = md.select(id);
		if (member1 == null) result = md.insert(member);
		else result = -1;
		
		request.setAttribute("result", result);
		return "/login/join";
	}
}