package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.UserRegisterCourseDao;
import edu.homeEducation.model.UserRegisteredCourse;

@Repository
@Transactional
public class UserRegisterCourseDaoImpl implements UserRegisterCourseDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public boolean registerCourse(UserRegisteredCourse registeredCourse) {
		 sessionFactory.getCurrentSession().save(registeredCourse);
		return  true;
	}

	@SuppressWarnings("unchecked")
	public List<UserRegisteredCourse> getByUserId(long user_id) { 
		List<UserRegisteredCourse> courses = sessionFactory.getCurrentSession().createQuery("from UserRegisteredCourse where user_id="+user_id).list();
		return courses;
	}

}
