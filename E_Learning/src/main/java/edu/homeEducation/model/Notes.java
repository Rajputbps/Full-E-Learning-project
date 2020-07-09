package edu.homeEducation.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Notes {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long note_Id;
	private String note_title;
	private LocalDate save_Date;
	private long user_Id;
	
	@ManyToOne(targetEntity=Users.class )
	@JoinColumn(name="user_Id",nullable=false,updatable=false,insertable=false)
	private Users users;
	
	public long getNote_Id() {
		return note_Id;
	}
	public void setNote_Id(long note_Id) {
		this.note_Id = note_Id;
	}
	public String getNote_title() {
		return note_title;
	}
	public void setNote_title(String note_title) {
		this.note_title = note_title;
	}
	public LocalDate getSave_Date() {
		return save_Date;
	}
	public void setSave_Date(LocalDate save_Date) {
		this.save_Date = save_Date;
	}
	public long getUser_Id() {
		return user_Id;
	}
	public void setUser_Id(long user_Id) {
		this.user_Id = user_Id;
	}
	public Users getUsers() {
		return users;
	}
	public void setUsers(Users users) {
		this.users = users;
	}
	
	
	
	 
	
	
	
}
