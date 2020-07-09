package edu.homeEducation.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
 
import edu.homeEducation.model.CourseLesson;
import edu.homeEducation.model.Courses;
import edu.homeEducation.model.Quiz;
import edu.homeEducation.model.QuizeQuestion;
import edu.homeEducation.model.UserDoubtsAnswerOfQuestion;
import edu.homeEducation.model.UserDoubtsQuestion;
import edu.homeEducation.model.Users;
import edu.homeEducation.serviceDao.CourceServiceDao; 
import edu.homeEducation.serviceDao.CourseLessonServiceDao;
import edu.homeEducation.serviceDao.QuizServiceDao;
import edu.homeEducation.serviceDao.QuizeQuesionServiceDao;
import edu.homeEducation.serviceDao.UserDoubtsQuestionServiceDao;
import edu.homeEducation.serviceDao.UserServiceDao;

@Controller
public class UserController {

	@Autowired
	private CourceServiceDao courceServiceDao;   
	
	@Autowired
	private CourseLessonServiceDao courseLessionServiceDao; 
	
	@Autowired
	private QuizeQuesionServiceDao quizeQuesionServiceDao; 
	
	@Autowired
	private UserServiceDao userServiceDao;
	
	@Autowired
	private QuizServiceDao quizServiceDao;
	
	@Autowired
	private UserDoubtsQuestionServiceDao userDoubtsQuestionServiceDao;
	
	@RequestMapping("/profile")
	public String profile() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userDetails = auth.getName();
	    if(userDetails=="anonymousUser") {
	    	return"redirect:/";
	    }
		return "profile";
	}
	@RequestMapping("/quiz{courseLesson_id}")
	public String quiz(@PathVariable("courseLesson_id") long courseLession_id, Model model) {
		Courses courses = courceServiceDao.getByCourseId(courseLession_id); 
		model.addAttribute("courseContent", courses); 
		model.addAttribute("courseLession", courseLessionServiceDao.getByCourseId(courses.getCourse_Id())); 
		return "quiz";
	}
	
	@GetMapping("/selectedquiz{courseLesson_id}")
	public String selectedQuizQuistion(@PathVariable("courseLesson_id") long courseLession_id, Model model) {
		long quiz_no =1;
		CourseLesson courseLession = courseLessionServiceDao.getByCourseLessonId(courseLession_id);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userDetails = auth.getName();
	    if(userDetails!="anonymousUser") {
	    	List<QuizeQuestion> quizeQuestion = null;
	    	Users users = userServiceDao.getByEmail(userDetails);
	    	quiz_no  = quizServiceDao.countGivenQuiz(users.getUser_id(),courseLession.getLesson_id());
	    	System.out.println(quiz_no);
	    	if(quiz_no >= 0 && quiz_no < 2) {
	    		quiz_no= quiz_no+1;
	    		 quizeQuestion = quizeQuesionServiceDao.getQuizQuestion(courseLession_id, quiz_no);
	    	}
	    	else {
				model.addAttribute("ifQuizAllReadyGiven", "All Quiz-1 and Quiz-2 allready given!!!");
			}
	    	model.addAttribute("quizNumber",quiz_no); 
			model.addAttribute("courseContent", courceServiceDao.getByCourseId(courseLession.getCourse_id())); 
			model.addAttribute("courseLession", courseLessionServiceDao.getByCourseId(courseLession.getCourse_id()));
			model.addAttribute("lessionName", courseLession);
			model.addAttribute("quiz", new QuizeQuestion());
			model.addAttribute("quizQuestion", quizeQuestion);
			return "quiz";
	    }
		return "redirect:/";
	}
	
	@PostMapping("/updateUser")
	public @ResponseBody String updateUser(@ModelAttribute(name = "userDetails")Users users) {
		if (userServiceDao.updateUser(users)) {
			return "Update SuccessFully!!!!";
		}else {
			return "Update Faild!!!!";
		}	
	}
	
	@PostMapping("/submitQuiz")
	public String calculateScore(@ModelAttribute(name = "quiz")QuizeQuestion quiz,Model model,HttpServletRequest request) {
		Quiz saveQuiz = new Quiz();
		List<QuizeQuestion> quizeQuestion = quizeQuesionServiceDao.getQuizQuestion(quiz.getLesson_Id(),quiz.getQuiz_number());
		int score=0;
		int quiz_number=0;
		List<String> scourseStatus = new ArrayList<String>();
		for (QuizeQuestion quizeQuestion2 : quizeQuestion) {
			Long nuber=quizeQuestion2.getQuestion_id();
			System.out.println(request.getParameter(nuber.toString()));
			quiz_number=quizeQuestion2.getQuiz_number();
			if(quizeQuestion2.getRight_answer().equals(request.getParameter(nuber.toString()))) {
				score+=10;
				scourseStatus.add("Right");
			} 
			else {
				scourseStatus.add("Wrong");
			}
		}
		model.addAttribute("quizNumber", quiz_number);
		CourseLesson courseLession = courseLessionServiceDao.getByCourseLessonId(quiz.getLesson_Id());
		model.addAttribute("lessionName", courseLession);
		model.addAttribute("your_score", score);
		model.addAttribute("your_score_status", scourseStatus);
		Long course_id = Long.parseLong(request.getParameter("course_id"));
		Long user_Id = Long.parseLong(request.getParameter("user_Id"));
		saveQuiz.setCourse_Id(course_id);
		saveQuiz.setUser_Id(user_Id);
		saveQuiz.setQuiz_Marks(score);
		saveQuiz.setLesson_Id(quiz.getLesson_Id());
		saveQuiz.setCourse_Id(courseLession.getCourse_id());
		saveQuiz.setQuiz_Name("Quiz "+quiz_number);
		saveQuiz.setLesson_name(request.getParameter("lesson_name"));
		saveQuiz.setQuize_given_date(LocalDate.now());
		quizServiceDao.addQuiz(saveQuiz);
		return "quizScore";
	}
	
	@RequestMapping("/askindex")
	public String askindex(Model model) {
		model.addAttribute("userDoubts", userDoubtsQuestionServiceDao.getAllQustion());
		model.addAttribute("allUser", userServiceDao.getUserList());
		return "doubtsPlanal";
	}
	
	@RequestMapping("/getSelectedCourse{course_Id}")
	public String getSelectedQuestion(@PathVariable(name = "course_Id")long course_id,Model model) {
		model.addAttribute("selectUserDoubts", userDoubtsQuestionServiceDao.getQustionByCourseID(course_id));
		model.addAttribute("allUser", userServiceDao.getUserList());
		return "doubtsPlanal";
	}
	
	
	@GetMapping("/askTheQuestion")
	public String askTheQuestion(Model model) {
		model.addAttribute("doubtsQuestion", new UserDoubtsQuestion()); 
		return "askTheQuestion";
	}
	
	@RequestMapping("/submitAskedQuestion")
	public @ResponseBody String addQuestion(@ModelAttribute(name = "doubtsQuestion") UserDoubtsQuestion userDoubtsQuestion,BindingResult result) {
		if (result.hasErrors()) {
			return "askTheQuestion";
		}
		LocalDate date = LocalDate.now();
		 userDoubtsQuestion.setLocalDate(date);
		 userDoubtsQuestionServiceDao.addQuestion(userDoubtsQuestion);
		return "Question Sent";
		
	} 
	
	@GetMapping("/questionDescription{question_id}")
	public String queestion(@PathVariable(name = "question_id")long question_id,Model model) {
		UserDoubtsQuestion doubtsQuestion =userDoubtsQuestionServiceDao.getbyId(question_id);
		model.addAttribute("question", doubtsQuestion);
		model.addAttribute("userProfile", userServiceDao.getUserById(doubtsQuestion.getUser_id()));
		model.addAttribute("givenAnswers", userDoubtsQuestionServiceDao.getByUserDoubtsQuestionId(doubtsQuestion.getUser_doubt_question_id()));
		model.addAttribute("allAnswer", userDoubtsQuestionServiceDao.countAnswer(doubtsQuestion.getUser_doubt_question_id()));
		model.addAttribute("youeAnswer", new UserDoubtsAnswerOfQuestion());
		return"questionDescription";
	}
	
	
	@PostMapping("/postedAnswer")
	public @ResponseBody String postAnswer(@ModelAttribute(name = "youeAnswer") UserDoubtsAnswerOfQuestion answerOfQuestion,BindingResult result) {
		if (result.hasErrors()) {
			return "Sorry Post Failed!!";
		}
		 LocalDate date = LocalDate.now();
		 answerOfQuestion.setLocalDate(date);
		userDoubtsQuestionServiceDao.addAnswerOfQuestion(answerOfQuestion);
		return "Post SuccessFull!!";
	}
}
