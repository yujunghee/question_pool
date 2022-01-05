package comment;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommentVo {
	private int c_no;
	private String tablename;
	private String content;
	private int admin_no;
	private int qa_no;
	private Timestamp regdate;
	private String name;
}
