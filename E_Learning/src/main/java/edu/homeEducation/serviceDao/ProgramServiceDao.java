package edu.homeEducation.serviceDao;

import java.util.List;

import edu.homeEducation.model.Program;

public interface ProgramServiceDao {

	boolean addProgram(Program program);
	boolean updateProgram(Program program);
	void deleteProgram(Program program);
	List<Program> getAllProgramList();
}
