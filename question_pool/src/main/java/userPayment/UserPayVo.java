package userPayment;


import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserPayVo {

	private int user_no;
	private String user_email;
	private String user_name;
	private String user_tel;
	private int refund;
	private int pay_no;
	private Timestamp pay_date;
	private int pay_way;
	private String pay_id;
	private int product_no;
	
	
	
	

}
