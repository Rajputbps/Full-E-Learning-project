package edu.homeEducation.dao;

import java.util.List;

import edu.homeEducation.model.FeedBacks;

public interface FeedBackDao {

	boolean addFeedBack(FeedBacks feedBacks);
	boolean updateFeedBack(FeedBacks feedBacks);
	void deleteFeedBack(FeedBacks feedBacks);
	List<FeedBacks> getAllFeedback();
}
