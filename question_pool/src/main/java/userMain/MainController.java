package userMain;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
}
