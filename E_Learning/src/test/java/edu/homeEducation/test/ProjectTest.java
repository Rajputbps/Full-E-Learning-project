//package edu.homeEducation.test;
//
//import static org.junit.Assert.*;
//
//import java.time.LocalDate;
//import java.util.List;
//
//import org.junit.After;
//import org.junit.AfterClass;
//import org.junit.Before;
//import org.junit.BeforeClass;
//import org.junit.Ignore;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.test.context.junit.jupiter.SpringJUnitConfig;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import edu.homeEducation.config.Configurations;
//import edu.homeEducation.model.Courses;
//import edu.homeEducation.model.Notes;
//import edu.homeEducation.model.Program;
//import edu.homeEducation.model.Users;
//import edu.homeEducation.serviceDao.CourceServiceDao;
//import edu.homeEducation.serviceDao.FeedBackServiceDao;
//import edu.homeEducation.serviceDao.NotesServiceDao;
//import edu.homeEducation.serviceDao.ProgramServiceDao;
//import edu.homeEducation.serviceDao.UserServiceDao;
//
//@RunWith(SpringRunner.class)
//@SpringJUnitConfig(classes=Configurations.class)
//public class ProjectTest {
//
//	@Autowired
//	private UserServiceDao serviceDao;
//	
//	@Autowired
//	private CourceServiceDao courceServiceDao;  
//	
//	@Autowired
//	private FeedBackServiceDao feedBackServiceDao;
//	
//	@Autowired
//	private NotesServiceDao notesServiceDao;
//
//	@Autowired
//	private ProgramServiceDao programServiceDao ;
//	
//	
//	@BeforeClass
//	public static void setUpBeforeClass() throws Exception {
//	}
//
//	@AfterClass
//	public static void tearDownAfterClass() throws Exception {
//	}
//
//	@Before
//	public void setUp() throws Exception {
//	}
//
//	@After
//	public void tearDown() throws Exception {
//	}
// 
//	
//	 @Ignore
//	@Test
//	public void addUser() {
//		Users users = new  Users();
//		users.setF_name("Ram");
//		users.setL_name("Singh");
//		users.setEmail("rs@gmail.com");
//		users.setMobile_number(1234567890);
//		//users.setAge(12);
//		users.setGender("M");
//		users.setPassword("123456");
//		assertTrue("User Added",serviceDao.addUser(users));
//		
//	}
////	@Ignore
////	@Test
////	public void updateUser() {
////		Users users = new  Users();
////		users.setUser_Id(1);
////		users.setMobile_Number(12000000);
////		assertTrue("User Update",serviceDao.updateUser(users));
////	}
//	
//	
//	//cource test
//	
//@Ignore
//	@Test
//	public void add() {
//		Courses courses = new Courses();
//		courses.setCourse_Lession("While loop");
//		courses.setCourse_Link("dfsdfsdfd");
//		courses.setCourse_Name("C++");
//		assertTrue("Cource add",courceServiceDao.addCources(courses));
//	}
//	@Ignore
//	@Test
//	public void get() {
//		Courses courses = new Courses();
//		List<Courses> list = courceServiceDao.getAllCources();
//		for (Courses item: list){
//		System.out.println(item.getCourse_Id());
//		}
//		//assertTrue("Cource add",courceServiceDao.getAllCources());
//	}
//	 @Ignore
//@Test
//public void add1() {
//	Notes notes = new Notes();
//	notes.setNote_title("1-H");
//	notes.setUser_Id(1);
//	LocalDate save_Date = LocalDate.now();
//	notes.setSave_Date(save_Date);
//	assertTrue("add",notesServiceDao.addNote(notes));
//}
//	
//@Ignore
//	@Test
//	public void addProgram() {
//		Program program = new Program();
//		program.setProgram_Name("C++ Program");
//		program.setProgram_Save_Date(LocalDate.now());
//		program.setUser_Id(1);
//		assertTrue("Addeddfsdfsdfsd", programServiceDao.addProgram(program));
//	}
//}
