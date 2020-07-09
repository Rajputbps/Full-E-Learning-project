package edu.homeEducation.daoImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import edu.homeEducation.dao.ProgramDao;
import edu.homeEducation.model.Program;

@Repository
@Transactional
public class ProgramDaoImpl implements ProgramDao{

	public boolean addProgram(Program program) {
		// TODO Auto-generated method stub
		return false;
	}

	public boolean updateProgram(Program program) {
		// TODO Auto-generated method stub
		return false;
	}

	public void deleteProgram(Program program) {
		// TODO Auto-generated method stub
		
	}

	public List<Program> getAllProgramList() {
		// TODO Auto-generated method stub
		return null;
	}

}
