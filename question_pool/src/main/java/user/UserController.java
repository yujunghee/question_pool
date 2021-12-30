package user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {

	@Autowired
	UserService service;
	
	@GetMapping("/user/login.do")
	public String userlogin() {
		return "user/login/login";
	}
	@GetMapping("/user/index.do")
	public String usermainpage() {
		return "user/index";
	}	
	
	@PostMapping("/user/login.do")
	public String userloginprocess(UserVo vo, HttpSession sess, Model model) {
		if(service.login(vo, sess)) {
			return "redirect:index.do";
		}else {
			model.addAttribute("msg","이메일, 비밀번호를 확인해주세요");
		return "user/include/return";
		}
	}
	
	@GetMapping("/user/logout.do")
	public String logOut(Model model, HttpSession sess) {
		model.addAttribute("msg", "로그아웃되었습니다.");
		model.addAttribute("url", "index.do");
		sess.invalidate();
		return "user/include/give";
	}   
	
	
	@GetMapping("/user/board/index.do")
	public String userBoardMain() {
		return "user/board/index";
	}
}
