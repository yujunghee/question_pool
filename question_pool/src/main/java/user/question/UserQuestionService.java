package user.question;

import java.util.List;

import question.ExampleVo;
import question.QuestionVo;

public interface UserQuestionService {

	QuestionVo selectQuestion(int question_no);
	List<QuestionVo> selectQuestionlist(QuestionVo qv);
	List<QuestionVo> selectyear(QuestionVo qv);
	List<QuestionVo> selectsemester(QuestionVo qv);
	List<ExampleVo> selectExamplelist(ExampleVo ev);
	QuestionVo selectExam(int exam_no);
	List<QuestionVo> selectexam(QuestionVo qv);
	
}
