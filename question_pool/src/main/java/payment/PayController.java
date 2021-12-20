package payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayController {

	@RequestMapping("/admin/payment/pay.do")
	public String pay() {
		
		return "admin/payment/pay";
	}
}
