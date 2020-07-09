package edu.homeEducation.serviceDao;

import java.util.List;

import edu.homeEducation.model.CourseLesson;


public interface CourseLessonServiceDao {
	
	boolean addCourcesLesson(CourseLesson coursesLesson);
	boolean updateCourceLesson(CourseLesson coursesLesson); 
	void deleteCourseLesson(CourseLesson coursesLesson);
	CourseLesson getByCourseLessonId(long courseLesson_id);
	List<CourseLesson> getAllCourcesLesson();
	List<CourseLesson> getByCourseId(long couse_id);
}
