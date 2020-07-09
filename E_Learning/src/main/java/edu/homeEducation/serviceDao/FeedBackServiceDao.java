package edu.homeEducation.serviceDao;

import java.util.List;
 

import edu.homeEducation.model.FeedBacks;

 
public interface FeedBackServiceDao {

	boolean addFeedBack(FeedBacks feedBacks);
	boolean updateFeedBack(FeedBacks feedBacks);
	void deleteFeedBack(FeedBacks feedBacks);
	List<FeedBacks> getAllFeedback();
}
