package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.CourseLessonDao;
import edu.homeEducation.model.CourseLesson;
import edu.homeEducation.serviceDao.CourseLessonServiceDao; 

@Service
public class CourseLessonServiceDaoImpl implements CourseLessonServiceDao{
	
	@Autowired
	private CourseLessonDao courseLessionDao;

 

	public List<CourseLesson> getByCourseId(long couse_id) { 
		return courseLessionDao.getByCourseId(couse_id);
	}



	public boolean addCourcesLesson(CourseLesson coursesLesson) { 
		return courseLessionDao.addCourcesLesson(coursesLesson);
	}



	public boolean updateCourceLesson(CourseLesson coursesLesson) { 
		return courseLessionDao.updateCourceLesson(coursesLesson);
	}



	public void deleteCourseLesson(CourseLesson coursesLesson) {
		courseLessionDao.deleteCourseLesson(coursesLesson);
		
	}



	public CourseLesson getByCourseLessonId(long courseLesson_id) { 
		return courseLessionDao.getByCourseLessonId(courseLesson_id);
	}



	public List<CourseLesson> getAllCourcesLesson() { 
		return courseLessionDao.getAllCourcesLesson();
	}

	 

	
}
