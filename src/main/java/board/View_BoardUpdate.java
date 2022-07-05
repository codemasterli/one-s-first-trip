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

public class View_BoardUpdate implements CommandProcess {
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
			String content = mr.getParameter("review_content");
			String title = mr.getParameter("review_title");
			String review_hb_tag = mr.getParameter("review_hb_tag");
			String pageNum = request.getParameter("pageNum");
			
			int review_num = Integer.parseInt(request.getParameter("review_num"));
			
			Review_BoardDao bd = Review_BoardDao.getInstance();

			// board 세팅
			board.setThumbnail(thumbnail);
			board.setId(id);
			board.setReview_content(content);
			board.setReview_title(title);
			board.setReview_num(review_num);
			board.setReview_hb_tag(review_hb_tag);
			
			request.setAttribute("pageNum", pageNum);
			
			result = bd.update(board);
			
			System.out.println("thumbnail : " + thumbnail);
			System.out.println("id : " + id);
			System.out.println("content : " + content);
			System.out.println("title : " + title);
			System.out.println("result" + result);
			System.out.println("pageNum : " + pageNum);
		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}
		
		request.setAttribute("result",result);
		
		return "view_boardUpdate";
	}
	
}
