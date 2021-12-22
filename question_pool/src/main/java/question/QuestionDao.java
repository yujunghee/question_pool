package question;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public int insert(QuestionVo qv,ExampleVo ev) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_question",qv)+sqlSessionTemplate.insert("question.insert_example",ev);
		}catch(Exception e) {
			r=0;
		}
		return r;
	}
}
