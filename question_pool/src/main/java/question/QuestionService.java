package question;

import java.util.List;

public interface QuestionService {

	int insertQuestion(QuestionVo qv);
	int insertExample(ExampleVo ev);

	int insertSchool(QuestionVo qv);

	List<QuestionVo> selectList(QuestionVo vo);
}
