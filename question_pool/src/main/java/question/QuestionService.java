package question;

import java.util.List;

import school.SchoolVo;

public interface QuestionService {

	int insertQuestion(QuestionVo qv);
	int insertExample(ExampleVo ev);
	List<QuestionVo> selectQuestionlist(QuestionVo qv);
	int insertSchool(SchoolVo sv);

	int insertExam(QuestionVo qv);
}
