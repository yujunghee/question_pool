package admin.board;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import lombok.Getter;
import lombok.Setter;
import util.CommonVo;

@Getter
@Setter
public class NoticeVo extends CommonVo {
	private int notice_no; 
	private String notice_title; 
	private String notice_content;  
	private Timestamp notice_date;  
	private int admin_no; 
	private int notice_readcount; 
	private String notice_file_org; 
	private String notice_file_real;
	private String name;
	
	public String getNotice_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.notice_date);
	}
	
	
}
