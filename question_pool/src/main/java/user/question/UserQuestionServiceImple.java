package user.question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import question.ExampleVo;
import question.QuestionDao;
import question.QuestionService;
import question.QuestionVo;

@Service
public class UserQuestionServiceImple implements UserQuestionService {

	@Autowired
	QuestionDao dao;
	
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
	public List<QuestionVo> selectexam(QuestionVo qv){
		return dao.selectList(qv);
	}

	@Override
	public QuestionVo selectExam(int exam_no) {
		return dao.selectExam(exam_no);
	}

	@Override
	public QuestionVo selectQuestion(int question_no) {
		return dao.selectQuestion(question_no);
	}

}
