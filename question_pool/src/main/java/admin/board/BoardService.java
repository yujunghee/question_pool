package admin.board;

import java.util.List;
import java.util.Map;

public interface BoardService {

	// ----------------------- 공지사항 영역 시작 -----------------------
	
	List<NoticeVo> selectList(NoticeVo vo);
	int count(NoticeVo vo);
	int insert(NoticeVo vo);
	NoticeVo view(int notice_no);
	NoticeVo edit(int notice_no);
	int update(NoticeVo vo);
	int delete(String notice_no);
	
	// ----------------------- 공지사항 영역 끝 -----------------------
}
