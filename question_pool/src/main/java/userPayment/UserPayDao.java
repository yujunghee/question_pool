package userPayment;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class UserPayDao {

	
	@Autowired
	private SqlSessionTemplate sst;
	
	public UserPayVo paymentUser(UserPayVo vo) throws Exception {
		return sst.selectOne("userPay.paymentUser", vo);
	}
	
	public int insert(UserPayVo vo) {
		int r = -1;
		try {
			r = sst.insert("userPay.payInsert",vo);
		}catch (Exception e) {
			r = 0;
			System.out.println(e.getMessage());
		}
		return r;
	}
	
	public int refundUpdate(UserPayVo vo) {
		return sst.update("userPay.refundUpdate", vo);
	}
	
}
