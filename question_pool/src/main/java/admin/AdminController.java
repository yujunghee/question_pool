package admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

	@GetMapping("/admin/question/pool.do")
	public String pool() {
		return "admin/question/pool"; //문제등록(학교/연도/회차선택창으로 이동)
	}
}
