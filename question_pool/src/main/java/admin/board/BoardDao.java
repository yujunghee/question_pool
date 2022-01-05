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
		return sqlSessionTemplate.selectOne("board.noticeCount", vo);
	}
	
	public List<NoticeVo> noticeList(NoticeVo vo) {
		return sqlSessionTemplate.selectList("board.noticeList", vo);
	}
	
	public int noticeInsert(NoticeVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("board.noticeInsert", vo);
		} catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public NoticeVo noticeSelectOne(int notice_no) {
		return sqlSessionTemplate.selectOne("board.noticeOne", notice_no);
	}
	
	public int noticeUpdateReadcount(int notice_no) {
		return sqlSessionTemplate.update("board.noticeUpdateReadcount", notice_no);
	}
	
	public int noticeUpdate(NoticeVo vo) {
		return sqlSessionTemplate.update("board.noticeUpdate", vo);
	}	
	
	public int noticeDelete(String notice_no) {		
		return sqlSessionTemplate.delete("board.noticeDelete", notice_no);
	}
	
	
	// ----------------------- 공지사항 영역 끝 -----------------------
	
	
	
	
	// ----------------------- 시험일정 영역 시작 -----------------------
	
	public int tdCount(TestdateVo vo) {
		return sqlSessionTemplate.selectOne("board.tdCount", vo);
	}
	
	public List<TestdateVo> tdList(TestdateVo vo) {
		return sqlSessionTemplate.selectList("board.tdList", vo);
	}
	
	public int tdInsert(TestdateVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("board.tdInsert", vo);
		} catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public TestdateVo tdSelectOne(int Testdate_no) {
		return sqlSessionTemplate.selectOne("board.tdOne", Testdate_no);
	}
	
	public int tdUpdateReadcount(int Testdate_no) {
		return sqlSessionTemplate.update("board.tdUpdateReadcount", Testdate_no);
	}
	
	public int tdUpdate(TestdateVo vo) {
		return sqlSessionTemplate.update("board.tdUpdate", vo);
	}	
	
	public int tdDelete(String Testdate_no) {		
		return sqlSessionTemplate.delete("board.tdDelete", Testdate_no);
	}
	
	
	// ----------------------- 시험일정 영역 끝 -----------------------
	
	
	
	
	// ----------------------- QnA 영역 시작 -----------------------
	
	public int qaCount(QaVo vo) {
		return sqlSessionTemplate.selectOne("board.qaCount", vo);
	}
	
	public List<QaVo> qaList(QaVo vo) {
		return sqlSessionTemplate.selectList("board.qaList", vo);
	}
	
	public int qaInsert(QaVo vo) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("board.qaInsert", vo);
		} catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public QaVo qaSelectOne(int qa_no) {
		return sqlSessionTemplate.selectOne("board.qaOne", qa_no);
	}
	
	public int qaUpdateReadcount(int qa_no) {
		return sqlSessionTemplate.update("board.qaUpdateReadcount", qa_no);
	}
	
	public int qaUpdate(QaVo vo) {
		return sqlSessionTemplate.update("board.qaUpdate", vo);
	}	
	
	public int qaDelete(String qa_no) {		
		return sqlSessionTemplate.delete("board.qaDelete", qa_no);
	}
	
	
	// ----------------------- QnA 영역 끝 -----------------------
}
