package edu.hziee.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.hziee.models.User;
import edu.hziee.services.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("/user")
	public String userManage(Model model,HttpServletRequest req, HttpServletResponse res){
		List<User> users = adminService.selectUser();
		System.out.println(users.get(0));
		model.addAttribute("items", users);
		return "admin/usermanage";
	}
	
	@RequestMapping("/activity")
	public String activityManage(Model model,HttpServletRequest req, HttpServletResponse res){
		
		return "admin/usermanage";
	}
}
