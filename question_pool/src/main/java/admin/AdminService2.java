package admin;

import java.util.List;

import javax.servlet.http.HttpSession;


public interface AdminService {

	boolean login(AdminVo vo, HttpSession sess);
	int emailcheck(String email);
	List<AdminVo> adminList(AdminVo vo);
	int adminDelete(String admin_no);


}
