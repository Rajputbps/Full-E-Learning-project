package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.QuizeQuesionDao;
import edu.homeEducation.model.QuizeQuestion;

@Transactional
@Repository
public class QuizeQuesionDaoImpl implements QuizeQuesionDao{

	@Autowired
	private SessionFactory sessionFactory;
	public boolean addQuiz(QuizeQuestion quizeQuestion) {
		sessionFactory.getCurrentSession().save(quizeQuestion);
		return true;
	}
	public List<QuizeQuestion> getQuizQuestion(long lesson_id, long quiz_no) { 
		System.out.println(lesson_id+"------"+quiz_no);
		List<QuizeQuestion> quizeQuestions = sessionFactory.getCurrentSession().createQuery("from QuizeQuestion where lesson_Id="+lesson_id +"and quiz_number ="+quiz_no).list();
		return quizeQuestions;
	}

}
