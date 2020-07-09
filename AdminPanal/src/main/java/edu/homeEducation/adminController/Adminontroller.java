package edu.homeEducation.adminController;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

 
import edu.homeEducation.model.CourseLesson;
import edu.homeEducation.model.Courses;
import edu.homeEducation.model.QuizeQuestion;
import edu.homeEducation.model.Users;
import edu.homeEducation.serviceDao.CourceServiceDao; 
import edu.homeEducation.serviceDao.CourseLessonServiceDao;
import edu.homeEducation.serviceDao.FeedBackServiceDao;
import edu.homeEducation.serviceDao.QuizeQuesionServiceDao;
import edu.homeEducation.serviceDao.UserServiceDao;

@Controller
public class Adminontroller {

	@Autowired
	private UserServiceDao userServiceDao ;
	
	@Autowired
	private CourceServiceDao courceServiceDao;  
	
	@Autowired
	private CourseLessonServiceDao courseLessionServiceDao;
	
	@Autowired
	private QuizeQuesionServiceDao quizeQuesionServiceDao;
	
	@Autowired
	private FeedBackServiceDao feedBackServiceDao;
	
	@RequestMapping("/")
	public String index() {
		return "index";
	}
	
	@RequestMapping("/coursePage")
	public String couorsePage(Model model) {
		model.addAttribute("course", new Courses());
		return"addCourse";
	} 
	
	@RequestMapping("/loginsuccess")
	public String mainPage(Model model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userDetails = auth.getName(); 
    	model.addAttribute("adminDetails",userServiceDao.getByEmail(userDetails));
		model.addAttribute("userData", userServiceDao.getUserList());
		model.addAttribute("courseList", courceServiceDao.getAllCources());
		model.addAttribute("feedbacklist", feedBackServiceDao.getAllFeedback());
		model.addAttribute("lessonName",courseLessionServiceDao.getAllCourcesLesson());
		return "mainpage";
	}
	
	@RequestMapping("/perform_logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		
		return "redirect:/";
		
	}
	
	@RequestMapping("/sessionexpired")
	public String sessionExpire() {
		return "redirect:/";
	}
	
	@RequestMapping("/accessdenied")
	public String accessdenied() {
		System.out.println("accessdenied");
		return "redirect:/";
	}
	
	@RequestMapping("/UserLogin")
	public String loginFaild(Model model) { 
		System.out.println("login faild........................");
		model.addAttribute("message", "Email Or Password is wrong!!");
		return "index";
	}
	
	@GetMapping("/getUserProfile")
	public @ResponseBody Users getUserDetails(HttpServletRequest request) {
		
		Long user_id = Long.parseLong(request.getParameter("userIdData"));
		Users users = userServiceDao.getUserById(user_id);
		return users;
		
	}
	
	@RequestMapping("/courseLessonPage")
	public String couorseLessonPage(Model model) {
		model.addAttribute("courseLesson", new CourseLesson());
		model.addAttribute("courseList", courceServiceDao.getAllCources());
		return"addCourseLesson";
	}
	
	@RequestMapping("/quizPage")
	public String quizPage(Model model) {
		model.addAttribute("quizQuestion", new QuizeQuestion());
		return"addQuiz";
	}
	
	@PostMapping("/addCourse")
	public String addCourse(@ModelAttribute(name = "course") Courses courses,BindingResult result,Model model) {
		if (result.hasErrors()) { 
			model.addAttribute("messages", "Faild!!!!!!!!!");
			return "addCourse";
		}
		else {
			System.out.println(courses.getImage());
			String path="/home/rajput/College_Project/E_Learing_Final/src/main/webapp/resources/courseImages/";
			String imageName= String.valueOf(courses.getCourse_Name())+".png";
			path=path+imageName;
			File f=new File(path);
			System.out.println("path is"+path);
			MultipartFile filedet=courses.getImage();
			if(!filedet.isEmpty())
			{
				try
				{
				  byte[] bytes=filedet.getBytes();
				  FileOutputStream fos=new FileOutputStream(f);
	              			BufferedOutputStream bs=new BufferedOutputStream(fos);
	              			bs.write(bytes);
	              			bs.close();
	             			System.out.println("File Uploaded Successfully");
	             			courses.setCourse_image(imageName);
	             			courceServiceDao.addCources(courses);
	             			model.addAttribute("messages", "Course Add Successflly!!!!!!!!!");
				}
				catch(Exception e)
				{
					System.out.println("Exception Arised"+e);
					model.addAttribute("messages", "Faild!!!!!!!!!");
					return "addCourse";
				}
			}
			else
			{
				System.out.println("File is Empty not Uploaded");
				model.addAttribute("messages", "Image is  not Selected");
				return "addCourse";
				
			}	
		}
		return "mainpage";
	}
	
	
	@PostMapping("/addCourseLession")
	public String addCourseLession(@ModelAttribute(name ="courseLesson")CourseLesson courseLession,BindingResult result,@RequestParam("file") MultipartFile file,Model model)
	{
		if (result.hasErrors()) { 
			model.addAttribute("messages", "Faild!!!!!!!!!");
			return "addCourseLesson";
		}else {
			Courses courses = courceServiceDao.getByCourseId(courseLession.getCourse_id());
			String lessonPath = "/home/rajput/College_Project/E_Learing_Final/src/main/webapp/resources/courses/"+courses.getCourse_Name();
			File file1 = new File(lessonPath);
	        if (!file1.exists()) {
	            if (file1.mkdir()) {
	                System.out.println("Directory is created!");
	            } else {
	                System.out.println("Failed to create directory!");
	            }
	        }
	        if (file1.exists()) {
	        	System.out.println("Path found");
	        	lessonPath = lessonPath+"/"+String.valueOf(courseLession.getLesson_name());
	    		System.out.println("Path is: "+ lessonPath);
	    		if(!file.isEmpty())
	    		{
	    		System.out.println(file);
	    		try
	    			{
	    				byte[] bytes=file.getBytes();
	    				Path  path = Paths.get(lessonPath);
	    				Files.write(path, bytes);
	         			System.out.println("File Uploaded Successfully"); 
	         			courseLession.setLesson_content(courseLession.getLesson_name()); 
	         			courseLession.setLesson_name(courseLession.getLesson_name());
	         			courseLessionServiceDao.addCourcesLesson(courseLession);
	         			model.addAttribute("messages", "Course Lesson Add Successflly!!!!!!!!!");
	    			}
	    		catch(Exception e)
	    		{
	    			System.out.println("Exception Arised"+e);
	    			model.addAttribute("messages", "Faild!!!!!!!!!");
	    			return "addCourseLesson";
	    		}
	    		}
	    	else
	    	{
	    		System.out.println("File is Empty not Uploaded");
	    		model.addAttribute("messages", "File is not Selected");
	    		return "addCourseLesson";
	    	}
			}
		}
		return "mainpage"; 
	}
	
	@GetMapping("/getLessions")
	public @ResponseBody List<CourseLesson> getCourseLession(HttpServletRequest request,Model model) { 
		long id = Long.parseLong(request.getParameter("course_id"));
		List<CourseLesson> courseLessons =courseLessionServiceDao.getByCourseId(id);
		for (CourseLesson courseLesson : courseLessons) {
			System.out.println(courseLesson.getCourse_id() + courseLesson.getLesson_name());
		}
		return courseLessons;
	}
	
	@PostMapping("/addQuiz")
	public String addQuiz(@ModelAttribute(name = "quizQuestion") QuizeQuestion question,BindingResult result,Model model){
		if (result.hasErrors()) { 
			model.addAttribute("messages", "Faild!!!!!!!!!");
			return "addQuiz";
		}else {
			quizeQuesionServiceDao.addQuiz(question);
			model.addAttribute("messages", "Quiz Add Successflly!!!!!!!!!");
		}
		return   "redirect:/quizPage";
		
	}
	
}
