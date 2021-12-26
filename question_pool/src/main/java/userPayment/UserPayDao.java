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
	
//	public int insert(UserPayVo vo) {
//		//return sqlSessionTemplate.insert("board.insert",vo);
//		int r = -1;
//		try {
//			r = sst.insert("userPay.insert",vo);
//		}catch (Exception e) {
//			r = 0;
//			System.out.println(e.getMessage());
//		}
//		return r;
//	}
}
