package edu.homeEducation.serviceDao;

import java.util.List;
 
import edu.homeEducation.model.Quiz;
 
public interface QuizServiceDao {

	boolean addQuiz(Quiz quiz);
	boolean updateQuiz(Quiz quiz);
	void deleteQuiz(Quiz quiz);
	List<Quiz> getAllQuiz();
	List<Quiz> getAllQuizzesByUserId(long user_id);
	long countGivenQuiz(long user_id,long courseLesson_id);
}
