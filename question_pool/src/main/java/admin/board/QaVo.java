package admin.board;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import util.CommonVo;

@Getter
@Setter
public class QaVo extends CommonVo {
	private int qa_no; 
	private String qa_title; 
	private String qa_content;
	private Timestamp qa_date;  
	private int admin_no; 
	private int qa_readcount;
	private String admin_name;
}
