package payment;

import java.sql.Timestamp;

public class PayVo {

	private Timestamp pay_date;
	private int pay_way;
	private int refund;
	private int refund_reason;
	
	
	public Timestamp getPay_date() {
		return pay_date;
	}
	public void setPay_date(Timestamp pay_date) {
		this.pay_date = pay_date;
	}
	public int getPay_way() {
		return pay_way;
	}
	public void setPay_way(int pay_way) {
		this.pay_way = pay_way;
	}
	public int getRefund() {
		return refund;
	}
	public void setRefund(int refund) {
		this.refund = refund;
	}
	public int getRefund_reason() {
		return refund_reason;
	}
	public void setRefund_reason(int refund_reason) {
		this.refund_reason = refund_reason;
	}
	
	
}
