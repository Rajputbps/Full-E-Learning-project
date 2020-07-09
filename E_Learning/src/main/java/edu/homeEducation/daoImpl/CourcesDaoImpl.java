package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.CourcesDao;
import edu.homeEducation.model.Courses;


@Repository
@Transactional
public class CourcesDaoImpl implements CourcesDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public boolean addCources(Courses courses) { 
		sessionFactory.getCurrentSession().save(courses);
		return  true;
	}

	public boolean updateCource(Courses courses) { 
		sessionFactory.getCurrentSession().saveOrUpdate(courses);
		return true;
	}

	public void delete(Courses courses) { 
		sessionFactory.getCurrentSession().delete(courses);
	}

	@SuppressWarnings("unchecked")
	public List<Courses> getAllCources() { 
		return sessionFactory.getCurrentSession().createQuery("from Courses").list();
	}

	public Courses getByCourseId(long course_id) { 
		Courses courses = sessionFactory.getCurrentSession().get(Courses.class, course_id);
		return courses;
	}

}
