package user.question;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import question.ExampleVo;
import question.QuestionVo;
import school.SchoolService;
import school.SchoolVo;

@Controller
public class UserQuestionController {

	@Autowired
	UserQuestionService questionService;

	@Autowired
	SchoolService schoolService;

	@RequestMapping("/user/question/index.do")
	public String indexQuestion(QuestionVo qv, ExampleVo ev, Model model, @RequestParam int exam_no) {
		model.addAttribute("exam",questionService.selectExam(exam_no));
		model.addAttribute("school", schoolService.selectSchool(exam_no));
		List<QuestionVo> qlist = questionService.selectQuestionlist(qv);
		List<ExampleVo> elist = new ArrayList<ExampleVo>();
		for(int i=0; i<qlist.size(); i++) {
			ev.setQuestion_no(qlist.get(i).getQuestion_no());
			elist.addAll(questionService.selectExamplelist(ev));
		}
		model.addAttribute("qlist", qlist);
		model.addAttribute("elist", elist);
		String[] examples = { "A", "B", "C", "D", "E" };
		model.addAttribute("ex",examples);
		return "user/question/index";
	}

	@RequestMapping("/user/question/pool.do")
	public String pool(SchoolVo vo, Model model, QuestionVo qv) {
		List<SchoolVo> list = schoolService.selectList(vo);
		model.addAttribute("list", list);
		List<QuestionVo> qlist = questionService.selectyear(qv);
		model.addAttribute("qlist", qlist);
		List<QuestionVo> plist = questionService.selectsemester(qv);
		model.addAttribute("plist", plist);
		return "user/question/pool"; // 문제등록(학교/연도/회차선택창으로 이동)
	}
	
	@RequestMapping("/user/question/score.do")
	public String score(QuestionVo qv, ExampleVo ev, Model model, @RequestParam int exam_no) {
		model.addAttribute("exam",questionService.selectExam(exam_no));
		model.addAttribute("school", schoolService.selectSchool(exam_no));
		List<QuestionVo> qlist = questionService.selectQuestionlist(qv);
		List<ExampleVo> elist = new ArrayList<ExampleVo>();
		for(int i=0; i<qlist.size(); i++) {
			ev.setQuestion_no(qlist.get(i).getQuestion_no());
			elist.addAll(questionService.selectExamplelist(ev));
		}
		model.addAttribute("qlist", qlist);
		model.addAttribute("elist", elist);
		String[] examples = { "A", "B", "C", "D", "E" };
		model.addAttribute("ex",examples);
		
		return "user/question/score";
	}
	
	

}