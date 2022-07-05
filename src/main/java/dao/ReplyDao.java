package dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Reply;

public class ReplyDao {
	private static ReplyDao instance = new ReplyDao();

	private ReplyDao() {
	}

	public static ReplyDao getInstance() {
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

	public int insert(Reply reply) {
		System.out.println("reply"+reply.getContent());
		System.out.println("reply"+reply.getId());
		System.out.println("reply"+reply.getLikes());
		System.out.println("reply"+reply.getRe_no());
		System.out.println("reply"+reply.getRef());
		System.out.println("reply"+reply.getRef_level());
		System.out.println("reply"+reply.getRef_step());
		System.out.println("reply"+reply.getReg_date());
		System.out.println("reply"+reply.getReview_num());
		
		int num = (int) session.selectOne("replyns.selectRe_no");
		if (reply.getRe_no() != 0) { // 답글일 때
			session.update("replyns.updateRef", reply);
			reply.setRef_step(reply.getRef_step() + 1);
			reply.setRef_level(reply.getRef_level() + 1);
		} else { // 답글 아닐 때(그냥 댓글)
			reply.setRef(num);
		}
		return session.insert("replyns.insert", reply);
	}

	public List<Reply> list(int review_num) {
		
		return session.selectList("replyns.list", review_num);
	}

	public int update(Reply reply) {
		return session.update("replyns.update", reply);
	}

	public int delete(int re_no) {
		return session.update("replyns.delete", re_no);
	}

}
