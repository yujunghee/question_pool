package user;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserVo {
	
	private int user_no;
	private String user_email;
	private String user_pwd;
	private String user_nick;
	private String user_name;
	private String user_address;
	private int user_tel;
	private Timestamp user_regdate;
			 
}
