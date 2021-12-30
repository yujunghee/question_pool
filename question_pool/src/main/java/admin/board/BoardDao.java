package admin.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao {
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	
	// ----------------------- 공지사항 영역 시작 -----------------------
	
	public int noticeCount(NoticeVo vo) {
		return sqlSessionTemplate.selectOne("board.count", vo);
	}
	
	public List<NoticeVo> noticeList(NoticeVo vo) {
		return sqlSessionTemplate.selectList("board.selectList", vo);
	}
	
	public int noticeInsert(NoticeVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("board.insert", vo);
		} catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public NoticeVo noticeSelectOne(int notice_no) {
		return sqlSessionTemplate.selectOne("board.selectOne", notice_no);
	}
	
	public int noticeUpdateReadcount(int notice_no) {
		return sqlSessionTemplate.update("board.updateReadcount", notice_no);
	}
	
	public int noticeUpdate(NoticeVo vo) {
		return sqlSessionTemplate.update("board.update", vo);
	}	
	
	public int noticeDelete(String notice_no) {		
		return sqlSessionTemplate.delete("board.delete", notice_no);
	}
	
	
	// ----------------------- 공지사항 영역 끝 -----------------------
	
	
	// ----------------------- 공지사항 영역 시작 -----------------------
	
		public int tdCount(TestdateVo vo) {
			return sqlSessionTemplate.selectOne("board.count", vo);
		}
		
		public List<TestdateVo> tdList(TestdateVo vo) {
			return sqlSessionTemplate.selectList("board.selectList", vo);
		}
		
		public int tdInsert(TestdateVo vo) {
			int r = -1;
			try {
				r = sqlSessionTemplate.insert("board.insert", vo);
			} catch (Exception e) {
				r = 0;
				System.out.println(e.getMessage());
			}
			return r;
		}
		
		public TestdateVo tdSelectOne(int Testdate_no) {
			return sqlSessionTemplate.selectOne("board.selectOne", Testdate_no);
		}
		
		public int tdUpdateReadcount(int Testdate_no) {
			return sqlSessionTemplate.update("board.updateReadcount", Testdate_no);
		}
		
		public int tdUpdate(TestdateVo vo) {
			return sqlSessionTemplate.update("board.update", vo);
		}	
		
		public int tdDelete(String Testdate_no) {		
			return sqlSessionTemplate.delete("board.delete", Testdate_no);
		}
		
		
		// ----------------------- 공지사항 영역 끝 -----------------------
}
