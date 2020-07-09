package edu.homeEducation.serviceDao;

import java.util.List;

import edu.homeEducation.model.QuizeQuestion;

public interface QuizeQuesionServiceDao {

	boolean addQuiz(QuizeQuestion quizeQuestion);
	List<QuizeQuestion> getQuizQuestion(long lesson_id,long quiz_no);
}
