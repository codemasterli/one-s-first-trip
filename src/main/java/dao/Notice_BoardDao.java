package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


import model.Notice_Board;

public class Notice_BoardDao {
	private static Notice_BoardDao instance = new Notice_BoardDao();

	private Notice_BoardDao() {
	}

	public static Notice_BoardDao getInstance() {
		return instance;
	}

	private static SqlSession session;

	static {
		try {
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			session = ssf.openSession(true);
			reader.close();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	public List<Notice_Board> list(int startRow, int endRow) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    return session.selectList("noticens.list", hm);
	}

	public int getTotal() {
		return (int) session.selectOne("noticens.getTotal");
	}

	public int insert(Notice_Board board) {
		/*
		 * System.out.println("board:"+board.getNotice_content());
		 * System.out.println("board:"+board.getNotice_read_cnt());
		 * System.out.println("board:"+board.getNotice_reg_date());
		 * System.out.println("board:"+board.getNotice_title());
		 * System.out.println("board:"+board.getId());
		 * System.out.println("board:"+board.getNotice_num());
		 */
		return session.insert("noticens.insert", board);
	}

	public int notice_num() {
		return (int) session.selectOne("noticens.notice_num");
	}

	public void read_cntUpdate(int notice_num) {
		session.update("noticens.read_cntUpdate", notice_num);
		
	}

	public Notice_Board select(int notice_num) {
		return (Notice_Board) session.selectOne("noticens.selectOne", notice_num);
		
	}

	public int update(Notice_Board notice_board) {
		System.out.println("notice_board"+notice_board.getId());
		System.out.println("notice_board"+notice_board.getNotice_content());
		System.out.println("notice_board"+notice_board.getNotice_num());
		System.out.println("notice_board"+notice_board.getNotice_read_cnt());
		System.out.println("notice_board"+notice_board.getNotice_reg_date());
		System.out.println("notice_board"+notice_board.getNotice_title());
		
		return session.update("noticens.update", notice_board);
	}


	public int delete(int notice_num) {
		return session.delete("noticens.delete", notice_num);
	}

	public int getSearchTotal(String search) {
		return (int) session.selectOne("noticens.getSearchTotal",search);
	}
// 검색
	//	공지사항 검색
	public List<Notice_Board> listSearch(int startRow, int endRow, String search) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    hm.put("search", search);
	    return session.selectList("noticens.listSearch", hm);
	}
	// 리뷰게시판 검색
	public List<Notice_Board> listSearch2(int startRow, int endRow, String search) {
		HashMap<String, Object> hm = new HashMap<>();
	    hm.put("startRow", startRow);
	    hm.put("endRow", endRow);
	    hm.put("search", search);
	    return session.selectList("noticens.listSearch2", hm);
	}
	
	
	
	
	
	
	
	
}
