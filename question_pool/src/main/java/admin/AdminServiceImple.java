package admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImple implements AdminService {

	@Autowired
	AdminDao dao;
	
	@Override
	public boolean login(AdminVo vo, HttpSession sess) {
		AdminVo av = dao.login(vo);
		if(av!=null) {
			sess.setAttribute("adminInfo", av);
			return true;
		}
		return false;
	}

	@Override
	public int emailcheck(String email) {
		return dao.emailCheck(email);
	}

	
}
