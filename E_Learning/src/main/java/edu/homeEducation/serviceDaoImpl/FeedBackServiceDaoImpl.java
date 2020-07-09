package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.FeedBackDao;
import edu.homeEducation.model.FeedBacks;
import edu.homeEducation.serviceDao.FeedBackServiceDao;


@Service
public class FeedBackServiceDaoImpl implements FeedBackServiceDao{

	@Autowired
	private  FeedBackDao feedBackDao;
	
	
	public boolean addFeedBack(FeedBacks feedBacks) { 
		return feedBackDao.addFeedBack(feedBacks);
	}

	public boolean updateFeedBack(FeedBacks feedBacks) { 
		return feedBackDao.updateFeedBack(feedBacks);
	}

	public void deleteFeedBack(FeedBacks feedBacks) {
		 feedBackDao.deleteFeedBack(feedBacks);
		
	}

	public List<FeedBacks> getAllFeedback() { 
		return feedBackDao.getAllFeedback();
	}

}
