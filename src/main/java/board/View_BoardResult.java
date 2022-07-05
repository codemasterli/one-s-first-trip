package board;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Review_BoardDao;
import model.Review_Board;
import service.CommandProcess;

public class View_BoardResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("/upload");
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈

		int result = 0;
		try { // 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			// board 생성
			Review_Board board = new Review_Board();
			String thumbnail = mr.getFilesystemName("thumbnail"); // thumbnail input 내용 불러오기
			
			String id = mr.getParameter("id");
			String content = mr.getParameter("content");
			String title = mr.getParameter("title");
			String hb_tag = mr.getParameter("hb_tag");
			
			/*
			 * 아이디
			ref level	0
			ref number	0
			ref step	0
			content
			likes		0
			num 
			read cnt	0
			title
			취미 태그
			썸네일
			작성날자	sysdate 
			*/
			
			Review_BoardDao bd = Review_BoardDao.getInstance();
			
			System.out.println("취미 태그: " + hb_tag);
			// board 세팅
			board.setThumbnail(thumbnail);
			board.setId(id);
			board.setReview_content(content);
			board.setReview_title(title);
			board.setReview_hb_tag(hb_tag);

			result = bd.insert(board);

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}

		request.setAttribute("result", result);

		return "view_boardWrite";
	}

}
