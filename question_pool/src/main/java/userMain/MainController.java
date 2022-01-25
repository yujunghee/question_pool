package userMain;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import question.QuestionService;
import question.QuestionVo;
import school.SchoolService;
import school.SchoolVo;



@Controller
public class MainController {
	
	@Autowired
	QuestionService questionService;

	@Autowired
	SchoolService schoolService;

	@RequestMapping("/user/index.do")
	public String index() {
		return "user/index";
	}
	
	
	@RequestMapping("/user/main/index.do")
	public String mainIndex() {
		return "user/main/index";
	}
	
	@RequestMapping("/user/main/mainPool.do")
	public String userPool(SchoolVo vo, Model model, QuestionVo qv) {
		List<SchoolVo> list = schoolService.selectList(vo);
		model.addAttribute("list", list);
		List<QuestionVo> qlist = questionService.selectyear(qv);
		model.addAttribute("qlist", qlist);
		List<QuestionVo> plist = questionService.selectsemester(qv);
		model.addAttribute("plist", plist);
		return "user/main/mainPool"; 
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
