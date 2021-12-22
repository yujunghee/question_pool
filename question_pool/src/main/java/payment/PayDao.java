package payment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDao {

	
	@Autowired
	private SqlSessionTemplate sst;
	
	public List<PayVo> paymentUser(PayVo vo) throws Exception {
		return sst.selectList("pay.PaymentRecord", vo);
	}
}
