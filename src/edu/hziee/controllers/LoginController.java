package edu.hziee.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.hziee.models.User;
import edu.hziee.services.UserService;
import edu.hziee.util.MD5String;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping()
	public String get(HttpServletRequest req,HttpServletResponse res){
		
		if(req.getMethod().equals("POST")){
			HttpSession session = req.getSession();
			User user = new User();
			user.setUsername(req.getParameter("username"));
			user.setPassword(req.getParameter("password"));
			User user1 = userService.checkLogin(user);
			if(user1 != null){
				session.setAttribute("username", user1.getUsername());
				session.setAttribute("showname", user1.getShowname());
				session.setAttribute("userId", user1.getId());
				return "redirect:/activity";
			}else{
				return "redirect:/login";
			}
		}
		return "/login/login";
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest req,HttpServletResponse res){
		if(req.getMethod().equals("POST")){
			
			System.out.println(req.getParameter("password"));
			User user = new User();
			user.setUsername(req.getParameter("username"));
			user.setPassword(MD5String.getMD5Str(req.getParameter("password")));
			user.setShowname(req.getParameter("showname") == null ? 
									"无名大侠":req.getParameter("showname"));
			user.setPower(1);
			if(userService.register(user) == 0){
				return "redirect:/login";
			}else {
				return "redirect:/login/register";
			}
		}
		return "login/register";
	}
	
	@RequestMapping("/cancel")
	public String cancel(HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		session.removeAttribute("username");
		session.removeAttribute("showname");
		return "redirect:/login";
	}
	
}
