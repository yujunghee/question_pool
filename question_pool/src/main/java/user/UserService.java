package user;

import javax.servlet.http.HttpSession;

public interface UserService {

	boolean login(UserVo vo, HttpSession sess);
	int emailcheck(String email);
}
