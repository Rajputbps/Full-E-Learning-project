package edu.homeEducation.serviceDao;

import java.util.List;

import edu.homeEducation.model.Notes;

public interface NotesServiceDao {

	boolean addNote(Notes notes);
	boolean updateNote(Notes notes);
	void deleteNote(Notes notes);
	List<Notes> getAllNotes();
	Notes getById(int id);
	List<Notes> getByUserId(Long id);
	
}
