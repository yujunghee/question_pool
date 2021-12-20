package admin.board;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	// ----------------------- 공지사항 영역 시작 -----------------------
	
	@GetMapping("/admin/board/notice/notice.do")
	public String index(Model model, HttpServletRequest req, NoticeVo vo) {
				
		int totCount = boardService.count(vo); // 총개수
		int totPage = totCount / 10; // 총페이지수
		if (totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1) * 10;
		vo.setStartIdx(startIdx);
		
		List<NoticeVo> list = boardService.selectList(vo);
		model.addAttribute("list", list);
		model.addAttribute("totPage", totPage);
		return "admin/board/notice/notice";
	}
	
	@RequestMapping("/admin/board/notice/write.do")
	public String write() {
		return "admin/board/notice/write";
	}
	
	@PostMapping("/admin/board/notice/insert.do")
	public String insert(NoticeVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {		
		
		// 파일저장
		if (!file.isEmpty()) { // 사용자가 파일을 첨부했다면
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)
				// 내사진.jpg -> indexOf -> 3
				// 나어릴적.내사진.jpg -> 이럼안되서 lastIndexOf(".") 쓰는거임
				String filename_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+filename_real)); // 경로에 파일을 저장
				vo.setNotice_file_org(filename);
				vo.setNotice_file_real(filename_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		int r = boardService.insert(vo);
		System.out.println("r:"+r);
		
		// 정상적으로 등록되었습니다. alert띄우고
		// index.do로 이동
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}
		
		return "include/return";
	}
	
	@GetMapping("/admin/board/notice/view.do")
	public String view(Model model, @RequestParam int Notice_no) {
		model.addAttribute("data", boardService.view(Notice_no));
		return "admin/board/notice/view";
	}
	
	@GetMapping("/admin/board/notice/edit.do")
	public String edit(Model model, @RequestParam int Notice_no) {
		model.addAttribute("data", boardService.view(Notice_no)); 
		return "admin/board/notice/edit";
	}
	
	@PostMapping("/admin/board/notice/update.do")
	public String update(Model model, NoticeVo vo) {
		int res = boardService.update(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?Notice_no="+vo.getNotice_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?Notice_no="+vo.getNotice_no()); // 실패했을때 수정페이지로 이동
		}
		return "include/return";
	}
	
	@GetMapping("/admin/board/notice/delete.do")
	public String delete(Model model, NoticeVo vo) {		
		int r = boardService.delete(vo);
		System.out.println("con : "+r);
		if (r > 0) {
			model.addAttribute("msg", "정상적으로 삭제되었습니다.");
			model.addAttribute("url", "index.do"); // 성공했을때 목록페이지로 이동
		} else {
			model.addAttribute("msg", "삭제 오류");
			model.addAttribute("url", "view.do?Notice_no="+vo.getNotice_no()); // 실패했을때 상세페이지로 이동
		}
		return "include/return";
	}
	
	// ----------------------- 공지사항 영역 끝 -----------------------
	
	
}
