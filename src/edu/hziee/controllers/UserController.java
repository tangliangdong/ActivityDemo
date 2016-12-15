package edu.hziee.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hziee.models.Activitys;
import edu.hziee.models.Attendactivity;
import edu.hziee.models.User;
import edu.hziee.services.ActivityService;
import edu.hziee.services.AttendService;
import edu.hziee.services.UserService;

@Controller
@RequestMapping("/userinfo")
public class UserController {
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private AttendService attendService;
	
	@Autowired
	private UserService userService;

	@RequestMapping()
	public String get(Model model,HttpServletRequest req,HttpServletResponse res){
		return "userinfo/user";
	}
	
	@RequestMapping("/collected")
	public String collected(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");
		List<Activitys> a = activityService.selectCollectActivityByUserId(userId);
		System.out.println(a.get(0).getuList().get(0).getShowname());
		
		model.addAttribute("activitys", a);
		return "userinfo/collect";
	}
	
	@RequestMapping("/attended")
	public String attended(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");
		List<Activitys> a = activityService.selectAttendActivityByUserId(userId);
		System.out.println(a.get(0).getuList().get(0).getShowname());
		
		model.addAttribute("activitys", a);
		return "userinfo/attend";
	}
	
	@RequestMapping("/cancelAttend")
	public String cancelAttend(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");
		int activityId = Integer.parseInt(req.getParameter("activityId"));
//		List<Activitys> list = activityService.selectActivitysByUserId(userId);
		
//		model.addAttribute("activitys", list);
		return "userinfo/attend";
	}
	
	@RequestMapping("/checking")
	public String checking(Model model,HttpServletRequest req,HttpServletResponse res){
		
		return "userinfo/checking";
	}
	@RequestMapping("/public")
	public String publiced(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");
		List<Activitys> a = activityService.selectPublicActivityByUserId(userId);
		System.out.println(a.get(0).getuList().get(0).getShowname());
		
		model.addAttribute("activitys", a);
		return "userinfo/public";
	}
	@RequestMapping("/past")
	public String past(Model model,HttpServletRequest req,HttpServletResponse res){
		
		return "userinfo/past";
	}
	@RequestMapping("/{id}")
	public String userindo(@PathVariable int id,Model model,HttpServletRequest req,HttpServletResponse res){
		
		return "userinfo/userinfo";
	}
}
