package edu.homeEducation.dao;

import java.util.List;

import edu.homeEducation.model.Notes;

public interface NotesDao {

	boolean addNote(Notes notes);
	boolean updateNote(Notes notes);
	void deleteNote(Notes notes);
	List<Notes> getAllNotes();
	Notes getById(int id);
	List<Notes> getByUserId(Long id);
}
