package userPayment;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserPayDao {

	
	@Autowired
	private SqlSessionTemplate sst;
	
	public UserPayVo paymentUser(UserPayVo vo) throws Exception {
		return sst.selectOne("userPay.Payment", vo);
	}
}
