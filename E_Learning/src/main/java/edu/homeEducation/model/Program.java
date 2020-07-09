package edu.homeEducation.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Program {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private  long program_Id;
	private String program_Name;
	private LocalDate Program_Save_Date;
	private long user_Id;
	 
	@ManyToOne(targetEntity=Users.class )
	@JoinColumn(name="user_Id",nullable=false,updatable=false,insertable=false)
	private Users users;
	
	public long getProgram_Id() {
		return program_Id;
	}
	public void setProgram_Id(long program_Id) {
		this.program_Id = program_Id;
	}
	public String getProgram_Name() {
		return program_Name;
	}
	public void setProgram_Name(String program_Name) {
		this.program_Name = program_Name;
	}
	public LocalDate getProgram_Save_Date() {
		return Program_Save_Date;
	}
	public void setProgram_Save_Date(LocalDate program_Save_Date) {
		Program_Save_Date = program_Save_Date;
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
