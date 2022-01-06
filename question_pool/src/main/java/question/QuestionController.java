package question;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import admin.AdminVo;
import school.SchoolService;
import school.SchoolVo;

@Controller
public class QuestionController {

	@Autowired
	QuestionService questionService;

	@Autowired
	SchoolService schoolService;

	@RequestMapping("/admin/question/index.do")
	public String selectQuestionlist(QuestionVo qv, ExampleVo ev, Model model, @RequestParam int exam_no) {
		model.addAttribute("exam",questionService.selectExam(exam_no));
		List<QuestionVo> qlist = questionService.selectQuestionlist(qv);
		List<ExampleVo> elist = questionService.selectExamplelist(ev);
		model.addAttribute("qlist", qlist);
		model.addAttribute("elist", elist);
		return "admin/question/index";
	}

	@RequestMapping("/admin/question/pool.do")
	public String pool(SchoolVo vo, Model model, QuestionVo qv) {
		List<SchoolVo> list = schoolService.selectList(vo);
		model.addAttribute("list", list);
		List<QuestionVo> qlist = questionService.selectyear(qv);
		model.addAttribute("qlist", qlist);
		List<QuestionVo> plist = questionService.selectsemester(qv);
		model.addAttribute("plist", plist);
		return "admin/question/pool"; // 문제등록(학교/연도/회차선택창으로 이동)
	}

	@GetMapping("/admin/question/write.do")
	public String write(Model model, @RequestParam int exam_no) {
		model.addAttribute("exam",questionService.selectExam(exam_no));
		return "admin/question/write";
	}

	@GetMapping("/admin/question/writeAjax.do")
	public String writeAjax() {
		return "admin/question/writeAjax";
	}

	@GetMapping("/admin/question/edit.do")
	public String edit(ExampleVo ev, Model model, @RequestParam int question_no) {
		model.addAttribute("qv",questionService.selectQuestion(question_no));
		ev.setQuestion_no(question_no);
		List<ExampleVo> elist = questionService.selectExamplelist(ev);
		model.addAttribute("elist",elist);
		return "admin/question/edit";
	}

	@RequestMapping("/admin/question/update.do")
	public String update(QuestionVo qv, ExampleVo ev, HttpServletRequest req) {
		String[] econtent = req.getParameterValues("example_content");
		int r1=0;
		int r2=0;
		
		r1= questionService.updateQuestion(qv);
		
		//for(int i=0; i<econtent.length; i++) {
			r2=questionService.updateExample(ev);
			
		//}
		
		if (r1 > 0 && r2 > 0) {
			req.setAttribute("msg", "정상적으로 수정되었습니다.");
			req.setAttribute("url", "index.do?exam_no="+qv.getExam_no());
		} else {
			req.setAttribute("msg", "수정 오류");
		}
		return "admin/include/return";
	}
	
	@RequestMapping("/admin/question/insert.do")
	public String insert(Model model, QuestionVo qv, ExampleVo ev, HttpServletRequest req, HttpSession sess, @RequestParam int exam_no) {
		qv.setAdmin_no(((AdminVo)sess.getAttribute("adminInfo")).getAdmin_no());
		model.addAttribute("exam",questionService.selectExam(exam_no));
		String[] examples = { "a", "b", "c", "d", "e" };
		String[] econtent = req.getParameterValues("example_content");
		String[] content = req.getParameterValues("question_content");
		String[] explanation = req.getParameterValues("explanation");
		String[] answers = req.getParameterValues("example");
		
		int r1 = 0;
		int r2 = 0;
		int ref = 0;
		
		for (int i = 0; i < content.length; i++) {
			qv.setQuestion_content(content[i]);
			qv.setExplanation(explanation[i]);
			qv.setAnswer(answers[i]);
			
			if (i == 0) {
				questionService.insertQuestion(qv);
				r1++;
				ref = qv.getQuestion_no();
			} else {
				qv.setQuestion_ref(ref);
				qv.setPassage(null);
				questionService.insertQuestion(qv);
				r1++;
			}

			for (int j = 0; j < 5; j++) {
				if (!("").equals(econtent[j])) {
					ev.setExample(examples[j]);
					ev.setExample_content(econtent[(i*5)+j]);
					ev.setQuestion_no(qv.getQuestion_no());
					questionService.insertExample(ev);
					r2++;
				}
			}
		}

		if (r1 > 0 && r2 > 0) {
			req.setAttribute("msg", "정상적으로 등록되었습니다.");
			req.setAttribute("url", "write.do?exam_no="+exam_no);
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