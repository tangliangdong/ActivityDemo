package edu.hziee.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.Iterator;
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
import edu.hziee.models.CollectactivityKey;
import edu.hziee.models.User;
import edu.hziee.services.ActivityService;
import edu.hziee.services.AttendService;
import edu.hziee.services.CollectService;
import net.sf.json.JSONObject;
import net.sf.json.JSONString;
import sun.awt.ModalExclude;

@Controller
@RequestMapping("/activity")
public class ActivityController {

	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private AttendService attendService;
	
	@Autowired
	private CollectService collectService;
	
//	进入活动页
	@RequestMapping()
	public String list(Model model) throws ParseException{
		List<Activitys> list = activityService.selectActivitys();
//		for (Activitys activity : list) {
//			activity.start = activityService.longToDate(activity.getStartTime());
//			activity.end = activityService.longToDate(activity.getEndTime());
//			System.out.println(activity.start);
//		}
//		System.out.println(list.get(0).start);
		model.addAttribute("activitys", list);
		return "activity/activitys";
	}
	
//	发起活动
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
	
//	活动详情页
	@RequestMapping("/{id}")
	public String detail(@PathVariable int id,Model model,HttpServletRequest req,HttpServletResponse res) {
		HttpSession session = req.getSession();
		int userId = (int) session.getAttribute("userId");
		Activitys activity = activityService.selectByPrimaryKey(id);
		if(attendService.selectByUserIdAndActivityId(userId, id) != null){
			model.addAttribute("isAttended", true);
		}else{
			model.addAttribute("isAttended", false);
		}
		if(collectService.selectByUserIdAndActivityId(userId, id) != null){
			model.addAttribute("isCollected", true);
		}else{
			model.addAttribute("isCollected", false);
		}
		model.addAttribute("activity", activity);
		return "activity/detail";
	}
	
//	参与活动
	@RequestMapping("/attend")
	public String attend(Model model,HttpServletRequest req,HttpServletResponse res) {
		HttpSession session = req.getSession();
		res.setContentType("application/json");
		int activityId = Integer.parseInt(req.getParameter("id"));
		int userId = (int) session.getAttribute("userId");
		Attendactivity a = new Attendactivity();
		
		a.setActivityId(activityId);
		a.setUserId(userId);
		if(attendService.attend(a) == 1){
			try {
				PrintWriter out = res.getWriter();
				out.write("{\"id\":\"1\",\"remind\":\"您已参与\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}else{
			try {
				PrintWriter out = res.getWriter();
				out.write("{\"id\"=\"2\",\"remind\"=\"参与失败\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
	
//	收藏活动
	@RequestMapping("/collect")
	public String collect(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		res.setContentType("application/json");
		int activityId = Integer.parseInt(req.getParameter("id"));
		int userId = (int) session.getAttribute("userId");
		CollectactivityKey c = new CollectactivityKey();
		
		c.setActivityId(activityId);
		c.setUserId(userId);
		if(collectService.collect(c) == 1){
			try {
				PrintWriter out = res.getWriter();
				out.write("{\"id\":\"1\",\"remind\":true,\"btnWord\":\"取消收藏\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}else{
			try {
				PrintWriter out = res.getWriter();
				out.write("{\"id\"=\"2\",\"remind\"=false,\"btnWord\":\"收藏活动\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
//	取消收藏
	@RequestMapping("/cancelCollect")
	public String cancelCollect(Model model,HttpServletRequest req,HttpServletResponse res){
		HttpSession session = req.getSession();
		res.setContentType("application/json");
		int activityId = Integer.parseInt(req.getParameter("id"));
		int userId = (int) session.getAttribute("userId");
		CollectactivityKey c = new CollectactivityKey();
		
		c.setActivityId(activityId);
		c.setUserId(userId);
		if(collectService.cancelCollect(c) == 1){
			try {
				PrintWriter out = res.getWriter();
				out.write("{\"id\":\"1\",\"remind\":true,\"btnWord\":\"收藏活动\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}else{
			try {
				PrintWriter out = res.getWriter();
				out.write("{\"id\"=\"2\",\"remind\"=false,\"btnWord\":\"取消收藏\"}");
			} catch (IOException e) {
				e.printStackTrace();
			}
			return null;
		}
	}
	
}
