package question;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionController {
	
	@Autowired
	
	
	@GetMapping("/admin/question/pool.do")
	public String pool() {
		return "admin/question/pool"; //문제등록(학교/연도/회차선택창으로 이동)
	}
	
	@RequestMapping("/admin/question/insert.do")
	public String insert() {
		
		int r = boardService.insert(vo);
		
		if(r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "등록 오류"); //r=0일때 오류안뜨게 try-catch해주기(dao에서)
			req.setAttribute("url", "write.do");
		}
		return "admin/include/return";
	}
}
