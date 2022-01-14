package payment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class PayController {

	@Autowired
	PayService payService;
	
	@RequestMapping("/admin/payment/pay.do")
	public String view(Model model,PayVo vo) throws Exception {
		List<PayVo> list = payService.paymentUser(vo);
		model.addAttribute("data",list);
//		HttpURLConnection conn = null;
//		String access_token = null;
//		URL url = new URL("https://api.iamport.kr/users/getToken");
//		conn = (HttpURLConnection)url.openConnection();
//		conn.setRequestProperty("Content-Type", "application/json");
//		conn.setRequestProperty("Accept", "application/json");
//		conn.setDoOutput(true);
//		JSONObject obj = new JSONObject();	
		return "admin/payment/pay";
	}
	
	@PostMapping("/admin/payment/cancelPay.do")
	public String cancelPay(Model model, PayVo vo, HttpServletRequest req) {
		int r = payService.cancelPay(vo);
		if(r > 0) {
			model.addAttribute("msg","환불 되었습니다.");
			model.addAttribute("url","refund.do"); // 성공 했을때 상세페이지 이동 
		}else {
			model.addAttribute("msg","환불 오류. 다시시도해주세요");
			model.addAttribute("url","refund.do"); //실패했을때 수정페이지 이동 
		}
		return "admin/include/return";
	}
}
