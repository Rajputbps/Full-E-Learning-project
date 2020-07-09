package edu.homeEducation.model;

 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile; 

@Entity
public class Courses {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long course_Id;
	private String course_Name;  
	private String course_image;
	@Column(length = 2000)
	private String course_description; 
	private String books_and_references;
	@Transient
	private MultipartFile image;
	
	 
	public long getCourse_Id() {
		return course_Id;
	}
	public void setCourse_Id(long course_Id) {
		this.course_Id = course_Id;
	}
	public String getCourse_Name() {
		return course_Name;
	}
	public void setCourse_Name(String course_Name) {
		this.course_Name = course_Name;
	}
	public String getCourse_image() {
		return course_image;
	}
	public void setCourse_image(String course_image) {
		this.course_image = course_image;
	}
	public String getCourse_description() {
		return course_description;
	}
	public void setCourse_description(String course_description) {
		this.course_description = course_description;
	}
	public String getBooks_and_references() {
		return books_and_references;
	}
	public void setBooks_and_references(String books_and_references) {
		this.books_and_references = books_and_references;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
	
	
	
}
