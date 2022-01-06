package question;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import school.SchoolVo;

@Repository
public class QuestionDao {

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	public List<QuestionVo> selectList(QuestionVo qv) {
		List<QuestionVo> list= sqlSessionTemplate.selectList("question.selectexam",qv);
		return list;
	}
	
	public int insertQuestion(QuestionVo qv) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_question",qv);
		}catch(Exception e) {
			r=0;
		}
		return r;
	}
	
	public int insertExample(ExampleVo ev) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_example",ev);
		}catch(Exception e) {
			r=0;
		}
		return r;
	}
	
	public QuestionVo selectQuestion(int question_no) {
		return sqlSessionTemplate.selectOne("question.selectQuestion",question_no);
	}
	
	public ExampleVo selectExample(int example_no) {
		return sqlSessionTemplate.selectOne("question.selectExample",example_no);
	}
	
	public int updateQuestion(QuestionVo qv) {
		return sqlSessionTemplate.update("question.updateQuestion",qv);
	}
	
	public int updateExample(ExampleVo ev) {
		return sqlSessionTemplate.update("question.updateExample",ev);
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

	public int insertSchool(SchoolVo sv) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_school",sv);
		}catch(Exception e) {
			r=0;
		}
		return r;
	}
	public int insertExam(QuestionVo qv) {
		int r = -1;
		try {
			r = sqlSessionTemplate.insert("question.insert_exam",qv);
		}catch(Exception e) {
			r=0;
		}
		return r;
	}
	
	public QuestionVo selectExam(int exam_no) {
		return sqlSessionTemplate.selectOne("question.selectExam",exam_no);
	}

}
