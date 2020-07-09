package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.UserDoubtsQuestionDao;
import edu.homeEducation.model.UserDoubtsAnswerOfQuestion;
import edu.homeEducation.model.UserDoubtsQuestion;
import edu.homeEducation.serviceDao.UserDoubtsQuestionServiceDao;

@Service
public class UserDoubtsQuestionServiceDaoImpl implements UserDoubtsQuestionServiceDao{

	@Autowired
	private UserDoubtsQuestionDao doubtsQuestionDao;
	
	public boolean addQuestion(UserDoubtsQuestion doubtsQuestion) {
		return doubtsQuestionDao.addQuestion(doubtsQuestion);
	}

	public List<UserDoubtsQuestion> getAllQustion() { 
		return doubtsQuestionDao.getAllQustion();
	}

	public List<UserDoubtsQuestion> getQustionByUserID(long user_id) { 
		return doubtsQuestionDao.getQustionByUserID(user_id);
	}

	public List<UserDoubtsQuestion> getQustionByCourseID(long course_id) { 
		return doubtsQuestionDao.getQustionByCourseID(course_id);
	}

	public UserDoubtsQuestion getbyId(long d_id) { 
		return doubtsQuestionDao.getbyId(d_id);
	}
	
//	Answer

	public boolean addAnswerOfQuestion(UserDoubtsAnswerOfQuestion answerOfQuestion) { 
		return doubtsQuestionDao.addAnswerOfQuestion(answerOfQuestion);
	}

	public List<UserDoubtsAnswerOfQuestion> getByUserDoubtsQuestionId(long id) {
		return doubtsQuestionDao.getByUserDoubtsQuestionId(id);
	}

	public long countAnswer(long id) { 
		return doubtsQuestionDao.countAnswer(id);
	}

}
