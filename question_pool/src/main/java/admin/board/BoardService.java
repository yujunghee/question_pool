package admin.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

	// ----------------------- 공지사항 영역 시작 -----------------------
	
	List<NoticeVo> noticeList(NoticeVo vo);
	int noticeCount(NoticeVo vo);
	int noticeInsert(NoticeVo vo);
	NoticeVo noticeView(int notice_no);
	NoticeVo noticeEdit(int notice_no);
	int noticeUpdate(NoticeVo vo);
	int noticeDelete(String notice_no);
	
	// ----------------------- 공지사항 영역 끝 ------------------------
	
	
	
	// ----------------------- 시험일정 영역 시작 -----------------------
	
	List<TestdateVo> tdList(TestdateVo vo);
	int tdCount(TestdateVo vo);
	int tdInsert(TestdateVo vo);
	TestdateVo tdView(int td_no);
	TestdateVo tdEdit(int td_no);
	int tdUpdate(TestdateVo vo);
	int tdDelete(String td_no);
		
	// ----------------------- 시험일정 영역 끝 -------------------------
	
	
	
	// ----------------------- QnA 영역 시작 -----------------------
	
	List<QaVo> qaList(QaVo vo);
	int qaCount(QaVo vo);
	int qaInsert(QaVo vo);
	QaVo qaView(int qa_no);
	QaVo qaEdit(int qa_no);
	int qaUpdate(QaVo vo);
	int qaDelete(String qa_no);
		
	// ----------------------- QnA 영역 끝 -------------------------
}
