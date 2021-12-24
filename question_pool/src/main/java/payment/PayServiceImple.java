package payment;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class PayServiceImple implements PayService{

	@Autowired
	private PayDao payDao;
	

	@Override
	public List<PayVo> paymentUser(PayVo vo) throws Exception {
		return payDao.paymentUser(vo);
	}


}
