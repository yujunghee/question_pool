package question;

public class QuestionVo {

	private int question_no;
	private int question_realnum;
	private Integer question_ref;
	private String passage;
	private String question_content;
	private String answer;
	private String explanation;
	private int exam_no;
	private int admin_no;

	
	private int year;
	private int number_of_questions;
	private int exam_time;
	private int semester;
	private int school_no;
	
	
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public int getSchool_no() {
		return school_no;
	}
	public void setSchool_no(int school_no) {
		this.school_no = school_no;
	}
	public int getQuestion_realnum() {
		return question_realnum;
	}
	public void setQuestion_realnum(int question_realnum) {
		this.question_realnum = question_realnum;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getNumber_of_questions() {
		return number_of_questions;
	}
	public void setNumber_of_questions(int number_of_questions) {
		this.number_of_questions = number_of_questions;
	}
	public int getExam_time() {
		return exam_time;
	}
	public void setExam_time(int exam_time) {
		this.exam_time = exam_time;
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
	public int getExam_no() {
		return exam_no;
	}
	public void setExam_no(int exam_no) {
		this.exam_no = exam_no;
	}
	public int getAdmin_no() {
		return admin_no;
	}
	public void setAdmin_no(int admin_no) {
		this.admin_no = admin_no;
	}
	
}
