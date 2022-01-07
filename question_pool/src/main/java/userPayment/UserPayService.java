package userPayment;


public interface UserPayService {

	UserPayVo paymentUser(UserPayVo vo) throws Exception;
	int insert(UserPayVo vo);
}
