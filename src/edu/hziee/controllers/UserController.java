package edu.hziee.controllers;

import java.io.IOException;
import java.io.PrintWriter;
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
import edu.hziee.models.CollectactivityKey;
import edu.hziee.models.User;
import edu.hziee.services.ActivityService;
import edu.hziee.services.AttendService;
import edu.hziee.services.CollectService;
import edu.hziee.services.UserService;

@Controller
@RequestMapping("/userinfo")
public class UserController {
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private AttendService attendService;
	
	@Autowired
	private CollectService collectService;
	
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
		if(req.getMethod().equals("POST")){
			int activityId = Integer.parseInt(req.getParameter("activityId"));
			CollectactivityKey c = new CollectactivityKey(activityId, userId);
			PrintWriter out;
			try {
				out = res.getWriter();
				if(collectService.delete(c) != 0){
					out.write("{\"id\":\"1\"}");
				}else{
					out.write("{\"id\":\"2\"}");
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
		List<Activitys> a = activityService.selectCollectActivityByUserId(userId);
		
		model.addAttribute("activitys", a);
		return "userinfo/collect";
	}
	
	@RequestMapping("/attended")
	public String attended(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");
		List<Activitys> a = activityService.selectAttendActivityByUserId(userId);
		
		model.addAttribute("activitys", a);
		return "userinfo/attend";
	}
	
	@RequestMapping("/cancelAttend")
	public String cancelAttend(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");
		int activityId = Integer.parseInt(req.getParameter("activityId"));
		Attendactivity a = new Attendactivity(activityId, userId);
		PrintWriter out;
		try {
			out = res.getWriter();
			if(attendService.delete(a) != 0){
				out.write("{\"id\":\"1\"}");
			}else{
				out.write("{\"id\":\"2\"}");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/checking")
	public String checking(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		int userId = (int)session.getAttribute("userId");
		List<Activitys> list = activityService.selectWaitCheckActivityByUserId(userId);
		model.addAttribute("activitys", list);
		return "userinfo/checking";
	}
	@RequestMapping("/public")
	public String publiced(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");
		if(req.getMethod().equals("POST")){
			int activityId = Integer.parseInt(
								req.getParameter("activityId"));
			int co = collectService.deleteByActivityId(activityId);
			int at = attendService.deleteByActivityId(activityId);
			int ac = activityService.delete(activityId);
			PrintWriter out;
			try {
				out = res.getWriter();
				if(at != 0 && co != 0&& ac != 0){
					out.write("{\"id\":\"1\"}");
				}else{
					out.write("{\"id\":\"2\"}");
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			return null;
		}
		List<Activitys> a = activityService.selectPublicActivityByUserId(userId);
		
		model.addAttribute("activitys", a);
		return "userinfo/public";
	}
	
	@RequestMapping("/past")
	public String past(Model model,HttpServletRequest req,HttpServletResponse res){
		
		return "userinfo/past";
	}
	
//	用户审核未通过的活动页
	@RequestMapping("/checkedno")
	public String checkNo(Model model,HttpServletRequest req,HttpServletResponse res) throws IOException{
		HttpSession session = req.getSession();
		int userId = (int)session.getAttribute("userId");
		if(req.getMethod().equals("POST")){
			int activityId = Integer.parseInt(req.getParameter("activityId"));
			System.out.println(activityId);
			int n = activityService.updateActivityById(activityId, -1);
			PrintWriter out = res.getWriter();
			if(n > 0){
				out.write("{\"isUpdate\":true}");
			}else{
				out.write("{\"isUpdate\":false}");
			}
			return null;
		}
		List<Activitys> list = activityService.selectByPassAndPowerAndUserId(2, 1, userId);
		model.addAttribute("activitys", list);
		return "userinfo/checkno";
	}
	
	@RequestMapping("/{id}")
	public String userindo(@PathVariable int id,Model model,HttpServletRequest req,HttpServletResponse res){
		User user = userService.selectById(id);
		model.addAttribute("user", user);
		return "userinfo/userinfo";
	}
}
