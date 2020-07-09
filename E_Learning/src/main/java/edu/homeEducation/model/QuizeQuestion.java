package edu.homeEducation.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
public class QuizeQuestion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long question_id;
	private int quiz_number;
	@Column(length = 5000)
	private String question;
	@Column(length = 1000)
	private String answer_1;
	@Column(length = 1000)
	private String answer_2;
	@Column(length = 1000)
	private String answer_3;
	@Column(length = 1000)
	private String answer_4;
	@Column(length = 1000)
	private String right_answer;
	@Transient
	private String user_answer;
	private long lesson_Id;
	@ManyToOne(targetEntity=CourseLesson.class )
	@JoinColumn(name="lesson_Id",nullable=false,updatable=false,insertable=false)
	private CourseLesson courseLesson;
	public long getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(long question_id) {
		this.question_id = question_id;
	}
	public int getQuiz_number() {
		return quiz_number;
	}
	public void setQuiz_number(int quiz_number) {
		this.quiz_number = quiz_number;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswer_1() {
		return answer_1;
	}
	public void setAnswer_1(String answer_1) {
		this.answer_1 = answer_1;
	}
	public String getAnswer_2() {
		return answer_2;
	}
	public void setAnswer_2(String answer_2) {
		this.answer_2 = answer_2;
	}
	public String getAnswer_3() {
		return answer_3;
	}
	public void setAnswer_3(String answer_3) {
		this.answer_3 = answer_3;
	}
	public String getAnswer_4() {
		return answer_4;
	}
	public void setAnswer_4(String answer_4) {
		this.answer_4 = answer_4;
	}
	public String getRight_answer() {
		return right_answer;
	}
	public void setRight_answer(String right_answer) {
		this.right_answer = right_answer;
	}
	public String getUser_answer() {
		return user_answer;
	}
	public void setUser_answer(String user_answer) {
		this.user_answer = user_answer;
	}
	public long getLesson_Id() {
		return lesson_Id;
	}
	public void setLesson_Id(long lesson_Id) {
		this.lesson_Id = lesson_Id;
	}
	public CourseLesson getCourseLesson() {
		return courseLesson;
	}
	public void setCourseLesson(CourseLesson courseLesson) {
		this.courseLesson = courseLesson;
	}

 
	
	
}
