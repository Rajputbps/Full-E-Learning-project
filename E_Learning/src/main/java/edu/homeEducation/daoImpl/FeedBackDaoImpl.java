package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.FeedBackDao;
import edu.homeEducation.model.FeedBacks;

@Repository
@Transactional
public class FeedBackDaoImpl implements FeedBackDao{

	@Autowired
	private SessionFactory sessionFactory;

	public boolean addFeedBack(FeedBacks feedBacks) {
		sessionFactory.getCurrentSession().save(feedBacks);
		return true;
	}

	public boolean updateFeedBack(FeedBacks feedBacks) {
		// TODO Auto-generated method stub
		return false;
	}

	public void deleteFeedBack(FeedBacks feedBacks) {
		sessionFactory.getCurrentSession().delete(feedBacks);
		
	}

	public List<FeedBacks> getAllFeedback() { 
		 List<FeedBacks> feedBacks = sessionFactory.getCurrentSession().createQuery("from FeedBacks").list();
		return feedBacks;
	}

}
