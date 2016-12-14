package edu.hziee.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import edu.hziee.mappers.ActivitysMapper;
import edu.hziee.mappers.AttendactivityMapper;
import edu.hziee.models.Activitys;
import edu.hziee.models.Attendactivity;

@Repository
@Transactional
public class AttendService {

	@Autowired
	private AttendactivityMapper attendMapper;
	
	@Autowired
	private ActivitysMapper activitysMapper;
	
	public int attend(Attendactivity a){
		return attendMapper.insert(a);
	}
	public Attendactivity selectByUserIdAndActivityId(int userId,int activityId){
		return attendMapper.selectByUserIdAndActivityId(userId,activityId);
	}
	
	
}
