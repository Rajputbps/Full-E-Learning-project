package edu.homeEducation.model;

import java.time.LocalDate;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class UserRegisteredCourse {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long registered_id;
	private long user_id;
	private long course_id;
	private String course_Name; 
	private LocalDate registered_date;
	
	@ManyToOne(targetEntity=Users.class )
	@JoinColumn(name="user_Id",nullable=false,updatable=false,insertable=false)
	private Users users;
	
	public long getRegistered_id() {
		return registered_id;
	}
	public void setRegistered_id(long registered_id) {
		this.registered_id = registered_id;
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
	public LocalDate getRegistered_date() {
		return registered_date;
	}
	public void setRegistered_date(LocalDate registered_date) {
		this.registered_date = registered_date;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	public String getCourse_Name() {
		return course_Name;
	}
	public void setCourse_Name(String course_Name) {
		this.course_Name = course_Name;
	}
	
	
}
