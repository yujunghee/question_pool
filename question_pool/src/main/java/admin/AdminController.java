package admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminController {

//	@Autowired
//	AdminService service;
	
	@GetMapping("/admin/login.do")
	public String adminlogin() {
		return "admin/login";
	}
	@GetMapping("/admin/index.do")
	public String adminmainpage() {
		return "admin/index";
	}
	
//	@PostMapping("/admin/login.do")
//	public String adminlogin(AdminVo vo, HttpSession sess, Model model) {
//		if(service.login(vo, sess)) {
//			return "redirect:/index.do";
//		}else {
//			model.addAttribute("msg","이메일, 비밀번호를 확인해주세요");
//		return "include/return";
//		}
//	}
	
	@GetMapping("/admin/question/pool.do")
	public String pool() {
		return "admin/question/pool"; //문제등록(학교/연도/회차선택창으로 이동)
	}
}
