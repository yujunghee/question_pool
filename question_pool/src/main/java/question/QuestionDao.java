package question;

import java.util.List;

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

	public int insertSchool(QuestionVo qv) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_school",qv);
		}catch(Exception e) {
			r=0;
		}
		return r;
	}

	public List<QuestionVo> selectList(QuestionVo vo) {
		return sqlSessionTemplate.selectList("question.selectList",vo);
	}

}
