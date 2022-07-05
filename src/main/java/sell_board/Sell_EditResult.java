package sell_board;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import dao.Sell_Notice_BoardDao;
import model.Sell_Notice_Board;
import service.CommandProcess;

public class Sell_EditResult implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("/imgSell");
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈
		int sell_notice_num = 0;

		int result = 0;
		try { 
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			Sell_Notice_Board board = new Sell_Notice_Board();			
			String id = mr.getParameter("id");
			sell_notice_num = Integer.parseInt(mr.getParameter("sell_notice_num"));
			int sell_notice_price =Integer.parseInt(mr.getParameter("sell_notice_price"));
			String sell_notice_content = mr.getParameter("sell_notice_content");
			String sell_notice_title = mr.getParameter("sell_notice_title");
			String thumbnail = mr.getFilesystemName("thumbnail");
			System.out.println("id:" + id);
			System.out.println("sell_notice_num:" + sell_notice_num);
			System.out.println("sell_notice_price:" + sell_notice_price);
			System.out.println("sell_notice_content:" + sell_notice_content);
			System.out.println("sell_notice_title:" + sell_notice_title);
			System.out.println("thumbnail:" + thumbnail);						
			Sell_Notice_BoardDao sb = Sell_Notice_BoardDao.getInstnace();
			// board 세팅
			board.setThumbnail(thumbnail);
			board.setSell_notice_num(sell_notice_num);
			board.setSell_notice_price(sell_notice_price);
			board.setId(id);
			board.setSell_notice_content(sell_notice_content);
			board.setSell_notice_title(sell_notice_title);
			result = sb.update(board);

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
			System.out.println("result=" + result);
		}
		
		
		
		request.setAttribute("sell_notice_num", sell_notice_num);
		request.setAttribute("result", result);		
		return "sell_editResult";
	}

}
