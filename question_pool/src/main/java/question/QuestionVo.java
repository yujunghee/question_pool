package question;

import java.util.List;

public class QuestionVo extends ExamVo{

	private int question_no;
	private Integer question_ref;
	private String passage;
	private String question_content;
	private String answer;
	private String explanation;
	private int admin_no;
	private List<ExampleVo> ex;
	private List<QuestionVo> qv;
	
	public List<QuestionVo> getQv() {
		return qv;
	}
	public void setQv(List<QuestionVo> qv) {
		this.qv = qv;
	}
	public List<ExampleVo> getEx() {
		return ex;
	}
	public void setEx(List<ExampleVo> ex) {
		this.ex = ex;
	}
	
	public int getQuestion_no() {
		return question_no;
	}
	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}
	public Integer getQuestion_ref() {
		return question_ref;
	}
	public void setQuestion_ref(Integer question_ref) {
		this.question_ref = question_ref;
	}
	public String getPassage() {
		return passage;
	}
	public void setPassage(String passage) {
		this.passage = passage;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getExplanation() {
		return explanation;
	}
	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	
}
