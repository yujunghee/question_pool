package userPayment;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class UserPayServiceImple implements UserPayService{

	@Autowired
	private UserPayDao payDao;
	

	@Override
	public UserPayVo paymentUser(UserPayVo vo) throws Exception {
		return payDao.paymentUser(vo);
	}
	
	@Override
	public int insert(UserPayVo vo) { // 재정의 
		return payDao.insert(vo);
	}

	@Override
	public int refundUpdate(UserPayVo vo) {
		return payDao.refundUpdate(vo);
	}

	@Override
	public int userGrade(UserPayVo vo) {
		return payDao.userGrade(vo);
	}



}
