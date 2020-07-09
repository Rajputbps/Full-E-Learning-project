package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.UserRegisterCourseDao;
import edu.homeEducation.model.UserRegisteredCourse;
import edu.homeEducation.serviceDao.UserRegisterCourseServiceDao;

@Service
public class UserRegisterCourseServiceDaoImpl implements UserRegisterCourseServiceDao{

	@Autowired
	private UserRegisterCourseDao userRegisterCourseDao;
	
	public boolean registerCourse(UserRegisteredCourse registeredCourse) { 
		return userRegisterCourseDao.registerCourse(registeredCourse);
	}

	public List<UserRegisteredCourse> getByUserId(long user_id) { 
		return userRegisterCourseDao.getByUserId(user_id);
	}

}
