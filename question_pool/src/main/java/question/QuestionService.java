package question;

import school.SchoolVo;

public interface QuestionService {

	int insertQuestion(QuestionVo qv);
	int insertExample(ExampleVo ev);

	int insertSchool(SchoolVo sv);

	int insertExam(QuestionVo qv);
}
