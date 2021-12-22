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
	public NoticeVo view(int boardno) { 
		boardDao.updateReadcount(boardno);
		return boardDao.selectOne(boardno);
	}
	@Override
	public NoticeVo edit(int boardno) {
		boardDao.updateReadcount(boardno);
		return boardDao.selectOne(boardno);
	}	

	@Override
	public int update(NoticeVo vo) {
		return boardDao.update(vo);
	}

	@Override
	public int delete(NoticeVo vo) {
		return boardDao.delete(vo);
	}
	
	// ----------------------- 공지사항 영역 끝 -----------------------
}
