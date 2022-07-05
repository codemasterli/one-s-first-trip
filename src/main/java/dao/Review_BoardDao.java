package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Review_Board;

public class Review_BoardDao {
	private static Review_BoardDao instance = new Review_BoardDao();

	private Review_BoardDao() {
	}

	public static Review_BoardDao getInstance() {
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
	// 데이터 입력
	public int insert(Review_Board board) {
		System.out.println(board.getId());
		System.out.println(board.getRef_level());
		System.out.println(board.getRef_number());
		System.out.println(board.getRef_step());
		System.out.println(board.getReview_content());
		System.out.println(board.getReview_likes());
		System.out.println(board.getReview_num());
		System.out.println(board.getReview_read_cnt());
		System.out.println(board.getReview_title());
		System.out.println(board.getThumbnail());
		System.out.println(board.getReview_reg_date());
		return session.insert("boardns.insert", board);
	}

	// BoardUpdateResult.java 게시글 수정
	public int update(Review_Board board) {
		System.out.println(board.getId());
		System.out.println(board.getReview_title());
		System.out.println(board.getThumbnail());
		System.out.println(board.getReview_content());
		return session.update("boardns.update", board);
	}

	// BoardDelete.java 게시글 삭제
	public int delete(int review_num) {
		return session.update("boardns.delete", review_num);
	}

	// BoardView.java 조회수 업데이트
	public void readcountUpdate(int review_num) {
		session.update("boardns.readcountUpdate", review_num);
	}

	// BdLikesCnt.java 좋아요수 +1
	public void likesPlus(int review_num) {
		session.update("boardns.likesPlus", review_num);
	}

	// BdLikesCnt.java 좋아요수 -1
	public void likesMinus(int review_num) {
		session.update("boardns.likesMinus", review_num);
	}

	// BoardView.java 게시글 상세 페이지
	public Review_Board select(int review_num) {
		return (Review_Board) session.selectOne("boardns.selectOne", review_num);
	}

	// BoardMain.java 게시글 메인페이지 게시글 수
	public int getTotal(String review_hb_tag) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("review_hb_tag", review_hb_tag);
		return (int) session.selectOne("boardns.getTotal",map);
	}

	// BoardMain.java : order by bno desc 최신순
	public List<Review_Board> list(int startRow, int endRow) {
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		return session.selectList("boardns.list", hm);
	}
	// 조회수 상위 4개 게시물 출력
	public List<Review_Board> mostView(){
		return session.selectList("boardns.mostView");
	}
	
	// 취미 태그 전부 검색
	public List<Review_Board> hb_tag_list() {
		return session.selectList("boardns.hb_tag_list");
	}
	// 취미 태그로 최신순 리스트
	public List<Review_Board> hb_list(int startRow, int endRow, String review_hb_tag) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("startRow", startRow);
		hm.put("endRow", endRow);
		hm.put("review_hb_tag", review_hb_tag);
		return session.selectList("boardns.hb_list", hm);
	
	}
	// 취미 태그별 게시글 수
	/*
	 * public int getTagTotal() { return (int)
	 * session.selectOne("boardns.getTagTotal"); }
	 */
}
