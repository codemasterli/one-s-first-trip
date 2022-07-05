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

public class Sell_BoardResult implements CommandProcess {
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();

		// 파일 업로드 경로
		String real = request.getSession().getServletContext().getRealPath("/imgSell");
		int maxSize = 1024 * 1024 * 10; // 최대 사이즈

		int result = 0;
		try { // 같은 파일 이름에 자동으로 숫자 추가
			MultipartRequest mr = new MultipartRequest(request, real, maxSize, "utf-8", new DefaultFileRenamePolicy());
			// board 생성
			Sell_Notice_Board board = new Sell_Notice_Board();
			
			int sell_notice_price =Integer.parseInt(mr.getParameter("sell_notice_price"));
			String id = mr.getParameter("id");
			String sell_notice_content = mr.getParameter("sell_notice_content");
			String sell_notice_title = mr.getParameter("sell_notice_title");	
			String thumbnaill = mr.getFilesystemName("thumbnail");
						
			Sell_Notice_BoardDao bd = Sell_Notice_BoardDao.getInstnace();
						
			// board 세팅
			board.setId(id);
			board.setSell_notice_price(sell_notice_price);
			board.setSell_notice_content(sell_notice_content);
			board.setSell_notice_title(sell_notice_title);
			board.setThumbnail(thumbnaill);
			result = bd.insert(board);

		} catch (IOException e) {
			System.out.println("에러 : " + e.getMessage());
		}
		
		System.out.println("result:" + result);
		request.setAttribute("result", result);		
		return "sell_writeChk";
	}

}
