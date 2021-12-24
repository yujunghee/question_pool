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
}
