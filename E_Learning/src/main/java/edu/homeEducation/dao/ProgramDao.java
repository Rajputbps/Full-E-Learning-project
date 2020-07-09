package edu.homeEducation.dao;

import java.util.List;

import edu.homeEducation.model.Program;

public interface ProgramDao {

	boolean addProgram(Program program);
	boolean updateProgram(Program program);
	void deleteProgram(Program program);
	List<Program> getAllProgramList();
}
