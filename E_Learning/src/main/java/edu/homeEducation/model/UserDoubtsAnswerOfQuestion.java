package edu.homeEducation.model;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserDoubtsAnswerOfQuestion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long questionAnswer_id;
	@Column(length = 1000)
	private String answer;
	private long user_id;
	private String user_name;
	private LocalDate localDate;
	private long user_doubt_question_id;
	
	@ManyToOne(targetEntity=UserDoubtsQuestion.class )
	@JoinColumn(name="user_doubt_question_id",nullable=false,updatable=false,insertable=false)
	private UserDoubtsQuestion userDoubtsQuestion ;
	
	@ManyToOne(targetEntity=Users.class )
	@JoinColumn(name="user_Id",nullable=false,updatable=false,insertable=false)
	private Users users;

	public long getQuestionAnswer_id() {
		return questionAnswer_id;
	}

	public void setQuestionAnswer_id(long questionAnswer_id) {
		this.questionAnswer_id = questionAnswer_id;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public LocalDate getLocalDate() {
		return localDate;
	}

	public void setLocalDate(LocalDate localDate) {
		this.localDate = localDate;
	}

	public long getUser_doubt_question_id() {
		return user_doubt_question_id;
	}

	public void setUser_doubt_question_id(long user_doubt_question_id) {
		this.user_doubt_question_id = user_doubt_question_id;
	}

	public UserDoubtsQuestion getUserDoubtsQuestion() {
		return userDoubtsQuestion;
	}

	public void setUserDoubtsQuestion(UserDoubtsQuestion userDoubtsQuestion) {
		this.userDoubtsQuestion = userDoubtsQuestion;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	
	
}
