package bay_board;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.Bay_Notice_BoardDao;
import model.Bay_Notice_Board;
import service.CommandProcess;

public class Bay_BoardResult implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("/imgBay");
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈

		int result = 0;
		try { // 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			// board 생성
			Bay_Notice_Board board = new Bay_Notice_Board();			
			int bay_notice_price =Integer.parseInt(mr.getParameter("bay_notice_price"));
			String id = mr.getParameter("id");
			String bay_notice_content = mr.getParameter("bay_notice_content");
			String bay_notice_title = mr.getParameter("bay_notice_title");	
			String thumbnail = mr.getFilesystemName("thumbnail");
						
			Bay_Notice_BoardDao bd = Bay_Notice_BoardDao.getInstnace();
						
			// board 세팅
			board.setId(id);
			board.setBay_notice_price(bay_notice_price);
			board.setBay_notice_content(bay_notice_content);
			board.setBay_notice_title(bay_notice_title);
			board.setThumbnail(thumbnail);
			result = bd.insert(board);
			System.out.println("thumbnaill:" + thumbnail);

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}
		System.out.println("result:" + result);
		request.setAttribute("result", result);		
		return "bay_writeChk";
	}

}
