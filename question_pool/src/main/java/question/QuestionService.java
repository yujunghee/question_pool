package question;

import java.util.List;

public interface QuestionService {

	int insert(QuestionVo qv,ExampleVo ev);

	int insertSchool(QuestionVo qv);

	List<QuestionVo> selectList(QuestionVo vo);
}
