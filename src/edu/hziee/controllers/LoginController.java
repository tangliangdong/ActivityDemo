package edu.hziee.controllers;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.hziee.models.User;
import edu.hziee.services.UserService;
import edu.hziee.util.MD5String;
import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private UserService userService;
	
//	跳转到登录页面
	@RequestMapping()
	public String get(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		session.removeAttribute("aUsername");
		session.removeAttribute("aShowname");
		session.removeAttribute("aUserId");
		if(req.getMethod().equals("POST")){
			User user = new User();
			user.setUsername(req.getParameter("username"));
			user.setPassword(req.getParameter("password"));
			User user1 = userService.checkLogin(user);
			if(user1 != null){
				if(user1.getPower() == 1 ){
					session.setAttribute("username", user1.getUsername());
					session.setAttribute("showname", user1.getShowname());
					session.setAttribute("userId", user1.getId());
					return "redirect:/activity";
				}else{
					model.addAttribute("loginRemind", "此账户已被冻结");
					return "/login/login";
				}
			}else{
				model.addAttribute("loginRemind", "账号或密码不存在");
				return "/login/login";
			}
		}
		return "/login/login";
	}
	
//	注册账号
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
	
	@RequestMapping(value="/checkUser",method = RequestMethod.POST)
	public String checkUser(Model model,HttpServletRequest req,HttpServletResponse res) throws IOException{
		res.setContentType("application/json");
		String username = req.getParameter("username");
		PrintWriter out = res.getWriter();
		System.out.println(username);
		User user = userService.selectByUsername(username);
		if(user != null){
			System.out.println(1);
			out.write("{\"hasUser\":true}");
		}else{
			System.out.println(2);
			out.write("{\"hasUser\":false}");
		}
		return null;
	}
	
//	普通用户注销
	@RequestMapping("/cancel")
	public String cancel(HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		session.removeAttribute("username");
		session.removeAttribute("showname");
		return "redirect:/login";
	}
	
}
