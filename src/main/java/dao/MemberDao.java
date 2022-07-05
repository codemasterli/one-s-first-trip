package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Member;



public class MemberDao {
	// singleton 하나의 객체를 공유
		private static MemberDao instance = new MemberDao(); // static instance
		private MemberDao() {} // 생성자는 private
		public static MemberDao getInstance() { // 메서드를 통하여 instance
			return instance;
		}
		/* 멤버변수 앞에 static붙어 있으면 객체를 생성하지 않고 바로 사용 가능, loading바로 사용가능 */
		private static SqlSession session; // mybatis를 사용할 객체
		// 초기화 블럭 {  }, static {  } 클래스 초기화 블럭
		static {
			try {
				Reader  reader=Resources.getResourceAsReader("configuration.xml");
				SqlSessionFactory ssf=new SqlSessionFactoryBuilder().build(reader);
				session = ssf.openSession(true);
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		public Member select(String id) {
			return (Member) session.selectOne("memberns.select", id);
		}
		public int insert(Member member) {
			System.out.println("member : " + member.getId());
			System.out.println("member : " + member.getPassword());
			System.out.println("member : " + member.getAge());
			System.out.println("member : " + member.getTel());
			System.out.println("member : " + member.getMail());
			System.out.println("member : " + member.getGender());
			System.out.println("member : " + member.getName());
			System.out.println("member : " + member.getAddress());
			return session.insert("memberns.insert", member);
		}
		public int update(Member member) {
			return session.update("memberns.update", member);
		}
		public int delete(String id) {
			return session.delete("memberns.delete", id);
		}
		public int getTotal() {
			return (int) session.selectOne("memberns.getTotal");
		}	
		
		public List<Member> list(int startRow, int endRow) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startRow", startRow);
			map.put("endRow", endRow);
			return session.selectList("memberns.list",map);
		}
		public Member select2(String id) {
			return (Member) session.selectOne("memberns.select2",id);
		}
		public int delete2(String id) {
			System.out.println("id "+id);
			return session.delete("memberns.delete2", id);
		}
		public Member findPassword(String id, String name) {
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("id", id);
			hm.put("name", name);
			return (Member) session.selectOne("memberns.findPassword", hm);
		}
}
