package admin.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	// ----------------------- 공지사항 영역 시작 -----------------------
	
	@Autowired
	BoardDao boardDao;

	@Override
	public int noticeCount(NoticeVo vo) {
		return boardDao.noticeCount(vo);
	}
	
	@Override
	public List<NoticeVo> noticeList(NoticeVo vo) {
		return boardDao.noticeList(vo);
	}

	@Override
	public int noticeInsert(NoticeVo vo) {
		return boardDao.noticeInsert(vo);
	}

	@Override
	public NoticeVo noticeView(int notice_no) { 
		boardDao.noticeUpdateReadcount(notice_no);
		return boardDao.noticeSelectOne(notice_no);
	}
	@Override
	public NoticeVo noticeEdit(int notice_no) {
		boardDao.noticeUpdateReadcount(notice_no);
		return boardDao.noticeSelectOne(notice_no);
	}	

	@Override
	public int noticeUpdate(NoticeVo vo) {
		return boardDao.noticeUpdate(vo);
	}
	

	@Override
	public int noticeDelete(String notice_no) { 		
		return boardDao.noticeDelete(notice_no);
	}

	 

	// ----------------------- 공지사항 영역 끝 -----------------------
	
	// ----------------------- 시험일정 영역 시작 -----------------------
	
		
	@Override
	public int tdCount(TestdateVo vo) {
		return boardDao.tdCount(vo);
	}
	
	@Override
	public List<TestdateVo> tdList(TestdateVo vo) {
		return boardDao.tdList(vo);
	}

	@Override
	public int tdInsert(TestdateVo vo) {
		return boardDao.tdInsert(vo);
	}

	@Override
	public TestdateVo tdView(int td_no) { 
		boardDao.tdUpdateReadcount(td_no);
		return boardDao.tdSelectOne(td_no);
	}
	@Override
	public TestdateVo tdEdit(int td_no) {
		boardDao.tdUpdateReadcount(td_no);
		return boardDao.tdSelectOne(td_no);
	}	

	@Override
	public int tdUpdate(TestdateVo vo) {
		return boardDao.tdUpdate(vo);
	}
	

	@Override
	public int tdDelete(String td_no) { 		
		return boardDao.tdDelete(td_no);
	}

		 

	// ----------------------- 시험일정 영역 끝 -----------------------
}
