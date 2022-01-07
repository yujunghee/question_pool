package admin;


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

import user.UserService;
import util.Pagination;

@Controller
public class AdminController {

	@Autowired
	AdminService adminservice;
	
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
		if(adminservice.login(vo, sess)) {
			return "redirect:/admin/index.do";
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

	@GetMapping("/admin/admin/index.do")
	public String adminList(Model model, AdminVo vo ) throws Exception {
		
		List<AdminVo> list = adminservice.adminList(vo);
		model.addAttribute("list", list);
	
		return "admin/admin/index";
	}
	
	@RequestMapping("/admin/admin/delete.do")
	public String adminDelete(HttpServletRequest request, AdminVo vo) throws Exception {
        String[] ajaxMsg = request.getParameterValues("valueArr");        
        int size = ajaxMsg.length;
        for(int i=0; i<size; i++) {
        	System.out.println("ajaxMsg[i]:"+ajaxMsg[i]);
        	adminservice.adminDelete(ajaxMsg[i]);
        }
		return "admin/include/return";
	}	
	
	
}