package admin;

import javax.servlet.http.HttpSession;

public interface AdminService {

	boolean login(AdminVo vo, HttpSession sess);
	int emailcheck(String email);
}
