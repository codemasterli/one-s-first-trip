package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Bay_Notice_Board;


public class Bay_Notice_BoardDao {
	private static Bay_Notice_BoardDao instance = new Bay_Notice_BoardDao();

	private Bay_Notice_BoardDao() {
	}

	public static Bay_Notice_BoardDao getInstnace() {
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

	@SuppressWarnings("unchecked")
	public List<Bay_Notice_Board> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<String, Integer>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("bay_noticens.list", hm);
	}

	public int getTotal() {
		return (int) session.selectOne("bay_noticens.getTotal");
	}

	/* 데이터 입력 */
	public int insert(Bay_Notice_Board board) {			
//		 System.out.println("board c="+board.getBay_notice_content());
//		 System.out.println("board:"+board.getBay_notice_content());
//		 System.out.println("board:"+board.getBay_notice_reg_date());
//		 System.out.println("board:"+board.getBay_notice_title());
//		 System.out.println("board:"+board.getId());
//		 System.out.println("board:"+board.getBay_notice_num());
//		 System.out.println("board:"+board.getBay_notice_price());
//		 System.out.println("board:"+board.getBay_notice_ref_number());
//		 System.out.println("board:"+board.getBay_notice_likes());
//		 System.out.println("board:"+board.getBay_notice_ref_level());
//		 System.out.println("board:"+board.getBay_notice_ref_step());
//		 System.out.println("board:"+board.getBay_notice_read_cnt());
		 System.out.println("board3:"+board.getThumbnail());		 
		 
		return session.insert("bay_noticens.insert", board);
	}

	public int bay_notice_num() {
		return (int)session.selectOne("bay_noticens.bay_notice_num");
	}

	public void read_cntUpdate(int bay_notice_num) {
		session.update("bay_noticens.read_cntUpdate", bay_notice_num);

	}

	public Bay_Notice_Board select(int bay_notice_num) {
		return (Bay_Notice_Board) session.selectOne("bay_noticens.selectOne", bay_notice_num);
	}

	public int update(Bay_Notice_Board board) {
		/*
		 * System.out.println("board c="+board.getSell_notice_content());
		 * System.out.println("board:"+board.getSell_notice_read_cnt());
		 * System.out.println("board:"+board.getSell_notice_reg_date());
		 * System.out.println("board:"+board.getSell_notice_title());
		 * System.out.println("board:"+board.getId());
		 * System.out.println("board:"+board.getSell_notice_num());
		 * System.out.println("board:"+board.getSell_notice_price());
		 * System.out.println("board:"+board.getSell_notice_ref_number());
		 * System.out.println("board:"+board.getSell_notice_likes());
		 * System.out.println("board:"+board.getSell_notice_ref_level());
		 * System.out.println("board:"+board.getSell_notice_ref_step());
		 * System.out.println("board:"+board.getSell_notice_read_cnt());
		 * System.out.println("board:"+board.getThumbnail());
		 */
		
		  return session.update("bay_noticens.update", board);
	}

	public int delete(int bay_notice_num) {
		return session.delete("bay_noticens.delete", bay_notice_num);
	}

}
