package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.NotesDao;
import edu.homeEducation.model.Notes;

@Repository
@Transactional
public class NotesDaoImpl implements NotesDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	public boolean addNote(Notes notes) {
		sessionFactory.getCurrentSession().save(notes);
		return true;
	}

	public boolean updateNote(Notes notes) { 
		sessionFactory.getCurrentSession().saveOrUpdate(notes);
		return true;
	}

	public void deleteNote(Notes notes) {
		sessionFactory.getCurrentSession().delete(notes);
		
	}

	@SuppressWarnings("unchecked")
	public List<Notes> getAllNotes() {
		List<Notes> list = sessionFactory.getCurrentSession().createQuery("from Notes").list();
		return list;
	}

	public Notes getById(int id) {
		 Notes notes = (Notes) sessionFactory.getCurrentSession().createQuery("from Notes where note_id ="+id).uniqueResult();
		return notes;
	}


	@SuppressWarnings("unchecked")
	public List<Notes> getByUserId(Long id) {
		List<Notes> notes = sessionFactory.getCurrentSession().createQuery("from Notes where user_id="+id).list();
		return notes;
	}

}
