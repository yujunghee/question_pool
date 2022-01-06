package user;

import javax.servlet.http.HttpSession;

public interface UserService {

	boolean login(UserVo vo, HttpSession sess);
	String userEmailCheck(String email);
	int insert(UserVo vo);
	int emailDuplicate(String emailDuplicate);
}