package user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImple implements UserService {

	@Autowired
	UserDao dao;
	
	@Override
	public boolean login(UserVo vo, HttpSession sess) {
		UserVo uv = dao.login(vo);
		if(uv!=null) {
			sess.setAttribute("userInfo", uv);
			return true;
		}
		return false;
	}

	@Override
	public int emailcheck(String email) {
		return dao.emailCheck(email);
	}

	
}
