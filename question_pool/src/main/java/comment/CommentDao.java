package comment;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class CommentDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<CommentVo> selectList(CommentVo cv) {
//		List<CommentVo> list = sqlSessionTemplate.selectList("comment.selectList", cv);
//		return list;
		return sqlSessionTemplate.selectList("comment.selectList", cv);
	}
	
	public int insert(CommentVo cv) {
		return sqlSessionTemplate.insert("comment.insert", cv);
	}
	
	public int delete(int c_no) {		
		return sqlSessionTemplate.delete("comment.delete", c_no); 
	}
}
