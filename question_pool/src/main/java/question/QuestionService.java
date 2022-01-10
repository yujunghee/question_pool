package question;

import java.util.List;

import school.SchoolVo;

public interface QuestionService {

	
	int insertQuestion(QuestionVo qv);
	int insertExample(ExampleVo ev);
	QuestionVo selectQuestion(int question_no);
	int updateQuestion(QuestionVo qv);
	int updateExample(ExampleVo ev);
	int deleteQuestion(int question_no);
	List<QuestionVo> selectQuestionlist(QuestionVo qv);
	List<QuestionVo> selectyear(QuestionVo qv);
	List<QuestionVo> selectsemester(QuestionVo qv);
	List<ExampleVo> selectExamplelist(ExampleVo ev);
	int insertSchool(SchoolVo sv);
	int insertExam(QuestionVo qv);
	QuestionVo selectExam(int exam_no);
	List<QuestionVo> selectexam(QuestionVo qv);
	
}
