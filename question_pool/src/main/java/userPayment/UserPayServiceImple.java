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


}
