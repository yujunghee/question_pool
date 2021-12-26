package question;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import school.SchoolService;
import school.SchoolVo;

@Controller
public class QuestionController {

	@Autowired
	QuestionService questionService;

	@Autowired
	QuestionServiceImple questionServiceImple;
	
	@Autowired
	SchoolService schoolService;

	@RequestMapping("/admin/question/pool.do")
	public String pool(SchoolVo vo, Model model, QuestionVo qv) {
		List<QuestionVo> qvlist = questionServiceImple.selectexam(qv);
		model.addAttribute("qvlist",qvlist);
		List<SchoolVo> list = schoolService.selectList(vo);
		model.addAttribute("list", list);
		return "admin/question/pool"; // 문제등록(학교/연도/회차선택창으로 이동)
	}
	public String selectQuestionlist(QuestionVo qv, ExampleVo ev, Model model) {
		List<QuestionVo> qlist = questionService.selectQuestionlist(qv);
		List<ExampleVo> elist = questionService.selectExamplelist(ev);
		model.addAttribute("qlist",qlist);
		model.addAttribute("elist",elist);
		return "admin/question/index";
	}
	
	
	@GetMapping("/admin/question/write.do")
	public String write() {
		return "admin/question/write";
	}

	@RequestMapping("/admin/school/list.do")
	public String list(Model model, QuestionVo vo) {
		model.addAttribute("qlist", questionServiceImple.selectList1(vo));
		return "admin/question/pool";
	}
	
	@RequestMapping("/admin/question/insert.do")
	public String insert(QuestionVo qv, ExampleVo ev, HttpServletRequest req) {
		String[] arr1 = {"a","b","c","d","e"};
		String[] arr2 = req.getParameterValues("example_content");
		qv.setAnswer(req.getParameter("example"));
		
		int r1 = questionService.insertQuestion(qv);
		int r2 = 0;
		for(int i=0; i<arr2.length; i++) {
			if(!arr2[i].equals("")) {
				ev.setExample(arr1[i]);
				ev.setExample_content(arr2[i]);
				ev.setQuestion_no(qv.getQuestion_no());
				questionService.insertExample(ev);
				r2++;
			}
		}
		
		if(r1>0 && r2>0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "/question_pool/admin/question/write.do");
		} else {
			req.setAttribute("msg", "등록 오류");
		}
		return "admin/include/return";
	}

	
	@GetMapping("/admin/school/write.do")
	public String indexschool(Model model, SchoolVo vo) {
		
		List<SchoolVo> list = schoolService.selectList(vo);
		model.addAttribute("list", list);
		return "admin/school/write"; // 학교등록페이지로 이동
	}

	@PostMapping("/admin/question/write.do")
	public String senddata(SchoolVo vo, QuestionVo qv) {
		return"admin/question/write";
	}

	@RequestMapping("/admin/school/insertschool.do")
	public String insertSchool(SchoolVo sv, HttpServletRequest req) {
		int r = questionService.insertSchool(sv);
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "/question_pool/admin/school/write.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}
		
		return "admin/include/return";
	}

	@RequestMapping("/admin/school/insertexam.do")
	public String insertExam(QuestionVo qv, HttpServletRequest req) {
		qv.setSchool_no(Integer.parseInt(req.getParameter("school_no")));
		int r = questionService.insertExam(qv);
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "/question_pool/admin/question/pool.do");
		} else {
			req.setAttribute("msg", "등록 오류");
			req.setAttribute("url", "write.do");
		}
		return "admin/include/return";
	}
}
