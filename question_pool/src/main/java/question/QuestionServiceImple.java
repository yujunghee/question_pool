package question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import school.SchoolVo;

@Service
public class QuestionServiceImple implements QuestionService {

	@Autowired
	QuestionDao dao;
	
	@Override
	public int insertQuestion(QuestionVo qv) {
		return dao.insertQuestion(qv);
	}
	
	@Override
	public int insertExample(ExampleVo ev) {
		return dao.insertExample(ev);
	}

	@Override
	public List<QuestionVo> selectQuestionlist(QuestionVo qv) {
		return dao.selectQuestionlist(qv);
	}
	@Override
	public List<QuestionVo> selectyear(QuestionVo qv) {
		return dao.selectyear(qv);
	}
	@Override
	public List<QuestionVo> selectsemester(QuestionVo qv) {
		return dao.selectsemester(qv);
	}
	
	@Override
	public List<ExampleVo> selectExamplelist(ExampleVo ev) {
		return dao.selectExamplelist(ev);
	}
	
	@Override
	public int insertSchool(SchoolVo sv) {
		return dao.insertSchool(sv);
	}

	@Override
	public int insertExam(QuestionVo qv) {
		return dao.insertExam(qv);
	}

	@Override
	public List<QuestionVo> selectexam(QuestionVo qv){
		return dao.selectList(qv);
	}



}
