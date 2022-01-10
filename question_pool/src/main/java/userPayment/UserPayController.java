package userPayment;




import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import user.UserVo;


@Controller
public class UserPayController {

	@Autowired
	UserPayService payService;
	
	@RequestMapping("/user/payment/pay.do")
	public String view(Model model, UserPayVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) throws Exception {
		vo.setUser_no(((UserVo)sess.getAttribute("userInfo")).getUser_no());
		UserPayVo list = payService.paymentUser(vo);
		model.addAttribute("data",list);
		return "user/payment/pay";
	
	}
	
	@PostMapping("/user/payment/payInsert.do")
	public String insert(UserPayVo vo, HttpServletRequest req, HttpSession sess) {
		vo.setUser_no(((UserVo)sess.getAttribute("userInfo")).getUser_no());
		int r = payService.insert(vo);
		
		// 정상적으로 등록되었습니다. alert 띄우고 
		// index.do 로 이동 
		if(r > 0) {
		req.setAttribute("msg", "결제되었습니다. 감사합니다");
		req.setAttribute("url", "index.do");
		} else {
			req.setAttribute("msg", "결제 오류");
			req.setAttribute("url", "join.do");
		}
		
		return "user/payment/pay";
		}
}
