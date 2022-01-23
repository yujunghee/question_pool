package userMain;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class MainController {

	@RequestMapping("/user/index.do")
	public String index() {
		return "user/index";
	}
	
	
	@RequestMapping("/user/main/index.do")
	public String mainIndex() {
		return "user/main/index";
	}
	
	@RequestMapping("/user/myinfo/index.do")
	public String myinfoIndex() {
		return "user/myinfo/index";
	}
	@RequestMapping("/user/myinfo/myinfo.do")
	public String myinfo() {
		return "user/myinfo/myinfo";
	}

}
