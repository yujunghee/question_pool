package user;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.SendMail;

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
	public String userEmailCheck(String email) {
		if (email != null) {
			String confirm = "";
			for (int i=0; i<3; i++) {
				confirm += (char)((Math.random()*26)+65);
			}
			for (int i=0; i<3; i++) {
				confirm += (int)((Math.random()*9));
			}

			// 이메일 발송
			SendMail.sendMail("jinin7906@naver.com",
									email, 
								"question_pool 인증번호입니다. 감사합니다", 
								"인증번호:<span style='color:red;'>"+confirm+"</span>");
			return confirm;
		}
		return "";
	}

	@Override
	public int insert(UserVo vo) {
		return dao.insert(vo);
	}
	
	@Override
	public int emailDuplicate(String emailDuplicate) {
		return dao.emailDuplicate(emailDuplicate);
	}



	
}