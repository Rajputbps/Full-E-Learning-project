package edu.homeEducation.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserDoubtsQuestion {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long user_doubt_question_id;
	private String doubtsQuestion;
	private String description;
	private LocalDate localDate;
	private long user_id;
	private long course_id;
	
	@ManyToOne(targetEntity=Users.class )
	@JoinColumn(name="user_Id",nullable=false,updatable=false,insertable=false)
	private Users users;
	
	@ManyToOne(targetEntity = Courses.class)
	@JoinColumn(name="course_id",nullable=false,updatable=false,insertable=false)
	private Courses courses;

	 

	public long getUser_doubt_question_id() {
		return user_doubt_question_id;
	}

	public void setUser_doubt_question_id(long user_doubt_question_id) {
		this.user_doubt_question_id = user_doubt_question_id;
	}

	public String getDoubtsQuestion() {
		return doubtsQuestion;
	}

	public void setDoubtsQuestion(String doubtsQuestion) {
		this.doubtsQuestion = doubtsQuestion;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public LocalDate getLocalDate() {
		return localDate;
	}

	public void setLocalDate(LocalDate localDate) {
		this.localDate = localDate;
	}

	public long getUser_id() {
		return user_id;
	}

	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}

	public long getCourse_id() {
		return course_id;
	}

	public void setCourse_id(long course_id) {
		this.course_id = course_id;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public Courses getCourses() {
		return courses;
	}

	public void setCourses(Courses courses) {
		this.courses = courses;
	}
	
	
}
