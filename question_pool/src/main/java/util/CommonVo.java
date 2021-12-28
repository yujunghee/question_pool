package util;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CommonVo {
	private String searchType;
	private String searchWord;
	private String orderCond;
	private int pageSize = 10;
	private int startIndex = 0;
	private int CntPerPage;
	
}
