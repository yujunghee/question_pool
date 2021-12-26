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
	
	public List<QuestionVo> selectList(QuestionVo sv) {
		List<QuestionVo> list= sqlSessionTemplate.selectList("question.selectexam",sv);
		return list;
	}
	public List<QuestionVo> selectList1(QuestionVo cv){
		List<QuestionVo> list = sqlSessionTemplate.selectList("question.selectyear", cv);
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
		return sqlSessionTemplate.insert("question.insert_example",ev);
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


}
