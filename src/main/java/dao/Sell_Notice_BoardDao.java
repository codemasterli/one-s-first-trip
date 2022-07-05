package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import model.Sell_Notice_Board;

public class Sell_Notice_BoardDao {
	private static Sell_Notice_BoardDao instance = new Sell_Notice_BoardDao();

	private Sell_Notice_BoardDao() {
	}

	public static Sell_Notice_BoardDao getInstnace() {
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
	public List<Sell_Notice_Board> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("sell_noticens.list", hm);
	}

	public int getTotal() {
		return (int) session.selectOne("sell_noticens.getTotal");
	}

	/* 데이터 입력 */
	public int insert(Sell_Notice_Board board) {	
//		  System.out.println("board c="+board.getSell_notice_content());
//		  System.out.println("board:"+board.getSell_notice_read_cnt());
//		  System.out.println("board:"+board.getSell_notice_reg_date());
//		  System.out.println("board:"+board.getSell_notice_title());
//		  System.out.println("board:"+board.getId());
//		  System.out.println("board:"+board.getSell_notice_num());
//		  System.out.println("board:"+board.getSell_notice_price());
//		  System.out.println("board:"+board.getSell_notice_ref_number());
//		  System.out.println("board:"+board.getSell_notice_likes());
//		  System.out.println("board:"+board.getSell_notice_ref_level());
//		  System.out.println("board:"+board.getSell_notice_ref_step());
//		  System.out.println("board:"+board.getSell_notice_read_cnt());	
//		  System.out.println("board:"+board.getThumbnail());
		 
		return session.insert("sell_noticens.insert", board);
	}

	public int sell_notice_num() {
		return (int) session.selectOne("sell_noticens.sell_notice_num");
	}

	public void read_cntUpdate(int sell_notice_num) {
		session.update("sell_noticens.read_cntUpdate", sell_notice_num);

	}

	public Sell_Notice_Board select(int sell_notice_num) {
		return (Sell_Notice_Board) session.selectOne("sell_noticens.selectOne", sell_notice_num);

	}

	public int update(Sell_Notice_Board board) {
//		  System.out.println("board c="+board.getSell_notice_content());
//		  System.out.println("board:"+board.getSell_notice_read_cnt());
//		  System.out.println("board:"+board.getSell_notice_reg_date());
//		  System.out.println("board:"+board.getSell_notice_title());
//		  System.out.println("board:"+board.getId());
//		  System.out.println("board:"+board.getSell_notice_num());
//		  System.out.println("board:"+board.getSell_notice_price());
//		  System.out.println("board:"+board.getSell_notice_ref_number());
//		  System.out.println("board:"+board.getSell_notice_likes());
//		  System.out.println("board:"+board.getSell_notice_ref_level());
//		  System.out.println("board:"+board.getSell_notice_ref_step());
//		  System.out.println("board:"+board.getSell_notice_read_cnt());	
//		  System.out.println("board:"+board.getThumbnail());
//		
		  return session.update("sell_noticens.update", board);
	}

	public int delete(int sell_notice_num) {
		return session.delete("sell_noticens.delete", sell_notice_num);
	}

}
