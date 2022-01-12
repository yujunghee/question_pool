package user.question;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import question.ExampleVo;
import question.QuestionVo;

@Repository
public class UserQuestionDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<QuestionVo> selectList(QuestionVo qv) {
		List<QuestionVo> list= sqlSessionTemplate.selectList("question.selectexam",qv);
		return list;
	}
	public QuestionVo selectQuestion(int question_no) {
		return sqlSessionTemplate.selectOne("question.selectQuestion",question_no);
	}
	public List<QuestionVo> selectQuestionlist(QuestionVo qv){
		return sqlSessionTemplate.selectList("question.selectQuestionlist",qv);
	}
	public List<QuestionVo> selectyear(QuestionVo qv){
		return sqlSessionTemplate.selectList("question.selectyear",qv);
	}
	public List<QuestionVo> selectsemester(QuestionVo qv){
		return sqlSessionTemplate.selectList("question.selectsemester",qv);
	}
	public List<ExampleVo> selectExamplelist(ExampleVo ev){
		return sqlSessionTemplate.selectList("question.selectExamplelist",ev);
	}
	public QuestionVo selectExam(int exam_no) {
		return sqlSessionTemplate.selectOne("question.selectExam",exam_no);
	}

}
