package edu.homeEducation.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id; 

@Entity
public class CourseLesson {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long lesson_id;
	private int lesson_no;
	private String lesson_name;
	private String lesson_content; 
	private String youtube_link;
	private  long course_id;
	
	
	
	public long getLesson_id() {
		return lesson_id;
	}
	public void setLesson_id(long lesson_id) {
		this.lesson_id = lesson_id;
	}
	public String getLesson_name() {
		return lesson_name;
	}
	public void setLesson_name(String lesson_name) {
		this.lesson_name = lesson_name;
	}
	public String getLesson_content() {
		return lesson_content;
	}
	public void setLesson_content(String lesson_content) {
		this.lesson_content = lesson_content;
	}
	public long getCourse_id() {
		return course_id;
	}
	public void setCourse_id(long course_id) {
		this.course_id = course_id;
	}
	public int getLesson_no() {
		return lesson_no;
	}
	public void setLesson_no(int lesson_no) {
		this.lesson_no = lesson_no;
	}
	 
	public String getYoutube_link() {
		return youtube_link;
	}
	public void setYoutube_link(String youtube_link) {
		this.youtube_link = youtube_link;
	}
	
	

}
