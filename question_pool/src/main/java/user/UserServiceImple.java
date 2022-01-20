package user;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.AdminVo;
import util.SendMail;

@Service
public class UserServiceImple implements UserService {

	@Autowired
	UserDao userdao;

	
	@Override
	public boolean login(UserVo vo, HttpSession sess) {
		UserVo uv = userdao.login(vo);
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
			SendMail.sendMail("question_pool@naver.com",
									email, 
								"question_pool 인증번호입니다. 감사합니다", 
								"인증번호:<span style='color:red;'>"+confirm+"</span>");
			return confirm;
		}
		return "";
	}

	@Override
	public int insert(UserVo vo) {
		return userdao.insert(vo);
	}
	
	@Override
	public int emailDuplicate(String emailDuplicate) {
		return userdao.emailDuplicate(emailDuplicate);
	}
	
	@Override
	public List<UserVo> userList(UserVo vo){
		return userdao.userList(vo);
	}

	@Override
	public int userDelete(String user_no) {
		return userdao.userDelete(user_no);
	}
	
	@Override
	public UserVo userView(int user_no) {
		return userdao.userSelectOne(user_no);
	}
	
	@Override
	public int userCount(UserVo vo) {
		return userdao.userCount(vo);
	}
	
	@Override
	public UserVo userEdit(int user_no) {
		return userdao.userSelectOne(user_no);
	}	
	
	@Override
	public int userUpdate(UserVo vo) {
		return userdao.userUpdate(vo);
	}
	
	@Override
	public UserVo searchId(UserVo vo) {
		return userdao.searchId(vo);
	}

	@Override
	public UserVo searchPwd(UserVo vo) {
		// 이메일과 이름으로 DB에서 조회
		UserVo uv = userdao.searchPwd(vo);
		// 조회한 결과가 있으면 임시비밀번호 생성, 임시비밀번호로 변경, 이메일 발송
		if (uv != null) {
			// 임시비밀번호 생성
			String tempPwd = "";
			for (int i=0; i<3; i++) {
				tempPwd += (char)((Math.random()*26)+65);
			}
			for (int i=0; i<3; i++) {
				tempPwd += (int)((Math.random()*9));
			}
			// 임시비밀번호 변경
			vo.setUser_pwd(tempPwd);
			userdao.updateTempPwd(vo);
			// 이메일 발송
			SendMail.sendMail("question_pool@naver.com",
								uv.getUser_email(), 
								"Ladder Up 임시 비밀번호입니다.", 
								"임시비밀번호:<span style='color:red;'>"+tempPwd+"</span>");
		}
		return uv;
	}
	
	@Override
	public int mypageUpdate(UserVo vo) {
		return userdao.mypageUpdate(vo);
	}
	
	public int mypageDelete(int user_no) {
		return userdao.mypageDelete(user_no);
	}
}