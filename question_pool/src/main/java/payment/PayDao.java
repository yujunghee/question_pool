package payment;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class PayDao {

	@Autowired
	SqlSessionTemplate sst;
}
