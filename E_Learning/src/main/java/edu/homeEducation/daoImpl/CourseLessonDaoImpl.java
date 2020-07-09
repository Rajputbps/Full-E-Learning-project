package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.CourseLessonDao;
import edu.homeEducation.model.CourseLesson;
 

@Repository
@Transactional
public class CourseLessonDaoImpl implements CourseLessonDao{
	
	@Autowired
	private SessionFactory sessionFactory;
 
	@SuppressWarnings("unchecked")
	public List<CourseLesson> getByCourseId(long couse_id) { 
		List<CourseLesson> courseLessons = sessionFactory.getCurrentSession().createQuery("from CourseLesson where course_Id="+couse_id).list();
		return courseLessons;
	}

	public List<CourseLesson> getAllCourcesLesson() {
		List<CourseLesson> courseLessons = sessionFactory.getCurrentSession().createQuery("from CourseLesson").list();
		return courseLessons;
	}

	public CourseLesson getByCourseLessonId(long courseLesson_id) { 
		CourseLesson courseLession = sessionFactory.getCurrentSession().get(CourseLesson.class, courseLesson_id);
		return courseLession;
	}

	public boolean addCourcesLesson(CourseLesson coursesLesson) {
		sessionFactory.getCurrentSession().save(coursesLesson);
		return true;
	}

	public boolean updateCourceLesson(CourseLesson coursesLesson) {
		sessionFactory.getCurrentSession().update(coursesLesson);
		return true;
	}

	public void deleteCourseLesson(CourseLesson coursesLesson) {
		sessionFactory.getCurrentSession().delete(coursesLesson);
		
	}
	 

}
