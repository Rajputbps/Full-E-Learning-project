package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.NotesDao;
import edu.homeEducation.model.Notes;
import edu.homeEducation.serviceDao.NotesServiceDao;

@Service
public class NoteServiceDaoImpl implements NotesServiceDao{

	
	@Autowired
	private NotesDao notesDao;

	public boolean addNote(Notes notes) { 
		return notesDao.addNote(notes);
	}

	public boolean updateNote(Notes notes) { 
		return notesDao.updateNote(notes);
	}

	public void deleteNote(Notes notes) {
		 notesDao.deleteNote(notes);
		
	}

	public List<Notes> getAllNotes() { 
		return notesDao.getAllNotes();
	}

	public Notes getById(int id) { 
		return notesDao.getById(id);
	}

	public List<Notes> getByUserId(Long id) { 
		return notesDao.getByUserId(id);
	}


}
