package edu.hziee.controllers;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.zlzkj.core.util.Fn;
import edu.hziee.models.Activitys;
import edu.hziee.models.Attendactivity;
import edu.hziee.models.User;
import edu.hziee.services.ActivityService;
import edu.hziee.services.AttendService;
import sun.awt.ModalExclude;

@Controller
@RequestMapping("/activity")
public class ActivityController {

	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private AttendService attendService;
	
	@RequestMapping()
	public String list(Model model){
		List<Activitys> list = activityService.selectActivitys();
		System.out.println(list);
		model.addAttribute("activitys", list);
		return "activity/activitys";
	}
	
	@RequestMapping("/start")
	public String start(Model model,HttpServletRequest req,HttpServletResponse res) throws ParseException{
		if(req.getMethod().equals("POST")){
			HttpSession session = req.getSession();
			String name = req.getParameter("name");
			String place = req.getParameter("place");
			int count = Integer.parseInt(req.getParameter("count"));
			int startTime = activityService.DateToLong(
									req.getParameter("startTime"));
			int endTime = activityService.DateToLong(
									req.getParameter("endTime"));
			int userId = (int) session.getAttribute("userId");
//			System.out.println(Fn.date(activityService.DateToLong(endTime), "yyyy-MM"));
			if(activityService.insertActivity(userId,name,place,count,startTime,endTime) == 1){
				return "redirect:/activity";
			}else {
				model.addAttribute("fail", "无法发起活动");
				return "redirect:/activity/start";
			}
		}
		return "activity/start";
	}
	
	@RequestMapping("/{id}")
	public String detail(@PathVariable int id,Model model,HttpServletRequest req,HttpServletResponse res) {
		Activitys activity = activityService.selectByPrimaryKey(id);
		model.addAttribute("activity", activity);
		return "activity/detail";
	}
	
	@RequestMapping("/attend")
	public String attend(Model model,HttpServletRequest req,HttpServletResponse res) {
		HttpSession session = req.getSession();
		int activityId = Integer.parseInt(req.getParameter("id"));
		int userId = (int) session.getAttribute("userId");
		Attendactivity a = new Attendactivity();
		a.setActivityId(activityId);
		a.setUserId(userId);
		if(attendService.attend(a) == 1){
			return Fn.ajaxReturn(res, null,"已参加",1);
		}else{
			return Fn.ajaxReturn(res, null,"参加失败",1);
		}
	}
	
	@RequestMapping("/collect")
	public String collect(Model model,HttpServletRequest req,HttpServletResponse res){
		
		return null;
	}
	
}