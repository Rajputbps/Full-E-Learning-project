package edu.homeEducation.serviceDao;

import java.util.List;
 

import edu.homeEducation.model.Courses;

 
public interface CourceServiceDao {

	boolean addCources(Courses courses);
	boolean updateCource(Courses courses);
	Courses getByCourseId(long course_id);
	void delete(Courses courses);
	List<Courses> getAllCources();
}
