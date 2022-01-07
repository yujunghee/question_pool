package user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {

	@Autowired
	UserService service;
	
	@GetMapping("/user/login.do")
	public String userlogin() {
		return "user/login/login";
	}
	@GetMapping("/user/join.do")
	public String join() {
		return "user/login/join";
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
		return "user/include/return";
	}
	
	

	@GetMapping("/user/userEmailCheck.do")
	public String userEmailCheck(Model model, @RequestParam String email) {
		model.addAttribute("result", service.userEmailCheck(email));
		return "user/include/result";
	}
	
	@PostMapping("/user/insert.do")
	public String insert(UserVo vo, HttpServletRequest req) {
		if (service.insert(vo) > 0) {
			req.setAttribute("msg", "정상적으로 가입되었습니다.");
			req.setAttribute("url", "/question_pool/user/index.do");
		} else {
			req.setAttribute("msg", "가입오류");
		}
		return "user/include/return";
	}
	
	@GetMapping("/user/emailDuplicate.do")
	public String aaa(Model model, @RequestParam String email) {
		model.addAttribute("result", service.emailDuplicate(email));
		return "user/include/result";
	}
	

}