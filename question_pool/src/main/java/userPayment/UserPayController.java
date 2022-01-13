package userPayment;




import java.io.File;

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
	public String userPay(Model model, UserPayVo vo, HttpServletRequest req, HttpSession sess) throws Exception {
		vo.setUser_no(((UserVo)sess.getAttribute("userInfo")).getUser_no());
		UserPayVo list = payService.paymentUser(vo);
		model.addAttribute("data",list);
		return "user/payment/pay";
	}
	
	@RequestMapping("/user/payment/refund.do")
	public String userRefund(Model model, UserPayVo vo, HttpServletRequest req, HttpSession sess) throws Exception {
		vo.setUser_no(((UserVo)sess.getAttribute("userInfo")).getUser_no());
		UserPayVo list = payService.paymentUser(vo);
		model.addAttribute("data",list);
		return "user/payment/refund";
	}
	@PostMapping("/user/payment/refundUpdate.do")
	public String update(Model model, UserPayVo vo, HttpServletRequest req) {
		int r = payService.refundUpdate(vo);
		if(r > 0) {
			model.addAttribute("msg","환불 요청되었습니다.");
			model.addAttribute("url","refund.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","환불 요청 오류. 다시시도해주세요");
			model.addAttribute("url","refund.do"); //실패했을때 수정페이지 이동 
		}
		return "user/include/return";
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
