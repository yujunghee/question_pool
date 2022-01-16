package payment;

import java.util.List;



public interface PayService {

	List<PayVo> paymentUser(PayVo vo) throws Exception;
	int cancelPay(PayVo vo);
}
