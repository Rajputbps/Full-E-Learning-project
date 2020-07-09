package edu.homeEducation.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Quiz {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long quiz_id;
	private String quiz_Name;
	private long user_Id;
	private long course_Id;
	private String lesson_name;
	private int quiz_Marks;
	private LocalDate quize_given_date;
	private long lesson_Id;
	
	
	@ManyToOne(targetEntity=Users.class )
	@JoinColumn(name="user_Id",nullable=false,updatable=false,insertable=false)
	private Users users;
	
	@ManyToOne(targetEntity=CourseLesson.class )
	@JoinColumn(name="lesson_Id",nullable=false,updatable=false,insertable=false)
	private CourseLesson courseLesson;

	public long getQuiz_id() {
		return quiz_id;
	}

	public void setQuiz_id(long quiz_id) {
		this.quiz_id = quiz_id;
	}

	public String getQuiz_Name() {
		return quiz_Name;
	}

	public void setQuiz_Name(String quiz_Name) {
		this.quiz_Name = quiz_Name;
	}

	public long getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(long user_Id) {
		this.user_Id = user_Id;
	}

	public long getCourse_Id() {
		return course_Id;
	}

	public void setCourse_Id(long course_Id) {
		this.course_Id = course_Id;
	}


	public int getQuiz_Marks() {
		return quiz_Marks;
	}

	public void setQuiz_Marks(int quiz_Marks) {
		this.quiz_Marks = quiz_Marks;
	}

	public Users getUsers() {
		return users;
	}

	public void setUsers(Users users) {
		this.users = users;
	}

	public String getLesson_name() {
		return lesson_name;
	}

	public void setLesson_name(String lesson_name) {
		this.lesson_name = lesson_name;
	}

	public LocalDate getQuize_given_date() {
		return quize_given_date;
	}

	public void setQuize_given_date(LocalDate quize_given_date) {
		this.quize_given_date = quize_given_date;
	}

	 

	public CourseLesson getCourseLesson() {
		return courseLesson;
	}

	public void setCourseLesson(CourseLesson courseLession) {
		this.courseLesson = courseLession;
	}

	public long getLesson_Id() {
		return lesson_Id;
	}

	public void setLesson_Id(long lesson_Id) {
		this.lesson_Id = lesson_Id;
	}

 
	
	
	 
	
	
	
}
