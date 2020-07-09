package edu.homeEducation.serviceDaoImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.homeEducation.dao.ProgramDao;
import edu.homeEducation.model.Program;
import edu.homeEducation.serviceDao.ProgramServiceDao;

@Service
public class ProgramServiceDaoImpl implements ProgramServiceDao{

	@Autowired
	private ProgramDao programDao;

	public boolean addProgram(Program program) { 
		return programDao.addProgram(program);
	}

	public boolean updateProgram(Program program) { 
		return programDao.updateProgram(program);
	}

	public void deleteProgram(Program program) {
		 programDao.deleteProgram(program);
		
	}

	public List<Program> getAllProgramList() { 
		return programDao.getAllProgramList();
	}


}
