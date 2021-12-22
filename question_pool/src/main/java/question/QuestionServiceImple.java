package question;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int insertSchool(QuestionVo qv) {
		return dao.insertSchool(qv);
	}

	@Override
	public List<QuestionVo> selectList(QuestionVo vo) {
		return dao.selectList(vo);
	}

}
