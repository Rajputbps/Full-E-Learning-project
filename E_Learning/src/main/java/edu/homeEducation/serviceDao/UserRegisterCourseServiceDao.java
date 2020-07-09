package edu.homeEducation.serviceDao;

import java.util.List;

import edu.homeEducation.model.UserRegisteredCourse;

public interface UserRegisterCourseServiceDao {

	boolean registerCourse(UserRegisteredCourse  registeredCourse);
	List<UserRegisteredCourse> getByUserId(long user_id);
}
