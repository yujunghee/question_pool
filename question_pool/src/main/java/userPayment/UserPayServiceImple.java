package userPayment;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import user.UserDao;
//import user.UserVo;




@Service
public class UserPayServiceImple implements UserPayService{

	@Autowired
	private UserPayDao payDao;
//	@Autowired
//	private UserDao userdao;
	

	@Override
	public UserPayVo paymentUser(UserPayVo vo) throws Exception {
		return payDao.paymentUser(vo);
	}
	
	@Override
	public int insert(UserPayVo vo) { // 재정의 
		return payDao.insert(vo);
	}

	@Override
	public int refundUpdate(UserPayVo vo, HttpSession sess) {
//		UserVo uv = userdao.login(vo);
//		sess.setAttribute("userInfo", uv);
		return payDao.refundUpdate(vo, sess);
	}

	@Override
	public int userGrade(UserPayVo vo) {
		return payDao.userGrade(vo);
	}



}
