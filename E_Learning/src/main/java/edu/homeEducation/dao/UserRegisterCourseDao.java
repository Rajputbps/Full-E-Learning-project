package edu.homeEducation.dao;

import java.util.List;

import edu.homeEducation.model.UserRegisteredCourse;

public interface UserRegisterCourseDao {

	boolean registerCourse(UserRegisteredCourse  registeredCourse);
	List<UserRegisteredCourse> getByUserId(long user_id);
}
