package userPayment;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class UserPayController {

	@Autowired
	UserPayService payService;
	
	@RequestMapping("/user/payment/pay.do")
	public String view(Model model,UserPayVo vo) throws Exception {
		UserPayVo list = payService.paymentUser(vo);
		model.addAttribute("data",list);
		System.out.println();  
		return "user/payment/pay";
	
	}
	
//	@PostMapping("/board/insert.do")
//	public String insert(UserPayVo vo, HttpServletRequest req, MultipartFile file, HttpSession sess) {
//		vo.setUserno(((UserPayVo)sess.getAttribute("")).getUser_no());
//		//파일저장 
//		int r = payService.insert(vo);
//		// 정상적으로 등록되었습니다. alert 띄우고 
//		// index.do 로 이동 
//		if(r > 0) {
//		req.setAttribute("msg", "정상적으로 등록되었습니다");
//		req.setAttribute("url", "index.do");
//		} else {
//			req.setAttribute("msg", "등록 오류 ");
//			req.setAttribute("url", "write.do");
//		}
//		
//		return "include/return";
//		}
}
