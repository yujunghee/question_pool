package admin.board;

import java.util.List;

public interface BoardService {

	// ----------------------- 공지사항 영역 시작 -----------------------
	
	List<NoticeVo> selectList(NoticeVo vo);
	int count(NoticeVo vo);
	int insert(NoticeVo vo);
	NoticeVo view(int boardno);
	NoticeVo edit(int boardno);
	int update(NoticeVo vo);
	int delete(NoticeVo vo);
	
	// ----------------------- 공지사항 영역 끝 -----------------------
}
