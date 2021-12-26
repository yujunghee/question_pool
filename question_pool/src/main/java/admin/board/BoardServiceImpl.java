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
	public int count(NoticeVo vo) {
		return boardDao.count(vo);
	}
	
	@Override
	public List<NoticeVo> selectList(NoticeVo vo) {
		return boardDao.selectList(vo);
	}

	@Override
	public int insert(NoticeVo vo) {
		return boardDao.insert(vo);
	}

	@Override
	public NoticeVo view(int notice_no) { 
		boardDao.updateReadcount(notice_no);
		return boardDao.selectOne(notice_no);
	}
	@Override
	public NoticeVo edit(int notice_no) {
		boardDao.updateReadcount(notice_no);
		return boardDao.selectOne(notice_no);
	}	

	@Override
	public int update(NoticeVo vo) {
		return boardDao.update(vo);
	}
	

	@Override
	public int delete(String notice_no) { 		
		return boardDao.delete(notice_no);
	} 

	// ----------------------- 공지사항 영역 끝 -----------------------
}
