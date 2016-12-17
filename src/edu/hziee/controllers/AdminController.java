package edu.hziee.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hziee.models.Activitys;
import edu.hziee.models.User;
import edu.hziee.services.AdminService;
import edu.hziee.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping()
	public String admin(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		if (req.getMethod().equals("POST")) {
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			User u = new User();
			u.setUsername(username);
			u.setPassword(password);
			User user = userService.checkAdmin(u);
			if(user != null){
				session.setAttribute("aUsername", user.getUsername());
				session.setAttribute("aShowname", user.getShowname());
				session.setAttribute("aUserId", user.getId());
			}
			session.setAttribute("ausername", "");
			return "admin/manage";
		}else if(session.getAttribute("aUsername") != null){
			return "admin/manage";
		}
		return "login/admin";
	}
	
	/**
	 * 
	 * @param model
	 * @param req
	 * @param res
	 * @param model type 
	 * 		  1： 用户管理界面; 2：活动管理界面
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping("/user")
	public String userManage(Model model,HttpServletRequest req, HttpServletResponse res) throws IOException{
		if(req.getMethod().equals("POST")){
			int userId = Integer.parseInt(req.getParameter("userId"));
			PrintWriter out = res.getWriter();
			int n = adminService.updatePowerByUserId(userId, -1);
			if(n > 0){
				out.write("{\"isUpdate\":true}");
			}else{
				out.write("{\"isUpdate\":false}");
			}
			return null;
		}
		List<User> users = adminService.selectUser();
		System.out.println(users.get(0));
		model.addAttribute("items", users);
		model.addAttribute("type", 1);
		return "admin/usermanage";
	}
	
	@RequestMapping("/activity")
	public String activityManage(Model model,HttpServletRequest req, HttpServletResponse res) throws IOException{
		if(req.getMethod().equals("POST")){
			String doType = req.getParameter("doType");
			int activityId = Integer.parseInt(req.getParameter("activityId"));
			PrintWriter out = res.getWriter();
			if(doType.equals("pass")){
				adminService.updatePass(activityId, 1);
				out.write("{\"pass\":1}");
			}else if(doType.equals("nopass")){
				adminService.updatePass(activityId, 2);
				out.write("{\"pass\":2}");
			}
			return null;
		}
		List<Activitys> activitys = adminService.selectActivity();
		model.addAttribute("items", activitys);
		model.addAttribute("type", 2);
		return "admin/usermanage";
	}
	
	@RequestMapping("/nochecked")
	public String noCheckManage(Model model,HttpServletRequest req, HttpServletResponse res) throws IOException{
		if(req.getMethod().equals("POST")){
			int activityId = Integer.parseInt(req.getParameter("activityId"));
			PrintWriter out = res.getWriter();
			int n = adminService.updatePass(activityId, 1);
			if(n > 0){
				out.write("{\"isUpdate\":true,\"word\":\"该活动已通过审核\"}");
			}else{
				out.write("{\"isUpdate\":false,\"word\":\"此操作失败\"}");
			}
			return null;
		}
		List<Activitys> activitys = adminService.selectNoPassActivity();
		model.addAttribute("items", activitys);
		model.addAttribute("type", 3);
		return "admin/usermanage";
	}
	
	@RequestMapping("/checked")
	public String checkedManage(Model model,HttpServletRequest req, HttpServletResponse res) throws IOException{
		if(req.getMethod().equals("POST")){
			int activityId = Integer.parseInt(req.getParameter("activityId"));
			PrintWriter out = res.getWriter();
			int n = adminService.updatePass(activityId, 2);
			if(n > 0){
				out.write("{\"isUpdate\":true,\"word\":\"该活动审核不通过\"}");
			}else{
				out.write("{\"isUpdate\":false,\"word\":\"此操作失败\"}");
			}
			return null;
		}
		List<Activitys> activitys = adminService.select();
		model.addAttribute("items", activitys);
		model.addAttribute("type", 4);
		return "admin/usermanage";
	}
}
