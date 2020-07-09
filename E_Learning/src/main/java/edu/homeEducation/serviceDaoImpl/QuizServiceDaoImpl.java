package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.QuizDao;
import edu.homeEducation.model.Quiz;
import edu.homeEducation.serviceDao.QuizServiceDao;

@Service
public class QuizServiceDaoImpl implements QuizServiceDao {

	@Autowired
	private QuizDao quizDao;

	public boolean addQuiz(Quiz quiz) { 
		return quizDao.addQuiz(quiz);
	}

	public boolean updateQuiz(Quiz quiz) { 
		return quizDao.updateQuiz(quiz);
	}

	public void deleteQuiz(Quiz quiz) {
		 quizDao.deleteQuiz(quiz);
		
	}

	public List<Quiz> getAllQuiz() { 
		return quizDao.getAllQuiz();
	}

	public List<Quiz> getAllQuizzesByUserId(long user_id) { 
		return quizDao.getAllQuizzesByUserId(user_id);
	}

	public long countGivenQuiz(long user_id,long courseLesson_id) { 
		return quizDao.countGivenQuiz(user_id,courseLesson_id);
	}
	
}
