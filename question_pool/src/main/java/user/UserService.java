package user;

import java.util.List;

import javax.servlet.http.HttpSession;


public interface UserService {

	boolean login(UserVo vo, HttpSession sess);
	String userEmailCheck(String email);
	int insert(UserVo vo);
	int emailDuplicate(String emailDuplicate);
	List<UserVo> userList(UserVo vo);
	int userDelete(String user_no);
	UserVo userView(int user_no);
	int userCount(UserVo vo);
	UserVo userEdit(int user_no);
	int userUpdate(UserVo vo);
}