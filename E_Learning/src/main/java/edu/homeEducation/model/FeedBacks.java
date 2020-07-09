package edu.homeEducation.model;

import java.time.LocalDate;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class FeedBacks {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long feedBack_Id;
	private String message; 
	private String sender_name;
	private String sender_email;
	private String mobile_number;
	private LocalDate message_Date; 
	public long getFeedBack_Id() {
		return feedBack_Id;
	}
	public void setFeedBack_Id(long feedBack_Id) {
		this.feedBack_Id = feedBack_Id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	 
	public String getSender_name() {
		return sender_name;
	}
	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}
	 
	public String getSender_email() {
		return sender_email;
	}
	public void setSender_email(String sender_email) {
		this.sender_email = sender_email;
	}
	public String getMobile_number() { 
		return mobile_number;
	}
	public void setMobile_number(String mobile_number) {
		this.mobile_number = mobile_number;
	}
	public LocalDate getMessage_Date() {
		return message_Date;
	}
	public void setMessage_Date(LocalDate message_Date) {
		this.message_Date = message_Date;
	}
	 
	
	
}
