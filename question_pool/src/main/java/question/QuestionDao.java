package question;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class QuestionDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insert(QuestionVo vo) {
		int r = -1; //0개가 insert될수도있음
		try {
			r = sqlSessionTemplate.insert("question.insert",vo);
		}catch(Exception e) {
			r=0;
		}
		return r;
	}
}
