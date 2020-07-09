package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.QuizDao;
import edu.homeEducation.model.Quiz;

@Repository
@Transactional
public class QuizDaoImpl implements QuizDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public boolean addQuiz(Quiz quiz) {
		sessionFactory.getCurrentSession().save(quiz);
		return true;
	}

	public boolean updateQuiz(Quiz quiz) {
		sessionFactory.getCurrentSession().update(quiz);
		return true;
	}

	public void deleteQuiz(Quiz quiz) {
		sessionFactory.getCurrentSession().delete(quiz);
		
	}

	public List<Quiz> getAllQuiz() {
		// TODO Auto-generated method stub
		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Quiz> getAllQuizzesByUserId(long user_id) { 
		List<Quiz> quizs = sessionFactory.getCurrentSession().createQuery("from Quiz where user_Id ="+user_id).list();
		return quizs;
	}

	public long countGivenQuiz(long user_id,long courseLesson_id) { 
		long count =  (Long) sessionFactory.getCurrentSession().createQuery("select count(*) from Quiz  where user_Id ="+ user_id + "AND lesson_Id ="+courseLesson_id).uniqueResult();
		return count;
	}

}
