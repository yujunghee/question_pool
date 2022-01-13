package question;

import java.util.ArrayList;
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
import user.UserVo;

@Controller
public class QuestionController {

	@Autowired
	QuestionService questionService;

	@Autowired
	SchoolService schoolService;

	@RequestMapping("/admin/question/index.do")
	public String indexQuestion(QuestionVo qv, ExampleVo ev, Model model, @RequestParam int exam_no) {
		ExamVo xo = new ExamVo();
		xo = questionService.selectExam(exam_no);
		model.addAttribute("exam", xo);
		model.addAttribute("school", schoolService.selectSchool(xo.getSchool_no()));
		
		List<QuestionVo> qlist = questionService.selectQuestionlist(qv);
		List<ExampleVo> list = questionService.selectExamplelist(ev);
	
		for(int i=0; i<qlist.size(); i++) {
			List<ExampleVo> elist = new ArrayList<ExampleVo>();
			for(int j=0; j<list.size(); j++) {
				if(qlist.get(i).getQuestion_no() == list.get(j).getQuestion_no()) {
					elist.add(list.get(j));
				}
			}
			qlist.get(i).setEx(elist);
		}
		model.addAttribute("qlist", qlist);
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
		ExamVo ev = new ExamVo();
		ev = questionService.selectExam(exam_no);
		model.addAttribute("exam", ev);
		model.addAttribute("school", schoolService.selectSchool(ev.getSchool_no()));
		return "admin/question/write";
	}

	@GetMapping("/admin/question/writeAjax.do")
	public String writeAjax() {
		return "admin/question/writeAjax";
	}

	@GetMapping("/admin/question/edit.do")
	public String edit(ExampleVo ev, Model model, @RequestParam int exam_no, @RequestParam int question_no) {
		model.addAttribute("exam",questionService.selectExam(exam_no));
		model.addAttribute("qv",questionService.selectQuestion(question_no));
		List<ExampleVo> elist = questionService.selectExample(question_no);
		model.addAttribute("elist",elist);
		String[] examples = { "A", "B", "C", "D", "E" };
		model.addAttribute("ex",examples);
		return "admin/question/edit";
	}

	@RequestMapping("/admin/question/update.do")
	public String update(QuestionVo qv, ExampleVo ev, HttpServletRequest req) {
		String[] econtent = req.getParameterValues("example_content");
		String[] eno = req.getParameterValues("example_no");
		
		int r1=0;
		int r2=0;
		
		qv.setAnswer(req.getParameter("example"));
		r1= questionService.updateQuestion(qv);
		
		for(int i=0; i<econtent.length; i++) {
			ev.setExample_content(econtent[i]);
			ev.setExample_no(Integer.parseInt(eno[i]));
			r2=questionService.updateExample(ev);
		}
		
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
		String[] examples = { "A", "B", "C", "D", "E" };
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

	@GetMapping("/admin/question/delete.do")
	public String deleteQuestion(Model model, @RequestParam int question_no, @RequestParam int exam_no, HttpServletRequest req) {
		int r = questionService.deleteQuestion(question_no);
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 삭제되었습니다.");
			req.setAttribute("url", "index.do?exam_no="+exam_no);
		} else {
			req.setAttribute("msg", "삭제 오류");
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
	
	@RequestMapping("/admin/question/showmetheyear.do")
	public String showmetheyear(SchoolVo vo, Model model, QuestionVo qv) {
		model.addAttribute("cList", questionService.selectyear(qv));
		return "admin/question/year"; // 문제등록(학교/연도/회차선택창으로 이동)
	}
	@RequestMapping("/admin/question/showmethesemester.do")
	public String showmethesemester(SchoolVo vo, Model model, QuestionVo qv) {
		model.addAttribute("dList", questionService.selectsemester(qv));
		return "admin/question/semester"; // 문제등록(학교/연도/회차선택창으로 이동)
	}
	/*--------------------------USER------------------------------*/
	
	
	@RequestMapping("/user/question/index.do")
	public String indexUserQuestion(QuestionVo qv, ExampleVo ev, Model model, @RequestParam int exam_no) {
		ExamVo xo = new ExamVo();
		xo = questionService.selectExam(exam_no);
		model.addAttribute("exam", xo);
		model.addAttribute("school", schoolService.selectSchool(xo.getSchool_no()));
		List<QuestionVo> qlist = questionService.selectQuestionlist(qv);
		List<ExampleVo> list = questionService.selectExamplelist(ev);
		
		for(int i=0; i<qlist.size(); i++) {
			List<ExampleVo> elist = new ArrayList<ExampleVo>();
			for(int j=0; j<list.size(); j++) {
				if(qlist.get(i).getQuestion_no() == list.get(j).getQuestion_no()) {
					elist.add(list.get(j));
				}
			}
			qlist.get(i).setEx(elist);
		}
		model.addAttribute("qlist", qlist);
		String[] examples = { "A", "B", "C", "D", "E" };
		model.addAttribute("ex",examples);
		return "user/question/index";
	}

	@RequestMapping("/user/question/pool.do")
	public String userPool(SchoolVo vo, Model model, QuestionVo qv) {
		List<SchoolVo> list = schoolService.selectList(vo);
		model.addAttribute("list", list);
		List<QuestionVo> qlist = questionService.selectyear(qv);
		model.addAttribute("qlist", qlist);
		List<QuestionVo> plist = questionService.selectsemester(qv);
		model.addAttribute("plist", plist);
		return "user/question/pool"; 
	}
	
	@RequestMapping("user/question/insert.do")
	public String insertAQ(HttpServletRequest req, QuestionVo qv, AnsweredQuestionVo av, @RequestParam int exam_no) {
		List<QuestionVo> qlist = questionService.selectQuestionlist(qv);
		System.out.println(qlist.size());
		ExamVo xo = new ExamVo();
		xo = questionService.selectExam(exam_no);
		av.setUser_no(((UserVo)req.getSession().getAttribute("userInfo")).getUser_no());
		av.setExam_no(exam_no);
		
		// 오,정답 체크 & 배열로 insert처리
		String[] answers = req.getParameterValues("example");
		int r=0;
		for(int i=0; i<qlist.size(); i++) {
			if(!("").equals(answers[i])) {
				av.setQuestion_no(qlist.get(i).getQuestion_no());
				if((qlist.get(i).getAnswer()).equals(answers[i])) {
					av.setScore(1); //정답
				} else {
					av.setScore(0); //오답
				}
				av.setUser_answer(answers[i]);
			}
			questionService.insertAQ(av);
			r++;
		}
				
		if (r > 0) {
			req.setAttribute("msg", "정상적으로 제출되었습니다.");
			req.setAttribute("url", "score.do?exam_no="+exam_no);
		} else {
			req.setAttribute("msg", "제출 오류");
		}
		return "admin/include/return";
	}
	
	@RequestMapping("/user/question/score.do")
	public String score(QuestionVo qv, ExampleVo ev, AnsweredQuestionVo av, Model model, HttpServletRequest req, @RequestParam int exam_no) {
		model.addAttribute("exam",questionService.selectExam(exam_no));
		model.addAttribute("school", schoolService.selectSchool(exam_no));
		List<QuestionVo> qlist = questionService.selectQuestionlist(qv);
		List<ExampleVo> list = questionService.selectExamplelist(ev);
	
		av.setUser_no(((UserVo)req.getSession().getAttribute("userInfo")).getUser_no());
		av.setExam_no(exam_no);
		List<AnsweredQuestionVo> alist = questionService.selectAQlist(av);

		int cnt = 0; //정답갯수
		
		for(int i=0; i<qlist.size(); i++) {
			List<ExampleVo> elist = new ArrayList<ExampleVo>();
			if(alist.get(i).getScore() == 1) { cnt++; }
			for(int j=0; j<list.size(); j++) {
				if(qlist.get(i).getQuestion_no() == list.get(j).getQuestion_no()) {
					elist.add(list.get(j));
				}
			}
			qlist.get(i).setEx(elist);
		}
		model.addAttribute("qlist", qlist);
		model.addAttribute("alist", alist);
		String[] examples = { "A", "B", "C", "D", "E" };
		model.addAttribute("ex",examples);
		model.addAttribute("cnt",cnt);
		
		return "user/question/score";
	}
	@RequestMapping("/user/question/showmetheyear.do")
	public String showmetheyear1(SchoolVo vo, Model model, QuestionVo qv) {
		model.addAttribute("cList", questionService.selectyear(qv));
		return "admin/question/year"; // 문제등록(학교/연도/회차선택창으로 이동)
	}
	@RequestMapping("/user/question/showmethesemester.do")
	public String showmethesemester1(SchoolVo vo, Model model, QuestionVo qv) {
		model.addAttribute("dList", questionService.selectsemester(qv));
		return "admin/question/semester"; // 문제등록(학교/연도/회차선택창으로 이동)
	}
	
}