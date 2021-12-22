package payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class PayController {

	@Autowired
	PayService payService;
	
	@RequestMapping("/admin/payment/pay.do")
	public String view(Model model,PayVo vo) throws Exception {
		List<PayVo> list = payService.paymentUser(vo);
		model.addAttribute("data",list);
		System.out.println();
		return "admin/payment/pay";
	
	}
}
