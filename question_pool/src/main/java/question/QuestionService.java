package question;

import java.util.List;

import school.SchoolVo;

public interface QuestionService {

	
	int insertQuestion(QuestionVo qv);
	int insertExample(ExampleVo ev);
	List<QuestionVo> selectQuestionlist(QuestionVo qv);
	List<ExampleVo> selectExamplelist(ExampleVo ev);
	int insertSchool(SchoolVo sv);

	int insertExam(QuestionVo qv);
	List<QuestionVo> selectexam(QuestionVo qv);
	QuestionVo year(int year);
	
}
