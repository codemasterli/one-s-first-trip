package bay_board;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.Bay_Notice_BoardDao;
import dao.Sell_Notice_BoardDao;
import model.Bay_Notice_Board;
import model.Sell_Notice_Board;
import service.CommandProcess;

public class Bay_EditResult implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("/imgBay");
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈		
		
		int bay_notice_num =0;
		int result = 0;
		try { 
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());

			Bay_Notice_Board board = new Bay_Notice_Board();
			bay_notice_num=Integer.parseInt((mr.getParameter("bay_notice_num")));
			int bay_notice_price = Integer.parseInt(mr.getParameter("bay_notice_price"));
			String id = mr.getParameter("id");
			String bay_notice_content = mr.getParameter("bay_notice_content");
			String bay_notice_title = mr.getParameter("bay_notice_title");
			String thumbnail = mr.getFilesystemName("thumbnail");
			System.out.println("id:" + id);
			System.out.println("bay_notice_content:" + bay_notice_content);
			System.out.println("bay_notice_title:" + bay_notice_title);
			System.out.println("bay_notice_price:" + bay_notice_price);
			System.out.println("thumbnail:" + thumbnail);						
			Bay_Notice_BoardDao bd = Bay_Notice_BoardDao.getInstnace();
						
			// board 세팅
			board.setId(id);
			board.setThumbnail(thumbnail);
			board.setBay_notice_num(bay_notice_num);
			board.setBay_notice_price(bay_notice_price);
			board.setBay_notice_content(bay_notice_content);
			board.setBay_notice_title(bay_notice_title);
			result = bd.update(board);

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
			System.out.println("result:" + result);
		}
		
		request.setAttribute("bay_notice_num", bay_notice_num);
		request.setAttribute("result", result);		
		return "bay_editResult";
	}

}
