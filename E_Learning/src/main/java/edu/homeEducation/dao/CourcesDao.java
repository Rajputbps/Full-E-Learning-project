package edu.homeEducation.dao;

import java.util.List;

import edu.homeEducation.model.Courses;

public interface CourcesDao {

	boolean addCources(Courses courses);
	boolean updateCource(Courses courses);
	Courses getByCourseId(long course_id);
	void delete(Courses courses);
	List<Courses> getAllCources();
}
