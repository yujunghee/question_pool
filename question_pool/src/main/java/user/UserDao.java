package user;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDao {

	@Autowired
	SqlSessionTemplate sst;

	//로그인("namespace.id")
	public UserVo login(UserVo vo) {
		return sst.selectOne("user.login",vo);
	}

	//이메일 중복체크
	public int userEmailCheck(String email) {
		return sst.selectOne("user.userEmailCheck", email);
	}

	// 회원가입
	public int insert(UserVo vo) {
		return sst.insert("user.insert", vo);
	}
	
	public String userConfirm(String userConfirm) {
		return sst.selectOne("user.userConfirm", userConfirm);
	}
	
	//이메일 중복체크
	public int emailDuplicate(String emailDuplicate) {
		return sst.selectOne("user.emailDuplicate", emailDuplicate);
	}
}