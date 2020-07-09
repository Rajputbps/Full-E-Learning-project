package edu.homeEducation.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.homeEducation.model.CourseLesson;
import edu.homeEducation.model.Courses;
import edu.homeEducation.model.FeedBacks;
import edu.homeEducation.model.Notes;
import edu.homeEducation.model.Quiz;
import edu.homeEducation.model.QuizeQuestion;
import edu.homeEducation.model.Users;
import edu.homeEducation.serviceDao.CourceServiceDao;  
import edu.homeEducation.serviceDao.CourseLessonServiceDao;
import edu.homeEducation.serviceDao.FeedBackServiceDao;
import edu.homeEducation.serviceDao.NotesServiceDao;
import edu.homeEducation.serviceDao.UserRegisterCourseServiceDao;
import edu.homeEducation.serviceDao.UserServiceDao;

@Controller
public class MainController {
	
	@Autowired
	private CourceServiceDao courceServiceDao; 
	
	@Autowired
	private UserServiceDao userServiceDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder ; 
	
	@Autowired
	private CourseLessonServiceDao courseLessionServiceDao;
	@Autowired
	private NotesServiceDao notesServiceDao ;
	
	@Autowired
	private FeedBackServiceDao feedBackServiceDao; 
	 

	@RequestMapping("/")
	public String index(Model model) {
		
		return "home";
	}
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping("/feedback")
	public String ff(Model model) {
		model.addAttribute("feedBack", new FeedBacks());
		return"feedback";
	}
	
	@RequestMapping("/courceDetail{course_id}")
	public String openBook(@PathVariable("course_id") Long id, Model model) {
		model.addAttribute("courseContent", courceServiceDao.getByCourseId(id)); 
		model.addAttribute("courseLession", courseLessionServiceDao.getByCourseId(id));
		
		return "openBook";
	} 
	@RequestMapping("/loginUser")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/signUpUser")
	public String signUp() {
		return "signUp";
	}
	@RequestMapping("/loginsuccess")
	public @ResponseBody String loginSuccess() {
		System.out.println("sssssssssssssssssssssssssssssss");
		return "home";
	}
	
	@RequestMapping("/UserLogin")
	public @ResponseBody String loginError() {  
		System.out.println("fffffffffffffffffffffffffffff");
		return "f";
	}
	
	@RequestMapping("/addcourse")
	public String admin() {
		return "admin";
	}
	
	@PostMapping("/registerUser")
	public @ResponseBody String registerForm(@ModelAttribute(name = "users") Users users,BindingResult result) {
		String message="";
		if (result.hasErrors()) {
			message="Registration Faild!!!!!!";
		}
		else if(userServiceDao.existByEmail(users.getEmail())) {
			message= "Email all Ready Exist!!";
		}
		else { 
			users.setPassword(passwordEncoder.encode(users.getPassword()));
			users.setRole_id(1); 
			if (userServiceDao.addUser(users)) {
				message ="Registration SuccessFull!!!!!!";	
			}
			message= "Registration Faild!!!!!!";
		}
		
		return message;
	}
	
	@RequestMapping("/perform_logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/";
		
	}
	
	@RequestMapping("/pp{user_id}")
	public Notes u(@PathVariable(name = "user_id") long user_id) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		Users users = userServiceDao.getByEmail(auth.getName());
		return (Notes) notesServiceDao.getByUserId(users.getUser_id());
		
	} 
	
	@PostMapping("/saveNote")
	public @ResponseBody String addFile(@ModelAttribute(name = "notePad")Notes notes,HttpServletRequest request) {
		try {
			String note_Title;
			LocalDate date = LocalDate.now();
			String data = request.getParameter("file");
			String noteName=notes.getNote_title();
			System.out.println("-------------------"+noteName);
			String notePath= "/home/rajput/College_Project/E_Learing_Final/src/main/webapp/resources/notes/";
			if(notes.getNote_Id() == 0L) {
				System.out.println("id null--------------------------------->");
				if(!noteName.isEmpty()) {
					System.out.println(notePath+noteName);
					FileOutputStream out = new FileOutputStream(notePath+noteName);
					out.write(data.getBytes());
					out.close();
					note_Title=noteName;
				}else {
					System.out.println("save");
					LocalTime time = LocalTime.now();
					note_Title="Note-"+date.toString()+"-"+time;
					FileOutputStream out = new FileOutputStream(notePath+ note_Title);
					out.write(data.getBytes());
					out.close();  
				} 
				
				notes.setNote_title(note_Title);
				notes.setSave_Date(date);
				notes.setUser_Id(notes.getUser_Id());
				notesServiceDao.addNote(notes); 
				System.out.println("Note saveed");
			}
		else {
			System.out.println("save"); 
			FileOutputStream out = new FileOutputStream(notePath+ noteName);
			out.write(data.getBytes());
			out.close();   
		
		notes.setNote_title(noteName); 
		notes.setSave_Date(date);
		notes.setUser_Id(notes.getUser_Id());
		notesServiceDao.updateNote(notes); 
		}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		return "home";
	}
	
	
	@RequestMapping("/readNotes")
	public @ResponseBody List<String> readNote(Model model,HttpServletRequest request) {
		Notes notes = notesServiceDao.getById(Integer.parseInt(request.getParameter("noteIdData")));
		List<String> list = new ArrayList<String>();
		try {
			String notePath= "/home/rajput/College_Project/E_Learing_Final/src/main/webapp/resources/notes/";
			 
			File file = new File(notePath+notes.getNote_title());
			FileReader fr = new FileReader(file);
			BufferedReader in = new BufferedReader(fr);
			String str = null;
			list.add(0, notes.getNote_title());
			while((str = in.readLine()) != null){
			    list.add(str); 
			    System.out.println(str);
			} 
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	}
	
	
	@PostMapping("/giveFeedback")
	public @ResponseBody String giveFeedbackOfUser(@ModelAttribute(name = "") FeedBacks feedBacks,BindingResult result) {
		if (result.hasErrors()) {
			return "home";
		}
		else {
			feedBacks.setMessage_Date(LocalDate.now());
			feedBackServiceDao.addFeedBack(feedBacks);
		}
		return "Thank you for the FeedBack!!!";
	}
	
	
	@RequestMapping("/test")
	public String tt() {
		 
//		List<String> list = new ArrayList<String>();
//		 try { 
//			  
//			 BufferedReader in = new BufferedReader(new FileReader("/home/rajput/College_Project/E_Learing_Final/src/main/webapp/resources/courses/C/DataTypes,Variables & Constants"));
//	 System.out.println("nnnnnnnnnnnnnn");
//			String str = null;
//			 
//			while((str = in.readLine()) != null){
//			    list.add(str);  
//			}
//			 
//		} catch (Exception e) {
//			System.out.println("eeeeeeeeeeeeeeee"+e);
//		}
		return "text";
	}
	@GetMapping("/read")
	public @ResponseBody List<String> rrr() {
		List<String> list = new ArrayList<String>();
		 try { 
			  
			 BufferedReader in = new BufferedReader(new FileReader("/home/rajput/College_Project/E_Learing_Final/src/main/webapp/resources/courses/C/DataTypes,Variables & Constants"));
	 System.out.println("nnnnnnnnnnnnnn");
			String str = null;
			 
			while((str = in.readLine()) != null){
			    list.add(str);  
			}
			 
		} catch (Exception e) {
			System.out.println("eeeeeeeeeeeeeeee"+e);
		}
		return list;
	}
	
	@GetMapping("/reada")
	public @ResponseBody List<String> rrrr() {
		List<String> list = new ArrayList<String>();
		 try { 
			  
			 BufferedReader in = new BufferedReader(new FileReader("/home/rajput/College_Project/E_Learing_Final/src/main/webapp/resources/courses/C/Fundamentals of C"));
	 System.out.println("nnnnnnnnnnnnnn");
			String str = null;
			 
			while((str = in.readLine()) != null){
			    list.add(str);  
			}
			 
		} catch (Exception e) {
			System.out.println("eeeeeeeeeeeeeeee"+e);
		}
		return list;
	}
	
	 
	@RequestMapping("/readLessonContentFromFile")
	public @ResponseBody List<String> courseLessionsss( HttpServletRequest request, Model model) {  
		System.out.println(request.getParameter("lessonIdData"));
		 long courseLession_id = Long.parseLong(request.getParameter("lessonIdData"));
		CourseLesson courseLession = courseLessionServiceDao.getByCourseLessonId(courseLession_id);
		Courses courses = courceServiceDao.getByCourseId(courseLession.getCourse_id()); 
		List<String> list = new ArrayList<String>();
		try {
			String notePath= "/home/rajput/College_Project/E_Learing_Final/src/main/webapp/resources/courses/"; 
			String content = "";
			content = new String ( Files.readAllBytes( Paths.get(notePath+courses.getCourse_Name()+"/"+courseLession.getLesson_name()) ) );
			list.add(content);
			list.add("<a href="+courseLession.getYoutube_link() +" target=\"_blank\"><img src=\"resources/images/youtube-icon.png\" class=\"utubeIcon\"/></a><br><br>");
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return list;
	} 
	
	@RequestMapping("/passwordReset{token}")
	public String passwordReset(@PathVariable(name = "token") String token,Model model) {
		System.out.println(token);
		System.out.println("Password reset request");
		model.addAttribute("token", token);
		return "forgetPassword";
	}

}
