package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.QuizeQuesionDao;
import edu.homeEducation.model.QuizeQuestion;
import edu.homeEducation.serviceDao.QuizeQuesionServiceDao;

@Service
public class QuizeQuesionServiceDaoImpl implements QuizeQuesionServiceDao{

	@Autowired
	private QuizeQuesionDao quizeQuesionDao;
	
	public boolean addQuiz(QuizeQuestion quizeQuestion) {
		return quizeQuesionDao.addQuiz(quizeQuestion);
	}

	public List<QuizeQuestion> getQuizQuestion(long lesson_id, long quiz_no) { 
		return quizeQuesionDao.getQuizQuestion( lesson_id, quiz_no);
	}

}
