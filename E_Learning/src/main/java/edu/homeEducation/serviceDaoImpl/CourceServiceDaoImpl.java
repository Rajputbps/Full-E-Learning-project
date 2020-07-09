package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.CourcesDao;
import edu.homeEducation.model.Courses;
import edu.homeEducation.serviceDao.CourceServiceDao;

@Service
public class CourceServiceDaoImpl implements CourceServiceDao{

	@Autowired
	private CourcesDao courcesDao;
	
	
	public boolean addCources(Courses courses) { 
		return courcesDao.addCources(courses);
	}

	public boolean updateCource(Courses courses) { 
		return courcesDao.updateCource(courses);
	}

	public void delete(Courses courses) { 
		courcesDao.delete(courses);
	}

	public List<Courses> getAllCources() { 
		return courcesDao.getAllCources();
	}

	public Courses getByCourseId(long course_id) { 
		return courcesDao.getByCourseId(course_id);
	}

}
