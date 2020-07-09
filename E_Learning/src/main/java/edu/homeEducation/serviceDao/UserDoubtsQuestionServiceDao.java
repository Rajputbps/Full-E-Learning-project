package edu.homeEducation.serviceDao;

import java.util.List;

import edu.homeEducation.model.UserDoubtsAnswerOfQuestion;
import edu.homeEducation.model.UserDoubtsQuestion;

public interface UserDoubtsQuestionServiceDao {

	boolean addQuestion(UserDoubtsQuestion doubtsQuestion);
	List<UserDoubtsQuestion> getAllQustion();
	List<UserDoubtsQuestion> getQustionByUserID(long user_id);
	List<UserDoubtsQuestion> getQustionByCourseID(long course_id);
	UserDoubtsQuestion getbyId(long d_id);
	
	//Answer methods
	
		boolean addAnswerOfQuestion(UserDoubtsAnswerOfQuestion answerOfQuestion);
		List<UserDoubtsAnswerOfQuestion> getByUserDoubtsQuestionId(long id);
		long countAnswer(long id);
}
