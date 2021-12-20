package question;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImple implements QuestionService {

	@Autowired
	QuestionDao dao;
	
	@Override
	public int insert(QuestionVo qv,ExampleVo ev) {
		return dao.insert(qv, ev);
	}

}
