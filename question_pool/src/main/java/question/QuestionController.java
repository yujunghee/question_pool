package question;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QuestionController {
	
	@Autowired
	QuestionService questionService;
	
	@GetMapping("/admin/question/pool.do")
	public String pool() {
		return "admin/question/pool"; //문제등록(학교/연도/회차선택창으로 이동)
	}
	
	@GetMapping("/admin/question/input.do")
	public String input() {
		return "admin/question/input";
	}
	
	@RequestMapping("/admin/question/insert.do")
	public String insert(QuestionVo qv, ExampleVo ev, HttpServletRequest req) {
		
		int r = questionService.insert(qv, ev);
		
		if(r > 1) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "/question_pool/admin/question/input.do");
		} else {
			req.setAttribute("msg", "등록 오류"); 
		}
		return "admin/include/return";
	}
	
	@GetMapping("/admin/question/school.do")
	public String school() {
		return "admin/question/school"; //학교등록페이지로 이동
	}
}
