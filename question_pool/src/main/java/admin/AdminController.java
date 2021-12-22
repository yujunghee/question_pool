package admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

	@Autowired
	AdminService service;
	
	@GetMapping("/admin/login.do")
	public String adminlogin() {
		return "admin/login";
	}
	@GetMapping("/admin/index.do")
	public String adminmainpage() {
		return "admin/index";
	}	
	
	@PostMapping("/admin/login.do")
	public String adminloginprocess(AdminVo vo, HttpSession sess, Model model) {
		if(service.login(vo, sess)) {
			return "redirect:index.do";
		}else {
			model.addAttribute("msg","이메일, 비밀번호를 확인해주세요");
		return "admin/include/return";
		}
	}
	
	@RequestMapping("/admin/logout.do")
	public String logout(Model model, HttpSession sess) {
		sess.invalidate();
		model.addAttribute("msg","로그아웃되었습니다");
		model.addAttribute("url","/question_pool/admin/login.do");
		return "admin/include/return";
	}
	
	@GetMapping("/admin/board/index.do")
	public String adminBoardMain() {
		return "admin/board/index";
	}
}
