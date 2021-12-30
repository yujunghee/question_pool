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

import util.Pagination;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	
	// ----------------------- 공지사항 영역 시작 -----------------------
	
	@GetMapping("/admin/board/notice/notice.do")
	public String noticeList(Model model, HttpServletRequest req, NoticeVo vo) throws Exception{
			
			int totCount = boardService.noticeCount(vo);
			int totPage = totCount / 10; //총페이지수 
			if(totCount % 10 > 0) totPage++;
			
			int startIdx = (vo.getPage()-1)*10;
			vo.setStartIdx(startIdx);				 		
			
			List<NoticeVo> list = boardService.noticeList(vo);
			model.addAttribute("list",list);
			model.addAttribute("totPage",totPage);
			model.addAttribute("totCount",totCount);
			model.addAttribute("pageArea",Pagination.getPageArea("notice.do", vo.getPage(), totPage, 10));
			return "admin/board/notice/notice";
	}
	
	@RequestMapping("/admin/board/notice/write.do")
	public String noticeWrite() {
		return "admin/board/notice/write";
	}
	
	@PostMapping("/admin/board/notice/insert.do")
	public String noticeInsert(NoticeVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		if (!file.isEmpty()) { // 사용자가 파일을 첨부했다면
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf("."));
				String notice_file_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+notice_file_real)); 
				vo.setNotice_file_org(filename);
				vo.setNotice_file_real(notice_file_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		int r = boardService.noticeInsert(vo);
		System.out.println("r:"+r);
		
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "notice.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}		
		return "admin/include/return";
	}
	
	@GetMapping("/admin/board/notice/view.do")
	public String noticeView(Model model, @RequestParam int notice_no) {
		model.addAttribute("data", boardService.noticeView(notice_no));
		return "admin/board/notice/view";
	}
	
	@GetMapping("/admin/board/notice/edit.do")
	public String noticeEdit(Model model, @RequestParam int notice_no) {
		model.addAttribute("data", boardService.noticeView(notice_no)); 
		return "admin/board/notice/edit";
	}
	
	@PostMapping("/admin/board/notice/update.do")
	public String noticeUpdate(Model model, NoticeVo vo, MultipartFile file, HttpServletRequest req) {
		// 기존파일 삭제 기능
		if (req.getParameter("delCheck") != null) {
			NoticeVo bv = boardService.noticeEdit(vo.getNotice_no());
			File f = new File(req.getRealPath("/upload/")+bv.getNotice_file_real());
			f.delete();
			vo.setNotice_file_org("");
			vo.setNotice_file_real("");
		}
		if (file != null && !file.isEmpty()) { // 사용자가 파일을 첨부했다면
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)				
				String Notice_file_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+Notice_file_real)); // 경로에 파일을 저장
				vo.setNotice_file_org(filename);
				vo.setNotice_file_real(Notice_file_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int res = boardService.noticeUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?notice_no="+vo.getNotice_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?notice_no="+vo.getNotice_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}	
	
	@RequestMapping("/admin/board/notice/delete.do")
	public String noticeDelete(HttpServletRequest request, NoticeVo vo) throws Exception {
		// 단일 및 다중선택 후 삭제 가능하도록 배열 처리
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]);
    		boardService.noticeDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}
	// ----------------------- 공지사항 영역 끝 -----------------------
	
	
	
	// ----------------------- 시험일정 영역 시작 -----------------------
	
	@GetMapping("/admin/board/testdate/testdate.do")
	public String tdList(Model model, HttpServletRequest req, TestdateVo vo) throws Exception{
		
		int totCount = boardService.tdCount(vo);
		int totPage = totCount / 10; //총페이지수 
		if(totCount % 10 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*10;
		vo.setStartIdx(startIdx);				 		
		
		List<TestdateVo> list = boardService.tdList(vo);
		model.addAttribute("list",list);
		model.addAttribute("totPage",totPage);
		model.addAttribute("totCount",totCount);
		model.addAttribute("pageArea",Pagination.getPageArea("testdate.do", vo.getPage(), totPage, 10));
		return "admin/board/testdate/testdate";
	}
	
	@RequestMapping("/admin/board/testdate/write.do")
	public String tdWrite() {
		return "admin/board/testdate/write";
	}
	
	@PostMapping("/admin/board/testdate/insert.do")
	public String tdInsert(TestdateVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
		if (!file.isEmpty()) { // 사용자가 파일을 첨부했다면
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf("."));
				String td_file_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+td_file_real)); 
				vo.setTd_file_org(filename);
				vo.setTd_file_real(td_file_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}		
		int r = boardService.tdInsert(vo);
		System.out.println("r:"+r);
		
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "testdate.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}		
		return "admin/include/return";
	}
	
	@GetMapping("/admin/board/testdate/view.do")
	public String tdView(Model model, @RequestParam int td_no) {
		model.addAttribute("data", boardService.tdView(td_no));
		return "admin/board/testdate/view";
	}
	
	@GetMapping("/admin/board/testdate/edit.do")
	public String tdEdit(Model model, @RequestParam int td_no) {
		model.addAttribute("data", boardService.tdView(td_no)); 
		return "admin/board/testdate/edit";
	}
	
	@PostMapping("/admin/board/testdate/update.do")
	public String tdUpdate(Model model, TestdateVo vo, MultipartFile file, HttpServletRequest req) {
		// 기존파일 삭제 기능
		if (req.getParameter("delCheck") != null) {
			TestdateVo bv = boardService.tdEdit(vo.getTd_no());
			File f = new File(req.getRealPath("/upload/")+bv.getTd_file_real());
			f.delete();
			vo.setTd_file_org("");
			vo.setTd_file_real("");
		}
		if (file != null && !file.isEmpty()) { // 사용자가 파일을 첨부했다면
			try {
				String path = req.getRealPath("/upload/");
				String filename = file.getOriginalFilename();
				String ext = filename.substring(filename.lastIndexOf(".")); // 확장자 (.jpg)				
				String td_file_real = System.currentTimeMillis() + ext;
				
				file.transferTo(new File(path+td_file_real)); // 경로에 파일을 저장
				vo.setTd_file_org(filename);
				vo.setTd_file_real(td_file_real);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		}
		int res = boardService.tdUpdate(vo);
		if (res > 0) {
			model.addAttribute("msg", "정상적으로 수정되었습니다.");
			model.addAttribute("url", "view.do?td_no="+vo.getTd_no()); // 성공했을때 상세페이지로 이동
		} else {
			model.addAttribute("msg", "수정 오류");
			model.addAttribute("url", "edit.do?td_no="+vo.getTd_no()); // 실패했을때 수정페이지로 이동
		}
		return "admin/include/return";
	}	
	
	@RequestMapping("/admin/board/testdate/delete.do")
	public String tdDelete(HttpServletRequest request, TestdateVo vo) throws Exception {
		// 단일 및 다중선택 후 삭제 가능하도록 배열 처리
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]); 
    		boardService.tdDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}
	
	
	// ----------------------- 공지사항 영역 끝 -----------------------
	
}	

