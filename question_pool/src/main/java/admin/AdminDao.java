package admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDao {

	@Autowired
	SqlSessionTemplate sst;

	//로그인("namespace.id")
	public AdminVo login(AdminVo vo) {
		return sst.selectOne("admin.login",vo);
	}

	//이메일 중복체크
	public int emailCheck(String email) {
		return sst.selectOne("admin.emailCheck", email);
	}

}
