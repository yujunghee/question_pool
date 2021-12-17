package admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class AdminController {

//	@Autowired
//	AdminService service;
	
	@GetMapping("/admin/login.do")
	public String adminlogin() {
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
}
