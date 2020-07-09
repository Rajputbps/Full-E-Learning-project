package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.UserDoubtsQuestionDao;
import edu.homeEducation.model.UserDoubtsAnswerOfQuestion;
import edu.homeEducation.model.UserDoubtsQuestion;

@Transactional
@Repository
public class UserDoubtsQuestionDaoImpl implements UserDoubtsQuestionDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	
	public boolean addQuestion(UserDoubtsQuestion doubtsQuestion) { 
		sessionFactory.getCurrentSession().save(doubtsQuestion);
		return true;
	}

	@SuppressWarnings("unchecked")
	public List<UserDoubtsQuestion> getAllQustion() { 
		List<UserDoubtsQuestion> doubtsQuestions = sessionFactory.getCurrentSession().createQuery("from UserDoubtsQuestion ORDER BY localDate DESC").list();
		return doubtsQuestions;
	}

	public List<UserDoubtsQuestion> getQustionByUserID(long user_id) {
		List<UserDoubtsQuestion> doubtsQuestions = sessionFactory.getCurrentSession().createQuery("from UserDoubtsQuestion where user_id ="+user_id).list();
		return doubtsQuestions;
	}

	public List<UserDoubtsQuestion> getQustionByCourseID(long course_id) {
		List<UserDoubtsQuestion> doubtsQuestions = sessionFactory.getCurrentSession().createQuery("from UserDoubtsQuestion where course_id="+course_id).list();
		return doubtsQuestions;
	}

	public UserDoubtsQuestion getbyId(long d_id) { 
		UserDoubtsQuestion doubtsQuestion= sessionFactory.getCurrentSession().get(UserDoubtsQuestion.class, d_id);
		return doubtsQuestion;
	}
// answer
	
	public boolean addAnswerOfQuestion(UserDoubtsAnswerOfQuestion answerOfQuestion) { 
		sessionFactory.getCurrentSession().save(answerOfQuestion);
		return true;
	}

	public List<UserDoubtsAnswerOfQuestion> getByUserDoubtsQuestionId(long id) {
		List<UserDoubtsAnswerOfQuestion> answerOfQuestions = sessionFactory.getCurrentSession().createQuery("from UserDoubtsAnswerOfQuestion where user_doubt_question_id="+id +"ORDER BY localDate DESC").list();
		return answerOfQuestions;
	}

	public long countAnswer(long id) { 
		long value =  (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from UserDoubtsAnswerOfQuestion where user_doubt_question_id="+ id).uniqueResult();
		return value;
	}

}
