package edu.homeEducation.dao;

import java.util.List;

import edu.homeEducation.model.QuizeQuestion;

public interface QuizeQuesionDao {

	boolean addQuiz(QuizeQuestion quizeQuestion);
	List<QuizeQuestion> getQuizQuestion(long lesson_id,long quiz_no);
}
